% SCURRtwolink.m: Kinematic and dynamic data for an example 2-Link Revolute Arm
%
% SCURRtwolink
%
%Defines the object 'SCURRtwolink' in the current workspace which describes
%the kinematic and dynamics of a generic, two-link revolute manipulator
%using standard DH conventions. The model includes gear ratios.
%
%Copyright (c) 2002, by C. Kitts
%clear all
L{1} = link([0 1 0 0 0], 'standard');
L{2} = link([0 1 0 0 0], 'standard');
L{1}.m = 1;
L{2}.m = 1;
L{1}.r = [0 0 0];
L{2}.r = [0 0 0];
L{1}.I = [0 0 0 0 0 0];
L{2}.I = [0 0 0 0 0 0];
L{1}.Jm = 0;
L{2}.Jm = 0;
L{1}.G = 1;
L{2}.G = 1;
L{1}.B = 1;
L{2}.B = 1;

L{1}.qlim = [-inf, inf];   % Joint 1 has no limits
L{2}.qlim = [-2.5, 2.5];   % Joint 2 is limited to +/- 2.5 radians

%useful poses
qz=[0 0]; %zero angle
RRtwolink = robot(L);