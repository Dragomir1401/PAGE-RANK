function y = Apartenenta(x, val1, val2)
  % Calculate function values in order to remain continous
  % In form of vector to calculate directly B in PageRank
  y(x < val1) = 0;
  y(x > val2) = 1;
  condition = x >= val1 & x <= val2;
  y(condition) = (x(condition) - val1) / (val2 - val1);
endfunction