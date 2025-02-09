function tau_coriolis = non_linear_vc(u)
    % Constants assumption and point mass
    m1 = 3; m2 = 3;  % Mass of links
    l1 = 1; l2 = 1;  % Lengths of links
    lc1 = l1 / 2; lc2 = l2 / 2; % Center of mass positions

    % Split input vector u into q and dq
    q = u(1:2);     % Joint angles [q1; q2]
    dq = u(3:4);    % Joint angular velocities [dq1; dq2]

    % Joint variables
    q1 = q(1); q2 = q(2);
    dq1 = dq(1); dq2 = dq(2);

    % Coriolis and centrifugal terms
    h = -m2 * lc2 * l1 * sin(q2); % Coupling term
    C11 = h * dq2;
    C12 = h * (dq1 + dq2);
    C21 = -h * dq1;
    C22 = 0;

    % Coriolis matrix
    C = [C11 C12;
         C21 C22];

    % Compute torque due to Coriolis and centrifugal forces
    tau_coriolis = C * dq;
end
