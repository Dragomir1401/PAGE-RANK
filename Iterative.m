function R = Iterative(nume, d, eps)
  % Function to calculate PageRank index using
  % iterative algorithm
  % Get input
  [mat N] = DataInput(nume);
  % Initilize R and R_old
  R = zeros(N, 1);
  R_old = zeros(N, 1);
  R(:, 1) = 1 / N;
  % Vector to make scalar to array
  vectorization = ones(N, 1);
  % Calculate until reached error wanted
  while (norm(R - R_old, 2) >= eps)
      R_old = R;
      R = d * mat * R_old + ((1 - d) / N) * vectorization;
  endwhile

  R = R_old;
endfunction

