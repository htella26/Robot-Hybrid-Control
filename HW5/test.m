%% Problem 4b-1
SCURONELINK; 

% joint parameters
Q = [0];    % Joint angle
Qd = [0];   % Joint velocity
Qdd = [0];  % Joint acceleration

% joint torque
tau = rne(SCURonelink, Q, Qd, Qdd);

% result
disp('Joint torque for Q=[0; 0; 0]:');
disp(tau);

%% Problem 4b-2

% joint parameters
Q = [0];    % Joint angle
Qd = [0];   % Joint velocity
Qdd = [1];  % Joint acceleration

% joint torque
tau = rne(SCURonelink, Q, Qd, Qdd);

% Result
disp('Joint torque for Q=[0; 0; 1]:');
disp(tau);

%% Problem 4b-3

% Joint parameters
Q = [pi/2];  % Joint angle
Qd = [0];    % Joint velocity
Qdd = [1];   % Joint acceleration

% Joint torque
tau = rne(SCURonelink, Q, Qd, Qdd);

% Result
disp('Joint torque for Q=[pi/2; 0; 1]:');
disp(tau);

%% Problem 4b-4

% Joint parameters
Q = [0];    % Joint angle
Qd = [1];   % Joint velocity
Qdd = [1];  % Joint acceleration

% Joint torque
tau = rne(SCURonelink, Q, Qd, Qdd);

% Result
disp('Joint torque for Q=[0; 1; 1]:');
disp(tau);

%% Problem 4b-5

L{1}.r = [2 0 0];  % link endpoint to 2 units

% robot
SCURonelink = robot(L, 'SCURonelink');

% Joint parameters
Q = [0];    % Joint angle
Qd = [0];   % Joint velocity
Qdd = [1];  % Joint acceleration

% Joint torque
tau = rne(SCURonelink, Q, Qd, Qdd);

% Result
disp('Joint torque for modified link length, Q=[0; 0; 1]:');
disp(tau);

L{1}.r = [1 0 0]; % Reset to 1 unit
SCURonelink = robot(L, 'SCURonelink');

