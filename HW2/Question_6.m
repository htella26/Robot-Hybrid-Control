

%% Question 6 - Symbolic Computation of T Matrix
clear L
close all
clc

syms t1 t2 t3 t4 t5 t6 d2 L2 L3 L4 L5 L6

% Create the links using modified D&H convention
Link1 = link([0 0 t1 0], 'modified');
Link2 = link([-pi/2 L2 t2 d2], 'modified');
Link3 = link([-pi/2 L3 t3 0], 'modified'); 
Link4 = link([pi/2 L4 t4 0], 'modified');
Link5 = link([pi/2 L5 t5 0], 'modified'); 
Link6 = link([0 L6 t6 0], 'modified');  % End effector

% Define the robot model
robot_6 = robot({Link1 Link2 Link3 Link4 Link5 Link6}, 'HW2_Question6', 'Hambal', 'unknown');

robot_6.name = "HW2_Question6";
robot_6.manuf = 'Hambal';

Qsym = [t1 t2 t3 t4 t5 t6];

% Forward kinematics
Tsym = fkine(robot_6, Qsym);
pretty(Tsym) % To make it more readable


%% Plotting with numerical inputs Case 1
% assuming L2 = L3 = L4 = L5 = L6 = 1 and d2 = 0.3

clear L
close all
clc

% Create the links using modified D&H convention
Link1 = link([0 0 0 0], 'modified');
Link2 = link([-pi/2 1 0 0.3], 'modified');
Link3 = link([-pi/2 1 0 0], 'modified'); 
Link4 = link([pi/2 0.2 0 0], 'modified');
Link5 = link([pi/2 1 0 0], 'modified'); 
Link6 = link([0 1 0 0], 'modified');  % End effector

% Define the robot model
robot_6 = robot({Link1 Link2 Link3 Link4 Link5 Link6}, 'HW2_Question6', 'Hambal', 'unknown');

robot_6.name = "HW2_Question6";
robot_6.manuf = 'Hambal';

% Define joint angles
Q = [0 0 0 0 0 0];

% Forward kinematics
forward_kinematics = fkine(robot_6, Q)

% Plot the robot
plot(robot_6, Q)




%% Plotting with numerical inputs Case 2
% assuming L2 = L3 = L4 = L5 = L6 = 1 and d2 = 0.3

clear L
close all
clc

% Create the links using modified D&H convention
Link1 = link([0 0 pi/2 0], 'modified');
Link2 = link([-pi/2 1 pi/2 0.3], 'modified');
Link3 = link([-pi/2 1 -pi/2 0], 'modified'); 
Link4 = link([pi/2 0.2 0 0], 'modified');
Link5 = link([pi/2 1 -pi/2 0], 'modified'); 
Link6 = link([0 1 0 0], 'modified');  % End effector

% Define the robot model
robot_6 = robot({Link1 Link2 Link3 Link4 Link5 Link6}, 'HW2_Question6', 'Hambal', 'unknown');

robot_6.name = "HW2_Question6";
robot_6.manuf = 'Hambal';

% Define joint angles
Q = [pi/2 pi/2 -pi/2 0 -pi/2 0];

% Forward kinematics
forward_kinematics = fkine(robot_6, Q)

% Plot the robot
plot(robot_6, Q)