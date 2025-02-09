% Parameters
Kenv = 1000;            % Environmental stiffness constant
F_desired = 10;         % Desired contact force
Kp = 0.01;              % Proportional gain
Zg = 0;                 % Surface height
initial_position = [1, 0, 0.01];  % Initial end-effector position (x, y, z)
dt = 0.01;              % Time step
simulation_time = 5;    % Total simulation duration

% Initialize variables
Z_ee = initial_position(3);  % Start just above the surface
X_ee = initial_position(1);  % Fixed X position for simplicity
time_steps = 0:dt:simulation_time;
Z_ee_history = zeros(size(time_steps));
F_history = zeros(size(time_steps));
XZ_trajectory = zeros(length(time_steps), 2);

% Simulation loop
for i = 1:length(time_steps)
    % Calculate current penetration depth
    penetration = Zg - Z_ee;
    penetration = max(0, penetration);  % No negative penetration

    % Calculate current force
    F_current = Kenv * penetration;

    % Force error
    e_F = F_desired - F_current;

    % Update Z position using proportional control
    Z_ee = Z_ee + Kp * e_F;

    % Store history for plotting
    Z_ee_history(i) = Z_ee;
    F_history(i) = F_current;
    XZ_trajectory(i, :) = [X_ee, Z_ee];
end

% Plot results
figure;

% Plot Z position over time
subplot(3, 1, 1);
plot(time_steps, Z_ee_history, 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Z Position (m)');
title('End-Effector Z Position');
grid on;

% Plot contact force over time
subplot(3, 1, 2);
plot(time_steps, F_history, 'r', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Force (N)');
title('Contact Force with Surface');
grid on;

% Plot XZ trajectory
subplot(3, 1, 3);
plot(XZ_trajectory(:, 1), XZ_trajectory(:, 2), 'g', 'LineWidth', 1.5);
hold on;
yline(Zg, 'k--', 'LineWidth', 1.2); % Surface line at Zg = 0
xlabel('X Position (m)');
ylabel('Z Position (m)');
title('XZ Plane Trajectory of End-Effector');
legend('End-Effector Path', 'Surface Zg=0', 'Location', 'Best');
grid on;



%%

% Clear workspace
clear; clc;

% Define robot links (using standard DH parameters)
L{1} = link([0 0 1 0 0], 'standard');  % Link 1
L{2} = link([0 0 1 0 0], 'standard');  % Link 2

% Set masses and lengths
L{1}.m = 3;  % Mass of Link 1
L{2}.m = 3;  % Mass of Link 2

% Define gravity (in the -Z direction)
gravity_vector = [0 0 -9.81];

% Initialize the robot
robot = robot(L);
robot.gravity = gravity_vector;

% Define base offset
robot.base = transl(0, 0, 0.25);

% Sine wave trajectory for the endpoint (in the XZ plane)
time = linspace(0, 10, 500);  % Time vector
A = 0.5;  % Amplitude of sine wave
omega = 2 * pi / 5;  % Frequency of sine wave
x_desired = ones(size(time));  % Constant X position
z_desired = 0.75 + A * sin(omega * time);  % Sine wave in Z

% Initialize arrays to store results
q_trajectory = zeros(length(time), 2);
end_effector_position = zeros(length(time), 2);

% Simulate
for i = 1:length(time)
    % Desired endpoint position
    T_desired = transl(x_desired(i), 0, z_desired(i));
    
    % Solve inverse kinematics for joint angles
    q = ikine(robot, T_desired, [1 0 1 0 0 0]);  % Constrain to XZ plane
    q_trajectory(i, :) = q;
    
    % Compute actual end-effector position
    T_actual = robot.fkine(q);
    end_effector_position(i, :) = T_actual.t(1:2:3);  % Extract X and Z
end

% Plot results
figure;

% Plot sine wave trajectory
subplot(3, 1, 1);
plot(time, z_desired, 'r--', 'LineWidth', 1.5); hold on;
plot(time, end_effector_position(:, 2), 'b-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Z Position (m)');
title('End-Effector Z Position');
legend('Desired', 'Actual');
grid on;

% Plot joint trajectories
subplot(3, 1, 2);
plot(time, q_trajectory(:, 1), 'b', 'LineWidth', 1.5); hold on;
plot(time, q_trajectory(:, 2), 'r', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Joint Angles (rad)');
title('Joint Angles');
legend('q_1', 'q_2');
grid on;

% Animate the robot in the XZ plane
subplot(3, 1, 3);
robot.plot(q_trajectory, 'workspace', [-1.5 1.5 -0.5 0.5 0 2], 'view', [90 0]);
title('2R Robot in the XZ Plane');
