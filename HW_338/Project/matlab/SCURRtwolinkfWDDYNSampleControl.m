%Forward Dynamics Example    

%clear all
%close all
duration=10;                         %set duration of simulation

%Declare manipulator to be simulated by un-commenting the appropriate line
%RONELINK;                           %SCURonelink.m: Example 1-link R manipulator
%SCURRTWOLINK                         %SCURRtwolink.m: Example 2-link RR manipulator

% Q=[0 pi/2]
%Compute Forward Dynamics for the selected manipulator using designated torque profile
% [T Q QD] = fdyn(SCURRtwolink, 0, duration, 'SCURRtwolinkTAU')


[T Q QD] = fdyn(robot, 0, duration, out.tau)
 
%Plotting Options
%   flag = 0:   plot joint position and velocity
%   flag = 1:   plot overhead view (interactive or batch - comment pause statement)

flag= 1;
 
if flag==0                          %plot joint position and velocity
    % Plot joint positions
    figure
    subplot(2,1,1), plot(T, Q)
    title('Joint Positions vs Time') 
    xlabel('Time (s)')                
    ylabel('Position (rad)')          

    % Plot joint velocities
    subplot(2,1,2), plot(T, QD)
    title('Joint Velocities vs Time') 
    xlabel('Time (s)')                
    ylabel('Velocity (rad/s)') 
     
else if flag == 1                   %plot overhead view
    t = 0:.05:duration;
    q = interp1(T, Q, t');
    L1 = 1; L2 = 1;
    
    % Compute the X, Y, and Z coordinates for the links
    X1 = [L1*cos(q(:,1)), L1*sin(q(:,1)), zeros(size(q, 1), 1)];
    X2 = [L1*cos(q(:,1))+L2*cos(q(:,1)+q(:,2)), ...
          L1*sin(q(:,1))+L2*sin(q(:,1)+q(:,2)), ...
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
    xlabel('X Position');
    ylabel('Z Position');
    zlabel('Z Position ');
    
    % Plot the 3D trajectory
    for z = 1:5:size(X1, 1) % Change the step value for more/less graphical interpolation in the plot
        plot3(X1(z,1), X1(z,2), X1(z,3), 'o'); % Plot endpoint of first link
        plot3(X2(z,1), X2(z,2), X2(z,3), 'o'); % Plot endpoint of second link
        plot3([0; X1(z,1)], [0; X1(z,2)], [0; X1(z,3)]); % Plot first link
        plot3([X1(z,1), X2(z,1)], [X1(z,2), X2(z,2)], [X1(z,3), X2(z,3)]); % Plot second link
        pause; % Comment this line to force a non-interactive plot
    end


else
    plot(T, Q)

    
end
end