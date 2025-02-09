   
%RR robot - trajectory generation example
hold off
axis 
%clear all

RRTWOLINK

plotoption=8;
%establish a time vector 

t=[0:.5:10];

%define initial and final robot joint space poses
%Qi=[0;pi/4]; %These are the values for the lecture example 
Qi=[3*pi/8;-pi/2];
%Qf=[3*pi/4;pi/2];
%Qf=[15*pi/16, pi/4]
%Qf=[127*pi/128, pi/4]
Qf=[5*pi/8;pi/2];

%generate a trajectory plan 

[q qd qdd]=jtraj(Qi, Qf, t);

% Verify that joint 2 stays within the limits
if any(q(:,2) < -2.5 | q(:,2) > 2.5)
    disp('Warning: Joint 2 exceeds its angular limit of +/- 2.5 radians!');
end

%show how angles, velocities, accelerations evolve 
if plotoption==1
    subplot(3,1,1), plot(t, q)
    subplot(3,1,2), plot(t, qd)
    subplot(3,1,3), plot(t, qdd)
end
%show how robot moves in a 'straight line' in joint space 
if plotoption==2
    plot(q*[1;0],q*[0;1])
end

%show how the motion is not 'straight' in operational space 
r = RRtwolink;
TJ=fkine(r, q)
Ree=transl(TJ);

if plotoption==3 
    subplot(2,1,1), 
    plot(t,Ree(:,1)) 
    subplot(2,1,2), 
    plot(t,Ree(:,2)) 
end

if plotoption==4 
    plot(r, q, 'loop')
end

if plotoption==5
axis('square');
axis([-2 2 -2 2]); 
axis manual; 
hold on; 

for z=1:1:length(t)
plot(cos(q(z,1)),sin(q(z,1)), 'o')
plot(Ree(z,1), Ree(z,2), 'o') 
plot([0;cos(q(z,1));Ree(z,1)],[0;sin(q(z,1));Ree(z,2)]) 

end
end


%% Now let's try doing the planning in Cartesian Space
Tinit=fkine(r,Qi); 
Tfinal=fkine(r, Qf); 
rr=jtraj(0,1,t);
TC = ctraj(Tinit, Tfinal, rr);
k = transl(TC); % Extract x and y coordinates from TC
   

%Endpoint x and y coordinates over time 
if plotoption==6
    plot(t, transl(TC)); 
    grid;
end

%Endpoint in Cartesian space k=transl(TC);
if plotoption==7
    axis('square'); 
    axis([-2 2 -2 2]); 
    grid 
    plot(k(:,1),k(:,2))
end

%The resulting joint angles 
%Q = ikine(RRtwolink, TC, [0; pi/2], [1 1 0 0 0 0]); % Solves with limits applied
Q=ikine(r, TC, [0;pi/2], [1 1 0 0 0 0])
%Which from an overhead view gives
if plotoption==8
    axis('square');
    axis([-2 2 -2 2]);
    axis manual; 
    hold on; 
    
    for z=1:1:length(t)
        plot(cos(Q(z,1)), sin(Q(z,1)), 'o')
        plot(k(z,1), k(z,2), 'o')
        plot([0;cos(Q(z,1));k(z,1)],[0;sin(Q(z,1));k(z,2)]) 
        pause(0.1)
    end
end