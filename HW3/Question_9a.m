%% Inverse kinematics numeric Case A
clear
close all
clc 

% Define the Links 
Link1 = link([0 0 0 350], 'modified');  % Link 1
Link2 = link([-pi/2 100 0 0], 'modified');  % Link 2
Link3 = link([0 250 0 0], 'modified');  % Link 3
Link4 = link([-pi/2 130 0 250], 'modified');  % Link 4
Link5 = link([pi/2 0 0 0], 'modified');  % Link 5
Link6 = link([-pi/2 0 0 85], 'modified');  % Link 6

% The robot
robot_1 = robot({Link1 Link2 Link3 Link4 Link5 Link6});

M = [1 1 1 1 1 1];

% End Effector positions (Xee, Yee, Zee)
Tee = [0 0 1 450;
       0 -1 0 0;
       1 0 0 750;
       0 0 0 1];
   
% Right-Hand Solution 
q_init_right = [0 0 0 0 0 0];
invT_right = ikine(robot_1, Tee, q_init_right, M);
    
% Left-Hand Solution; I used pi as initial guess
q_init_left = [pi pi pi pi pi pi];  
invT_left = ikine(robot_1, Tee, q_init_left, M);

fprintf('  Right-Hand Solution: theta1 = %.4f rad, theta2 = %.4f rad, theta3 = %.4f rad, theta4 = %.4f rad, theta5 = %.4f rad, theta6 = %.4f rad\n', ...
    invT_right(1), invT_right(2), invT_right(3), invT_right(4),  invT_right(5), invT_right(6));
fprintf('  Left-Hand Solution:    theta1 = %.4f rad, theta2 = %.4f rad, theta3 = %.4f rad, theta4 = %.4f rad, theta5 = %.4f rad, theta6 = %.4f rad\n', ...
    invT_left(1), invT_left(2), invT_left(3), invT_left(4), invT_left(5), invT_left(6));


%% Case A Right Hand Solution

clear
close all
clc 

% Define the Links 
Link1 = link([0 0 0 350], 'modified');  % Link 1
Link2 = link([-pi/2 100 0 0], 'modified');  % Link 2
Link3 = link([0 250 0 0], 'modified');  % Link 3
Link4 = link([-pi/2 130 0 250], 'modified');  % Link 4
Link5 = link([pi/2 0 0 0], 'modified');  % Link 5
Link6 = link([-pi/2 0 0 85], 'modified');  % Link 6

% The robot
robot_1 = robot({Link1 Link2 Link3 Link4 Link5 Link6});

% Define joint angles
Q = [0 -6.7936 4.2987 -0 0.9242 0];

plot(robot_1, Q)


%% Case A Left Hand Solution

clear
close all
clc 

% Define the Links 
Link1 = link([0 0 0 350], 'modified');  % Link 1
Link2 = link([-pi/2 100 0 0], 'modified');  % Link 2
Link3 = link([0 250 0 0], 'modified');  % Link 3
Link4 = link([-pi/2 130 0 250], 'modified');  % Link 4
Link5 = link([pi/2 0 0 0], 'modified');  % Link 5
Link6 = link([-pi/2 0 0 85], 'modified');  % Link 6

% The robot
robot_1 = robot({Link1 Link2 Link3 Link4 Link5 Link6});

% Define joint angles
Q = [0 -347.0361 615.5541 -172.7876 263.8056 -499.5132];

plot(robot_1, Q)


