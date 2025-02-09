%Ronelink.m: Kinematic and dynamic data for an example 1-Link Revolute Arm
%
% SCURonelink
%
% Defines the object 'SCURonelink' in the current workspace which describes the
% kinematic and dynamic of a generic, one-link revolute manipulator using
% using modified DH conventions. The model includes gear ratios.
%
% Copyright (C) 2002, by C. Kitts
clear all
L{1} = link([0 .001 0 0 0], 'modified');
L{1}.m = 1;
L{1}.r = [1 0 0];
L{1}.I = [0 0 0 0 0 0];
L{1}.Jm = 0;
L{1}.G = 1;
L{1}.B = 1;
%L(1).Tc= [0];
% some useful poses
qz = [0]; % zero angle
SCURonelink = robot(L, 'SCURonelink');
%clear L
%Ronelink.name = 'SCURonelink';
%Ronelink.tool=[1 0 0 1;0 1 0 0;0 0 1 0;0 0 0 1];
