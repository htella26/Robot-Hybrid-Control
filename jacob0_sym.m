function J0 = jacob0_sym(robot, q)
	%
	%   dX_tn = Jn dq
	%
	Jn = jacobn(robot, q);	% Jacobian from joint to wrist space

	%
	%  convert to Jacobian in base coordinates
	%
	Tn = fkine(robot, q);	% end-effector transformation
	R = tr2rot(Tn);
	J0 = [R zeros(3,3); zeros(3,3) R] * Jn;