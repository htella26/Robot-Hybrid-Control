function e = tr2diff_sym(T1, T2)
    % TR2DIFF Compute the difference between two transformation matrices.
    %
    %   e = tr2diff(T1, T2)
    %
    % Inputs:
    %   T1 - Current transformation matrix (symbolic)
    %   T2 - Target transformation matrix (symbolic)
    %
    % Outputs:
    %   e  - Symbolic error vector
    
    % Compute position difference
    dp = T2(1:3, 4) - T1(1:3, 4);
    
    % Return error as a 6x1 vector (position error)
    e = [dp; 0; 0; 0];  % Assume no orientation error
end
