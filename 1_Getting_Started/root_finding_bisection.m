function retval = root_finding_bisection (input1, input2)
  % Define the function
  f = @(x) x^2 - 4;

  % Define the interval [a, b] where you expect the root to be
  a = 0;
  b = 10;

  % Set the tolerance for convergence
  tolerance = 1e-6;

  % Initialize variables
  iterations = 0;
  root = 0;

  % Create vectors to store data for plotting
  x_values = [];
  y_values = [];

  % Bisection algorithm
  while (b - a) / 2 > tolerance
      x = (a + b) / 2;
      if f(a) * f(x) < 0
          b = x;
      else
          a = x;
      end

      % Store data for plotting
      iterations = iterations + 1;
      x_values = [x_values, iterations];
      y_values = [y_values, x];

      % Update root estimate
      root = (a + b) / 2;
  end

  fprintf('Root found after %d iterations: %f\n', iterations, root);
  fprintf('y_values = [');
  for i = 1:length(y_values)
    fprintf('%f\n', y_values(i));
  end
  fprintf(']\n');
endfunction
