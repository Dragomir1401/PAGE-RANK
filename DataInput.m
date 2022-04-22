function [mat, N] = DataInput (nume)
  % Function which parses the input from files
  % without the last 2 numbers
  % Open file
  fisier = fopen(nume, "r");

  % Get the number of pages
  linie = fgets(fisier);
  linie = str2num(linie);

  N = linie;
  % Initialize mat and neighbours array
  mat = zeros(linie);
  neighbours = ones(N, 1);
  % For each page read the neighbours
  for i = [1 : linie]
      elems = fgets(fisier);
      elems = str2num([elems]);
      % Make the neighbours array
      neighbours(elems(1)) = elems(2);
      % Create the matrix of neighbours
      for j = [3 : length(elems)]
        mat(i, elems(j)) = 1;
      endfor
      % Put 0 on first diagonal of matrix
      if mat(i,i) > 0
        mat(i, i) = 0;
        neighbours(i) -= 1;
      endif
  endfor

  % Transpose the matrix to match the nodes neighbours
  mat = mat';
  % Normalize matrix elements
  for i = 1 : N
    mat(:, i) = mat(:, i) / neighbours(i);
  endfor

fclose(fisier);
endfunction
