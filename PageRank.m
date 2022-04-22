function [R1 R2] = PageRank(nume, d, eps)
  % Calculates PageRank index for each input
  % writes in input.out
  % Get input
  [mat N nodes val1 val2] = DataFullInput(nume);
  % Concatenate name for output file
  output = [nume ".out"];
  output1 = fopen(output, "w");
  % Get array for first and second algorithm
  R = Iterative(nume, d ,eps);
  R1 = Algebraic(nume, d);
  % Sort nodes based on second array
  [nodes_sorted, R3] = SortDesc(nodes, R1);
  N = length(R);
  % Print first array
  fprintf(output1, "%d\n", N);
  for i = 1 : N
    fprintf(output1, "%.6f\n", R(i));
  endfor
  fprintf(output1,"\n");

  % Print second array
  for i = 1 : N
    fprintf(output1, "%.6f\n", R1(i));
  endfor

  % Get array for belongings
  B = Apartenenta(R3, val1, val2);

  % Print the grade
  fprintf(output1 ,"\n");
  for i = 1 : N
      fprintf(output1, '%d %d %.6f\n', i, nodes_sorted(i), B(i));
  endfor

  % Close file
  fclose(output1);
endfunction