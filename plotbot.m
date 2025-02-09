function plotbot(robot, q)
    % PLOTBOT Visualize the custom robot arm in 3D space
    %
    % Usage:
    %   plotbot(robot, q)
    %
    % Inputs:
    %   robot: A struct representing the robot.
    %   q: Joint configuration (joint angles) for the robot.
    
    % Validate inputs
    if nargin ~= 2
        error('You must provide a robot structure and a joint configuration');
    end

    % Initialize transformation matrix
    T = eye(4); % Identity matrix for base frame

    % Plot each link based on DH parameters
    figure; % Create a new figure window
    hold on;
    axis equal;
    grid on;

    % Loop through the number of links in the robot
    numLinks = robot.n; % Extract the number of links from the robot
    L = robot.link;

    for i = 1:numLinks
        % Extract DH parameters for the current link
        theta = q(i) + L{i}.theta; % Joint angle + theta
        d = L{i}.D;  % Link offset
        a = L{i}.A;  % Link length
        alpha = L{i}.alpha; % Link twist

        % Calculate transformation matrix using DH parameters
        T_i = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta);
               sin(theta), cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
               0, sin(alpha), cos(alpha), d;
               0, 0, 0, 1];

        % Update the transformation matrix
        T = T * T_i;

        % Extract the position of the current link
        position = T(1:3, 4);

        % Plot the current link as a line from the previous position to the current position
        if i > 1
            previous_position = T_prev(1:3, 4);
            plot3([previous_position(1), position(1)], ...
                  [previous_position(2), position(2)], ...
                  [previous_position(3), position(3)], 'LineWidth', 2);
        end

        % Store current transformation for the next iteration
        T_prev = T;
    end

    % Customize the view and appearance of the plot
    title('Robot Visualization');
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
    view(3); % Set 3D view
    hold off;
end
