function t = fkine_sym(robot, q)
    % FKINE_SYM Compute symbolic forward kinematics for a robot.
    %
    %   T = fkine_sym(robot, q)
    %
    % Inputs:
    %   robot - Robot structure with symbolic DH parameters
    %   q     - Joint angles (symbolic)
    %
    % Outputs:
    %   T     - Symbolic transformation matrix
    
	n = robot.n;

	L = robot.link;
	if length(q) == n,
		t = robot.base;
		for i=1:n,
			t = t * L{i}(q(i));
		end
		t = t * robot.tool;
	else
		if numcols(q) ~= n,
			error('bad data')
		end
		t = zeros(4,4,0);
		for qv=q',		% for each trajectory point
			tt = robot.base;
			for i=1:n,
				tt = tt * L{i}(qv(i));
			end
			t = cat(3, t, tt * robot.tool);
		end
	end

end
