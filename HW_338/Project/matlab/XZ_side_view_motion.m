% Run the force_controller.slx/hybrid_controller.slx
% first before running this code for simulation

duration = 10; % Set duration of simulation

% Compute Forward Dynamics (ensure 'out.tau' is defined for your manipulator)
[T, Q, QD] = fdyn(robot, 0, duration, out.tau);

% Debug: Check lengths of T and out.x
disp(['Length of T: ', num2str(length(T))]);
disp(['Length of out.x: ', num2str(length(out.x))]);
disp(['Length of out.z: ', num2str(length(out.z))]);

% Ensure T, out.x, and out.z are of the same length
minLength = min([length(T), length(out.x), length(out.z)]);
T = T(1:minLength);       % Trim T to the smallest length
out.x = out.x(1:minLength); % Trim out.x to the smallest length
out.z = out.z(1:minLength); % Trim out.z to the smallest length

% Interpolate time for smoother plotting
t = 0:0.05:duration; % Time steps for animation
x = interp1(T, out.x, t', 'linear', 'extrap'); % Interpolate x-coordinates
z = interp1(T, out.z, t', 'linear', 'extrap'); % Interpolate z-coordinates

% Set up the 2D plot for XZ movement
figure;
axis equal;
axis([-2 2 -0.5 2]); % Adjust axis limits for XZ side view
hold on;
grid on;

% Add title and axis labels
title('Robot Arm Movement in XZ Plane (Side View)');
xlabel('X Position');
ylabel('Z Position');

% Dynamic plot loop
numColors = 5; % Number of colors for links
cmap = lines(numColors); % Generate a colormap

for i = 1:length(t)
    % Clear the previous frame
    cla;

    % Plot the trajectory dynamically
    for linkIdx = 1:numColors
        % Assign different colors to each segment of the path
        plot(x(1:i), z(1:i), 'Color', cmap(linkIdx, :), 'LineWidth', 1.5); % Plot trajectory so far
    end
    % Plot the current position with a red marker
    plot(x(i), z(i), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Current position

    % Pause for visualization
    pause(0.05);
end
