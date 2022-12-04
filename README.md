# Motoko-Paginator
A pagination library for Motoko  

`type Page<T> = [T]`

`type Pages<T> = [Page<T>]`  

__`class Paginator<T>(iter : Iter<T>, n : Nat)`__  
  
`function size() : Nat`  

`function getPage(n : Nat) : ?Page<T>`  

`function getAll() : Pages<T>`  

`function getFirst() : Page<T>`  

`function getLast() : Page<T>`  

`function getNext() : ?Page<T>`  

`function getPrevious() : ?Page<T>`  

# Remarks  
__For efficiency__:  
Consumes the iter only once.  
Use List.push to construct a page and a page array.

__For shared functions:__  
Converts to array of arrays for shared return type  

