


%% Question 3 - Symbolic Computation of T Matrix
clear L
close all
clc

syms t1 t3 L1 L3 d2

% Create the links using modified D&H convention
Link1 = link([0 0 t1 0], 'modified');
Link2 = link([0 L1 -pi/2 0], 'modified');
Link3 = link([0 d2 t3 0], 'modified'); 
Link4 = link([0 L3 0 0], 'modified');  % End effector

% Define the robot model
robot_3 = robot({Link1 Link2 Link3 Link4}, 'HW2_Question3', 'Hambal', 'unknown');

robot_3.name = "HW2_Question3";
robot_3.manuf = 'Hambal';

Qsym = [t1 -pi/2 t3 0];

% Forward kinematics
Tsym = fkine(robot_3, Qsym)
pretty(Tsym) % To make it more readable


%% Plotting with numerical inputs



clear L
close all
clc

% Create the links using modified D&H convention
Link1 = link([0 0 pi/2 0], 'modified');
Link2 = link([0 1 -pi/2 0], 'modified');
Link3 = link([0 0 pi/2 1], 'modified'); 
Link4 = link([0 1 0 0], 'modified');  % End effector

% Define the robot model
robot_2 = robot({Link1 Link2 Link3 Link4}, 'HW2_Question3', 'Hambal', 'unknown');

robot_2.name = "HW2_Question3";
robot_2.manuf = 'Hambal';

% Define joint angles
Q = [pi/2 1 pi/2 0];

% Plot the robot
plot(robot_2, Q)
