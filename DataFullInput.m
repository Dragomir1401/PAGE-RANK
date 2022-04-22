function [mat, N, nodes, val1, val2] = DataFullInput (nume)
  % Function which parses the full input from files
  % Open file
  fisier = fopen(nume, "r");

  % Get the number of pages
  linie = fgets(fisier);
  linie = str2num(linie);

  N = linie;
  % Initialize nodes and mat and neighbours array
  nodes = [];
  mat = zeros(linie);
  neighbours = ones(N, 1);
  % For each page read the neighbours
  for i = [1 : linie]
      elems = fgets(fisier);
      elems = str2num([elems]);
      % Make the nodes array
      nodes = [nodes; elems(1)];
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
  % Get vals for last request
  val1 = str2num(fgets(fisier));
  val2 = str2num(fgets(fisier));

  fclose(fisier);
endfunction
