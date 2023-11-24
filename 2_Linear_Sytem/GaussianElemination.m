function gaussian_elimination(A, b)
    % Check for square matrix
    [m, n] = size(A);
    if m ~= n
        disp('Matrix A should be square');
        return;
    end

    % Check for consistent matrix
    if rank(A) ~= rank([A, b'])
        disp('System is inconsistent or has infinite solutions');
        return;
    end

    augmented = [A, b];

    disp('Initial augmented matrix:');
    disp(augmented);

    % Apply Gaussian elimination
    for k = 1:m-1
        for i = k+1:m
            factor = augmented(i, k) / augmented(k, k);
            for j = k:m+1
                augmented(i, j) = augmented(i, j) - factor * augmented(k, j);
            end
        end
        disp(['After ', num2str(k), ' elimination step(s):']);
        disp(augmented);
    end

    % Back substitution
    x = zeros(m, 1);
    for i = m:-1:1
        x(i) = augmented(i, m+1) / augmented(i, i);
        for j = i-1:-1:1
            augmented(j, m+1) = augmented(j, m+1) - augmented(j, i) * x(i);
        end
    end

    disp('Solution:');
    disp(x);

    % Plotting the solution
    figure;
    plot(x, 'o-', 'LineWidth', 2, 'MarkerSize', 10);
    xlabel('Variable Index');
    ylabel('Variable Value');
    title('Gaussian Elimination Solution');
    grid on;
end

% Example usage
A = [2, -1, 1; -3, 2, 1; -2, 1, 2];
b = [8; -11; -3];

gaussian_elimination(A, b);
