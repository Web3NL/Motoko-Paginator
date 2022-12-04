import Iter "mo:base/Iter";
import List "mo:base/List";

module Paginator {
  type Iter<T> = Iter.Iter<T>;

  // A page is an array of type T
  public type Page<T> = [T];

  // Pages is an array of Page elements
  public type Pages<T> = [Page<T>];

  // n is the desired number of entries in each page
  public class Paginator<T>(iter : Iter<T>, n : Nat) {
    var pageList = List.nil<[T]>();

    label l loop {
      var end = false;
      var page = List.nil<T>();

      label f for (i in Iter.range(1, n)) {
        switch (iter.next()) {
          case (?value) {
            page := List.push<T>(value, page);
          };
          case (null) {
            end := true;
            break f;
          };
        };
      };

      // reverse to get the right order
      page := List.reverse(page);

      let vals = List.toArray(page);
      pageList := List.push<[T]>(vals, pageList);

      if (end) { break l };
    };

    // reverse to get the right order
    pageList := List.reverse(pageList);

    // Create the paged data variable
    let pages : Pages<T> = List.toArray(pageList);

    // return number of pages in this Paginator
    public func size() : Nat { pages.size() };

    // get a specific page or null if out of bound
    public func getPage(n : Nat) : ?Page<T> {
      // page indexing start at 1 so asking for 0 gives null
      if (n == 0) return null;

      if (pages.size() >= n) {
        // array indexing starts with 0 so subtract 1
        return ?pages[n -1];
      } else { return null };
    };

    // get all pages
    public func getAll() : Pages<T> {
      pages;
    };

    // get first page
    public func getFirst() : Page<T> {
      pages[0];
    };

    // get last page
    public func getLast() : Page<T> {
      pages[pages.size() -1];
    };

    // get next page given currentPage
    public func getNext(currentPage : Nat) : ?Page<T> {
      if (
        pages.size() == 0 or pages.size() == 1 or (currentPage >= pages.size()),
      ) {
        return null;
      } else {
        // array indexing starts at 0, so dont have to add 1
        return ?pages[currentPage];
      };
    };

    // get previous page given currentPage
    public func getPrevious(currentPage : Nat) : ?Page<T> {
      if (
        pages.size() <= 1 or currentPage <= 1 or currentPage > pages.size()
      ) {
        return null;
      } else {
        // array indexing starts at 0, so dont have to add 1
        return ?pages[currentPage - 2];
      };
    };

  };
};
