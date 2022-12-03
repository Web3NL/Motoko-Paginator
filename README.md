# Motoko-Paginator
A pagination library for Motoko  

`class Paginator<T>(iter : Iter<T>, n : Nat)`  
Paginator class, makes n items per page  
  
`function size() : Nat`  
Returns number of pages in the Paginator  

`function getPage(n : Nat) : ?Page`  
Returns a specific Page   

`function getAllPages() : Pages`  
Returns all pages  

# Remarks  
__For efficiency__:  
Consumes the iter only once.  
Use List.push to construct a page and a page array.

__For shared functions:__  
Converts to array of arrays for shared return type  

