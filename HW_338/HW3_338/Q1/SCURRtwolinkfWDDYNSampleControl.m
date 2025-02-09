%Forward Dynamics Example    

clear all
close all
duration=30;                         %set duration of simulation

%Declare manipulator to be simulated by un-commenting the appropriate line
%RONELINK;                           %SCURonelink.m: Example 1-link R manipulator
SCURRTWOLINKCONTROL                         %SCURRtwolink.m: Example 2-link RR manipulator

% Q=[0 pi/2]
%Compute Forward Dynamics for the selected manipulator using designated torque profile
[T Q QD] = fdyn(SCURRtwolink, 0, duration, 'SCURRtwolinkTAUControl')
 
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
    t=0:.05:duration;
    q=interp1( T, Q, t')
    %L1=1; X1=[L1*cos(q) L1*sin(q)]; %define link endpoints for onelink
    L1=1;L2=1;
    X1=[L1*cos(q(:,1)) L1*sin(q(:,1))];
    X2=[L1*cos(q(:,1))+L2*cos(q(:,1)+q(:,2)) L1*sin(q(:,1))+L2*sin(q(:,1)+q(:,2))];
   
    axis('square'); axis([-2 2 -2 2]); axis manual; hold on;
    for z=1:5:size(X1, 1)             %%%%% CHANGE THE STEP VALUE FOR MORE/LESS GRAPHICAL INTERPOLATION IN THE PLOT
        plot(X1(z,1),X1(z,2), 'o')  %plot endpoint and link line
        plot(X2(z,1),X2(z,2), 'o')
        plot([0;X1(z,1)],[0;X1(z,2)])
        plot([X1(z,1),X2(z,1)],[X1(z,2),X2(z,2)])
        pause                       %comment this line to force a non-interactive plot
    end

else
    plot(T, Q)

    
end
end