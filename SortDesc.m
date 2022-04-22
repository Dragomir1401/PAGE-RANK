function [ns R] = SortDesc(ns, R)
  % Function to sort descendent R and nodes array
  len = length(R);
  for a = 1 : (len - 1)
    for b = a + 1 : len
       if R(a) <= R(b)
          aux = R(b);
          R(b) = R(a);
          R(a) = aux;
   
          aux = ns(b);
          ns(b) = ns(a);
          ns(a) = aux;
       endif
     endfor
   endfor
endfunction