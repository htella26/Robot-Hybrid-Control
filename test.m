
clear L

syms t1 d2 L1

% Create the links using standard D&H convention
Link1 = link([0 0 t1 0], 'modified');
Link2 = link([-pi/2 0 0 0 1 L1], 'modified');

% Define the robot model using standard D&H convention
robot_1 = robot({Link1 Link2});

Qsym = [t1 d2];

% Forward kinematics using the standard D&H robot model
Tsym = fkine(robot_1, Qsym)


%%
clear
close all
clc 

syms t1 t2 d3 L1 L2

% Create the links using standard D&H convention
Link1 = link([0 0 t1 L1], 'modified');
Link2 = link([pi/2 0 t2 0], 'modified');
Link3 = link([pi/2 L2 0 0 d3], 'modified');

% Define the robot model using standard D&H convention
robot_1 = robot({Link1 Link2 Link3});

Qsym = [t1 t2 d3];

% Forward kinematics using the standard D&H robot model
Tsym = fkine(robot_1, Qsym)


%%

clear 
close all 
clc

% Create the links using standard D&H convention
Link1 = link([0 0 pi/2 1], 'modified');
Link2 = link([pi/2 0 pi/2 0], 'modified');
Link3 = link([pi/2 1 0 0 1], 'modified');

% Define the robot model using standard D&H convention
robot_1 = robot({Link1 Link2 Link3});

q = [pi/2 pi/2 0];

% Forward kinematics using the standard D&H robot model
Tsym = fkine(robot_1, q)

plot(robot_1, q)

%%
T1 = [[eye(3);[0 0 0]], [1 0 0 1]'];
T2 = [[eye(3);[0 0 0]], [2 0 0 1]'];
v = ctraj(T1,T2,3)

%%
