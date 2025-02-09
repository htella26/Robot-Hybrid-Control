%% Forward Kinematics
clear
close all
clc 

syms t2 t3 d1 L1 L2 L3

% Create the links using standard D&H convention
Link1 = link([0 0 0 d1], 'modified');
Link2 = link([0 L1 t2 0], 'modified');
Link3 = link([0 L2 t3 0], 'modified');
Link4 = link([0 L3 0 0], 'modified');

% Define the robot model using standard D&H convention
robot_1 = robot({Link1 Link2 Link3 Link4});

Qsym = [0 t2 t3 0];

% Forward kinematics using the standard D&H robot model
Tsym = fkine(robot_1, Qsym)

pretty(Tsym)

%%

clear
close all
clc 

% Create the links using standard D&H convention
Link1 = link([0 0 0 1], 'modified');
Link2 = link([0 1 0 0], 'modified');
Link3 = link([0 1 0 0], 'modified');
Link4 = link([0 1 0 0], 'modified');

% Define the robot model using standard D&H convention
robot_1 = robot({Link1 Link2 Link3 Link4});

q = [0 0 0 0];

% Forward kinematics using the standard D&H robot model
%Tsym = fkine(robot_1, Qsym)

plot(robot_1, q)