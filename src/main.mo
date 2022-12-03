// Testing the Paginator library

import Paginator "Paginator";
import Iter "mo:base/Iter";
import List "mo:base/List";

actor {
  // Using Nats as test data
  let iter = Iter.range(1, 13);

  // choosing 4 entries per page
  let n = 4;

  let paginator = Paginator.Paginator<Nat>(iter, n);

  public query func size() : async Nat {
    paginator.size();
  };

  public query func getPage(n : Nat) : async ?Paginator.Page<Nat> {
    paginator.getPage(n);
  };

  public query func getAllPages() : async Paginator.Pages<Nat> {
    paginator.getAllPages()
  }
};
