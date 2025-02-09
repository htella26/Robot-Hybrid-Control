% Time vectors
t1 = linspace(0, 5, 500);  % For part (a) and (b)
t_vector = 0:0.1:5;        % For part (c) jtraj

% (a) Cubic trajectory
theta_cubic = -60 + 14.4*t1.^2 - 1.92*t1.^3;
theta_dot_cubic = 28.8*t1 - 5.76*t1.^2;
theta_dot_dot_cubic = 28.8 - 11.52*t1;

% (b) Linear with blends trajectory
theta_linear = zeros(size(t1));
theta_dot_linear = zeros(size(t1));
theta_dot_dot_linear = zeros(size(t1));

% Segment 1: 0 <= t < 0.3
segment1 = t1 <= 0.3;
theta_linear(segment1) = -60 + 42.5*t1(segment1).^2;
theta_dot_linear(segment1) = 85*t1(segment1);
theta_dot_dot_linear(segment1) = 85;

% Segment 2: 0.3 <= t < 4.7
segment2 = (t1 > 0.3) & (t1 <= 4.7);
theta_linear(segment2) = -63.825 + 25.5*t1(segment2);
theta_dot_linear(segment2) = 25.5;
theta_dot_dot_linear(segment2) = 0;

% Segment 3: 4.7 <= t <= 5
segment3 = t1 > 4.7;
theta_linear(segment3) = -1002.5 + 425*t1(segment3) - 42.5*t1(segment3).^2;
theta_dot_linear(segment3) = 425 - 85*t1(segment3);
theta_dot_dot_linear(segment3) = -85;

% (c) jtraj function
[Q, QD, QDD] = jtraj(-60, 60, t1);

% Plotting

% Position Comparison
figure;
plot(t1, theta_cubic, 'r', t1, theta_linear, 'g', t1, Q, 'b', 'LineWidth', 1.5);
title('Position Comparison');
xlabel('Time (s)');
ylabel('Position (\theta)');
legend('Cubic Trajectory', 'Linear with Blends', 'jtraj Function');

% Velocity Comparison
figure;
plot(t1, theta_dot_cubic, 'r', t1, theta_dot_linear, 'g', t1, QD, 'b', 'LineWidth', 1.5);
title('Velocity Comparison');
xlabel('Time (s)');
ylabel('Velocity (\theta\_dot)');
legend('Cubic Trajectory', 'Linear with Blends', 'jtraj Function');

% Acceleration Comparison
figure;
plot(t1, theta_dot_dot_cubic, 'r', t1, theta_dot_dot_linear, 'g', t1, QDD, 'b', 'LineWidth', 1.5);
title('Acceleration Comparison');
xlabel('Time (s)');
ylabel('Acceleration (\theta\_dot\_dot)');
legend('Cubic Trajectory', 'Linear with Blends', 'jtraj Function');
