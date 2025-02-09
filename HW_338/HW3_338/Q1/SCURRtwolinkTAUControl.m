function tau = taufunc(t, q, qd)
    % Constants
    g = 9.81;  % Gravity
    m = 3;     % Mass of each link (kg)
    L = 1;     % Length of each link (m)

    % Control gains
    Kp = 20;   % Proportional gain (adjust for your system)
    Kv = 10;   % Derivative gain (adjust for your system)

    % Sine wave trajectory
    T = 5;                         % Period of oscillation (sec)
    x_d = 1 - cos((2 * pi / T) * t); % Desired X position
    z_d = 0.25;                    % Desired Z position (constant)
    x_d_dot = (2 * pi / T) * sin((2 * pi / T) * t); % Velocity in X
    z_d_dot = 0;                   % Velocity in Z (constant)

    % Inverse kinematics for desired joint angles
    q1_d = atan2(z_d, x_d);
    q2_d = acos((x_d^2 + z_d^2 - 2 * L^2) / (2 * L^2));

    % Desired joint velocities (set to zero for simplicity in this example)
    q1_d_dot = 0;
    q2_d_dot = 0;

    % Position and velocity errors
    e_q = [q1_d - q(1); q2_d - q(2)];
    e_qd = [q1_d_dot - qd(1); q2_d_dot - qd(2)];

    % Control torques (PD control)
    tau = Kp * e_q + Kv * e_qd;

    % Add gravity compensation
    tau(1) = tau(1) + m * g * L * cos(q(1)) / 2;
    tau(2) = tau(2) + m * g * L * cos(q(1) + q(2)) / 2;
end
