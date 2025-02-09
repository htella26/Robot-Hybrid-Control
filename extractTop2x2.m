function J_top = extractTop2x2(J)
% Extract the top 2x2 from the input 6x2 matrix
%
% Input:
%   J - A 6x2 matrix (e.g., Jacobian matrix)
% Output:
%   J_top - The top 2x2 portion of the input matrix

    % Declare output size explicitly
    J_top = zeros(2, 2); % Pre-allocate output matrix

    % Check if input is 6x2
    if size(J, 1) ~= 6 || size(J, 2) ~= 2
        error('Input matrix must be 6x2.');
    end

    % Extract the top 2x2 submatrix
    J_top = J(1:2, :); % Extract the top rows
end
