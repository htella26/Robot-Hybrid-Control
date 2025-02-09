

%% Question 1 - Symbolic Computation of T Matrix
clear L
close all
clc

syms t1 t2 t3 L1 L2 L3

% Create the links using modified D&H convention
Link1 = link([0 0 t1 0], 'modified');
Link2 = link([0 L1 t2 0], 'modified');
Link3 = link([0 L2 t3 0], 'modified'); 
Link4 = link([0 L3 0 0], 'modified');  % End effector

% Define the robot model
robot_2 = robot({Link1 Link2 Link3 Link4}, 'HW2_Question1', 'Hambal', 'unknown');

robot_2.name = "HW2_Question1";
robot_2.manuf = 'Hambal';

Qsym = [t1 t2 t3 0];

% Forward kinematics
Tsym = fkine(robot_2, Qsym)
pretty(Tsym) % To make it more readable


%% Numeric values and Plotting with numerical inputs

clear L
close all
clc

% Create the links using modified D&H convention
Link1 = link([0 0 pi/2 0], 'modified');
Link2 = link([0 10 -pi/2 0], 'modified');
Link3 = link([0 10 -pi/2 0], 'modified'); 
Link4 = link([0 5 0 0], 'modified');  % End effector

% Define the robot model
robot_2 = robot({Link1 Link2 Link3 Link4}, 'HW2_Question2', 'Hambal', 'unknown');

robot_2.name = "HW2_Question2";
robot_2.manuf = 'Hambal';

% Define joint angles
Q = [pi/2 -pi/2 -pi/2 0];

% Forward kinematics
Tsym = fkine(robot_2, Q)

% Plot the robot
plot(robot_2, Q)