%% Inverse kinematics numeric
clear
close all
clc 


L1 = 1;
L2 = 1;

Link1 = link([0 0 0 0], 'modified');  
Link2 = link([0 L1 0 0], 'modified');  
Link3 = link([0 L2 0 0], 'modified');  

robot_1 = robot({Link1 Link2 Link3});

M = [1 1 0 0 0 1];

% End effector
cases = [0.866 1.500; 
        -0.134 -0.500; 
        -0.500 0.950;
        -0.500 1.950];

% Loop through each case
for i = 1:size(cases, 1)
    Xee = cases(i, 1);
    Yxx = cases(i, 2);

    Tee = [1 0 0 Xee;
           0 1 0 Yxx;
           0 0 1 0;
           0 0 0 1];

    % Right-Hand Solution 
    q_init_right = [0 0 0];
    invT_right = ikine(robot_1, Tee, q_init_right, M);
    
    % Left-Hand Solution
    q_init_left = [pi pi 0];  
    invT_left = ikine(robot_1, Tee, q_init_left, M);

    % Results
    fprintf('Case %d:\n', i);
    fprintf('  Right-Hand Solution: theta1 = %.4f rad, theta2 = %.4f rad\n', invT_right(1), invT_right(2));
    fprintf('  Left-Hand Solution:    theta1 = %.4f rad, theta2 = %.4f rad\n', invT_left(1), invT_left(2));
end


%% Case 1 Right Hand Solution

clear
close all
clc 

L1 = 1;
L2 = 1;

% Define the Links 
Link1 = link([0 0 0 0], 'modified');  % Link 1
Link2 = link([0 L1 0 0], 'modified');  % Link 1
Link3 = link([0 L2 0 0], 'modified');  % Link 2

% The robot
robot_1 = robot({Link1 Link2 Link3});

% Define joint angles
Q = [1.0472 0 0];

plot(robot_1, Q)


%% Case 1 Left Hand Solution

% Plotting each 
clear
close all
clc 

L1 = 1;
L2 = 1;

% Define the Links 
Link1 = link([0 0 0 0], 'modified');  % Link 1
Link2 = link([0 L1 0 0], 'modified');  % Link 1
Link3 = link([0 L2 0 0], 'modified');  % Link 2

% The robot
robot_1 = robot({Link1 Link2 Link3});

% Define joint angles
Q = [1.5708 5.2360 0];

plot(robot_1, Q)

%% Case 2 Right Hand Solution

clear
close all
clc 

L1 = 1;
L2 = 1;

% Define the Links 
Link1 = link([0 0 0 0], 'modified');  % Link 1
Link2 = link([0 L1 0 0], 'modified');  % Link 1
Link3 = link([0 L2 0 0], 'modified');  % Link 2

% The robot
robot_1 = robot({Link1 Link2 Link3});

% Define joint angles
Q = [-1.8326  -0 0];

plot(robot_1, Q)


%% Case 2 Left Hand Solution

clear
close all
clc 

L1 = 1;
L2 = 1;

% Define the Links 
Link1 = link([0 0 0 0], 'modified');  % Link 1
Link2 = link([0 L1 0 0], 'modified');  % Link 1
Link3 = link([0 L2 0 0], 'modified');  % Link 2

% The robot
robot_1 = robot({Link1 Link2 Link3});

% Define joint angles
Q = [3.1415  2.6180 0];

plot(robot_1, Q)



%% Case 3 Right Hand Solution

clear
close all
clc 

L1 = 1;
L2 = 1;

% Define the Links 
Link1 = link([0 0 0 0], 'modified');  % Link 1
Link2 = link([0 L1 0 0], 'modified');  % Link 1
Link3 = link([0 L2 0 0], 'modified');  % Link 2

% The robot
robot_1 = robot({Link1 Link2 Link3});

% Define joint angles
Q = [2.0553 0 0];

plot(robot_1, Q)


%% Case 3 Left Hand Solution

clear
%close all
%clc 

L1 = 1;                    
L2 = 1;

% Define the Links 
Link1 = link([0 0 0 0], 'modified');  % Link 1
Link2 = link([0 L1 0 0], 'modified');  % Link 1
Link3 = link([0 L2 0 0], 'modified');  % Link 2

% The robot
robot_1 = robot({Link1 Link2 Link3});

% Define joint angles
Q = [3.0595  4.2748 0];

plot(robot_1, Q)




















%%

clear
clc

% Given Link Lengths
L1 = 1;
L2 = 1;

% Define the End Effector positions (Xee, Yxx) for each case
cases = [0.866 1.500; -0.134 -0.500; -0.500 0.950; -0.500 1.950];

% Loop through each case
for i = 1:size(cases, 1)
    Xee = cases(i, 1);
    Yxx = cases(i, 2);

    % Compute r (distance from origin to end effector)
    r = sqrt(Xee^2 + Yxx^2);
    
    % Compute cos(theta2) (two possible solutions)
    cos_theta2 = (r^2 - L1^2 - L2^2) / (2 * L1 * L2);
    
    % Check if cos(theta2) is within the valid range [-1, 1]
    if cos_theta2 < -1 || cos_theta2 > 1
        fprintf('Case %d: Position is out of reach for the arm.\n', i);
        continue; % Skip to the next case
    end
    
    % Compute sin(theta2) for both solutions
    sin_theta2_1 = sqrt(1 - cos_theta2^2);
    sin_theta2_2 = -sqrt(1 - cos_theta2^2);
    
    % Compute theta2 for both solutions
    theta2_1 = atan2(sin_theta2_1, cos_theta2);
    theta2_2 = atan2(sin_theta2_2, cos_theta2);
    
    % Compute theta1 for both solutions
    theta1_1 = atan2(Yxx, Xee) - atan2(L2 * sin_theta2_1, L1 + L2 * cos_theta2);
    theta1_2 = atan2(Yxx, Xee) - atan2(L2 * sin_theta2_2, L1 + L2 * cos_theta2);
    
    % Display the results
    fprintf('Case %d:\n', i);
    fprintf('  Right Hand Solution: theta1 = %.4f rad, theta2 = %.4f rad\n', theta1_1, theta2_1);
    fprintf('  Left Hand Solution:  theta1 = %.4f rad, theta2 = %.4f rad\n', theta1_2, theta2_2);
end

