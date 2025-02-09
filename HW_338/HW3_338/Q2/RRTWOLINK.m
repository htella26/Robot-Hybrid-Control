%clear all
L{1} = link([0 1 0 0 0], 'standard');
L{2} = link([0 1 0 0 0], 'standard');

% Update masses at the end of each link
L{1}.m = 3;  % Mass of link 1
L{2}.m = 3;  % Mass of link 2 (With coupling)
%L{2}.m = 0.1;  % Mass of link 2 to a small value (Without Coupling)

% Center of mass remains at [0 0 0]
L{1}.r = [0 0 0];
L{2}.r = [0 0 0];

% Inertia values remain the same
%L{1}.I = [0 0 0 0 0 0];
%L{2}.I = [0 0 0 0 0 0];
L{1}.I = [3, 3, 3, 0, 0, 0];       % Inertia for link 1
L{2}.I = [3, 3, 3, 0, 0, 0];       % Inertia for link 2
%L{2}.I = [0.1, 0.1, 0.1, 0, 0, 0]; % Inertia for link 2

% Joint motor inertia remains unchanged
L{1}.Jm = 0;
L{2}.Jm = 0;

% Gear ratio remains unchanged
L{1}.G = 1;
L{2}.G = 1;

% Update friction coefficients
L{1}.B = 3;  % Friction for link 1
L{2}.B = 3;  % Friction for link 2 (With coupling)
%L{2}.B = 0;  % Set damping of joint 2 to 0 (Without Coupling)

% Useful poses
qz = [0 0];  % Zero angle position

% Create the robot
robot_hw = robot(L);
