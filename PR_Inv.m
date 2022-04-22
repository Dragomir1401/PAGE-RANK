function B = PR_Inv(A)
	% Function which calculates inverse of matrix using
  % GramSchmidt factorization algorithm
  n = length(A);
  % Get the decomposition in Q and R
  [Q R] = GramSchmidt(A);
  
  for i = 1 : n
    % R * B(column i) = Q'(column i) => get column i from B
    B(:,i) = BS(R, Q'(:,i));
  endfor
endfunction