function R = Algebraic(nume, d)
  % Function which calculates PageRank array using algebric methods
  % We use inverse algorithm and GramSchmidt decomposition
  [mat N] = DataInput(nume);

  R = zeros(N, 1);

  I = eye(N);

  inverse = PR_Inv(I - d * mat);

  b(1:N, 1) = (1 - d) / N;

  R = inverse * b;

endfunction