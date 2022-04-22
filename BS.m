function [res] = BS (A, b)
  % Function which perform backward substitution
  n = length(A);
  res = zeros(n, 1);
  % For each line use the last result to replace
  % in the formula
  for k = n : -1 : 1
    s = sum(A(k, k + 1 : n) * res(k + 1 : n));
    res(k) = (b(k) - s) / A(k, k);
  endfor
endfunction
