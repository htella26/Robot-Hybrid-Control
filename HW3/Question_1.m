%% Forward Kinematics
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
M = [1 1 0 0 0 0]

% Forward kinematics using the standard D&H robot model
Tsym = fkine(robot_1, Qsym)



%% Inverse kinematics numeric
clear
close all
clc 

% Create the links using standard D&H convention
Link1 = link([0 0 pi/2 1], 'modified');
Link2 = link([pi/2 0 pi/2 0], 'modified');
Link3 = link([pi/2 1 0 0 1], 'modified');

% Define the robot model using standard D&H convention
robot_1 = robot({Link1 Link2 Link3});

Tee = [1 0 0 1; 
        0 1 0 1;
        0 0 1 0;
        0 0 0 1];

M = [1 1 0 0 0 1];

% Inverse kinematics 
invT = ikine(robot_1, Tee, [0 0 0], M)


%%
% Clear workspace
clear;
clc;

% Define symbolic variables
syms L1 L2 Px Py Pz theta1 theta2 d3

% Calculate theta1 using atan2
theta1 = atan2(Py, Px);

% Compute the radial distance r in the xy-plane
r = sqrt(Px^2 + Py^2);

% Equation for Pz (vertical plane) to solve for theta2 and d3
eq_Pz = (L2*sin(theta2)) - (d3*cos(theta2)) + L1 == Pz;

% Equation for r (horizontal plane) to solve for theta2 and d3
eq_r = (L2*cos(theta2)) + (d3*sin(theta2)) == r;

% Solve the system for theta2 and d3
solutions = solve([eq_Pz, eq_r], [theta2, d3]);

% Display the solutions
theta2_solution = solutions.theta2
d3_solution = solutions.d3

pretty(d3_solution)
pretty(theta2_solution)










%% 
clear;
clc;

syms L2 D3 C2 S2 Px Py C1 S1 Pz L1

% Define the equations
eq1 = L2*C2 + D3*S2 == (Px + Py)/(C1 + S1);
eq2 = L2*S2 - D3*C2 == Pz - L1;

% Solve the system of equations for C2 and S2
solutions = solve([eq1, eq2], [C2, S2]);

C2_solution = solutions.C2;
S2_solution = solutions.S2;

pretty(simplify(C2_solution))
pretty(simplify(S2_solution))


%% Inverse kinematics with symbolic 
clear
close all
clc 

syms t2 L2 d1 x y z

% Create the links using standard D&H convention
Link1 = link([-pi/2 0 0 d1], 'modified');
Link2 = link([pi/2 0 t2 0], 'modified');
Link3 = link([0 L2 0 0 0], 'modified');

% Define the robot model using standard D&H convention
robot_1 = robot({Link1 Link2 Link3});

% Define the target transformation matrix
Tee = [1 0 0 x; 
       0 1 0 y;
       0 0 1 z;
       0 0 0 1];

% Mask matrix (only control x and y positions)
M = [1 1 1 0 0 0];

% Initial guess for joint angles
q_init = [0; 0; 0];

% Solve inverse kinematics symbolically
qt = ikine_sym(robot_1, Tee)
