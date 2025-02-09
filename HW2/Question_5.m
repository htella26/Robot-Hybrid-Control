function T = DH_Transformation(theta, d, a, alpha)
    
    % I defined individual transformation matrices from the figure 3.15 of
    % the book
    
    % Rotation around x by alpha
    Rx_alpha = [1, 0, 0, 0;
                0, cos(alpha), -sin(alpha), 0;
                0, sin(alpha), cos(alpha), 0;
                0, 0, 0, 1];
    % Translation along x by a
    Tx_a = [1, 0, 0, a;
            0, 1, 0, 0;
            0, 0, 1, 0;
            0, 0, 0, 1];
    % Rotation around z by theta
    Rz_theta = [cos(theta), -sin(theta), 0, 0;
                sin(theta), cos(theta), 0, 0;
                0, 0, 1, 0;
                0, 0, 0, 1];
    % Translation along z by d
    Tz_d = [1, 0, 0, 0;
            0, 1, 0, 0;
            0, 0, 1, d;
            0, 0, 0, 1];
    % Total transformation matrix
    T = Rx_alpha * Tx_a * Rz_theta * Tz_d;
end

clear T
clc 
clear all

% Usage
syms theta d a alpha

% Transformation matrix
Transformation = DH_Transformation(theta, d, a, alpha)

