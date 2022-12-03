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
