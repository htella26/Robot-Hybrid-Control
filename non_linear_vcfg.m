function beta = non_linear_vcfg(u)
    % Constants
    m1 = 3; m2 = 3;  % Mass of links
    l1 = 1; l2 = 1;  % Lengths of links
    g = 9.81;        % Gravitational acceleration
    c = 0.5;         % Coefficient for friction
    
    % Split input vector u into q (joint angles) and dq (angular velocities)
    q = u(1:2);  % [q1; q2]
    dq = u(3:4); % [dq1; dq2]

    % Extract joint variables
    q1 = q(1);
    q2 = q(2);
    dq1 = dq(1);
    dq2 = dq(2);

    % Coriolis matrix (C)
    C = [0, -m2 * l1 * l2 * sin(q2);
         m2 * l1 * l2 * sin(q2), 0];

    % Vector B
    B = [-2 * m2 * l1 * l2 * sin(q2);
         0];

    % Gravitational forces (G)
    G = [(m2 * l2 * g * cos(q1 + q2)) + ((m1 + m2) * l1 * g * cos(q1));
         m2 * l2 * g * cos(q1 + q2)];

    % Friction forces (F)
    F = [c * sign(dq2);
         0];

    % Compute beta
    beta = C * B + G + F;
end
