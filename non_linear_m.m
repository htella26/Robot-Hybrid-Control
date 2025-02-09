function M = non_linear_m(theta)
    
    l1 = 1;
    l2 = 1;
    m1 = 3;
    m2 = 3;
    
    % Extract theta1 and theta2 from the input
    theta1 = theta(1);
    theta2 = theta(2);
    
    % Compute each term of the matrix
    m11 = (l2^2 * m2) + (2 * l1 * l2 * m2 * cos(theta2)) + (l1^2 * (m1 + m2));
    m12 = (l2^2 * m2) + (l1 * l2 * m2 * cos(theta2));
    m13 = (l2^2 * m2);
    
    % Assemble the 2x2 matrix M
    M = [m11, m12; 
         m12, m13];
end
