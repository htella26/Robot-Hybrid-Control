function simulate_robot(robot, tau)
    
    % Simulation parameters
    initial_conditions = 0; % initial conditions
    duration = 20; % Duration of the simulation

    % Simulate dynamics using fdyn
    [T, Q, QD] = fdyn(robot, initial_conditions, duration, tau);

    % Time vector for interpolation
    t = 0:0.05:duration;
    q = interp1(T, Q, t');

    % Define link lengths
    L1 = 1;
    L2 = 1;

    % Compute the X, Y, and Z coordinates for the links
    X1 = [L1 * cos(q(:, 1)), L1 * sin(q(:, 1)), zeros(size(q, 1), 1)];
    X2 = [L1 * cos(q(:, 1)) + L2 * cos(q(:, 1) + q(:, 2)), ...
          L1 * sin(q(:, 1)) + L2 * sin(q(:, 1) + q(:, 2)), ...
          zeros(size(q, 1), 1)];

    % Set up the 3D plot
    figure;
    axis('square');
    axis([-2 2 -2 2 -1 1]); % Adjust axis limits for 3D view
    axis manual;
    hold on;
    grid on;

    % Add title and axis labels
    title('3D Robot Arm Movement Over Time');
    xlabel('X Position (meters)');
    ylabel('Y Position (meters)');
    zlabel('Z Position (meters)');

    % Plot the 3D trajectory
    for z = 1:5:size(X1, 1) % Change the step value for more/less graphical interpolation in the plot
        % Plot endpoint of first link
        plot3(X1(z, 1), X1(z, 2), X1(z, 3), 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
        
        % Plot endpoint of second link
        plot3(X2(z, 1), X2(z, 2), X2(z, 3), 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
        
        % Plot first link
        plot3([0; X1(z, 1)], [0; X1(z, 2)], [0; X1(z, 3)], 'r', 'LineWidth', 2);
        
        % Plot second link
        plot3([X1(z, 1), X2(z, 1)], [X1(z, 2), X2(z, 2)], [X1(z, 3), X2(z, 3)], 'b', 'LineWidth', 2);
        
        pause(0.1); % Pause for visualization
    end

    % Hold the final view
    hold off;
end
