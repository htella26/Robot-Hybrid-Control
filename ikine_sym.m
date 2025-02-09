function qt = ikine_sym(robot, tr, q_init, mask)
    % IKINE_SYM Solve inverse kinematics symbolically for a robot.
    %
    %   qt = ikine_sym(robot, tr, q_init, mask)
    %
    % Inputs:
    %   robot  - Robot structure with symbolic DH parameters and joint variables
    %   tr     - Target transformation matrix (symbolic)
    %   q_init - Initial guess for joint angles (symbolic)
    %   mask   - Mask matrix to select which DOFs are controlled (optional)
    %
    % Outputs:
    %   qt     - Symbolic solution for joint angles

    % Solution control parameters
    ilimit = 1000;      % Maximum number of iterations
    stol = 1e-12;       % Stop tolerance
    
    % Number of joints
    n = robot.n;

    % Default initial guess for q if not provided
    if nargin < 3 || isempty(q_init)
        q_init = sym('q', [n, 1], 'real');  % Symbolic joint variables
    end
    
    % Define the mask matrix (for selecting controlled DOFs)
    if nargin < 4 || isempty(mask)
        if n < 6
            disp('For a manipulator with fewer than 6DOF, a mask matrix should be provided');
        end
        mask = ones(6, 1);  % Default mask (all DOFs)
    else
        mask = mask(:);  % Ensure mask is a column vector
        if length(mask) ~= 6
            error('Mask matrix should have 6 elements');
        end
        if length(find(mask)) ~= robot.n 
            error('Mask matrix must have same number of 1s as robot DOF');
        end
    end
    
    % Initialize joint angles
    q = q_init;
    
    % Iteratively solve for joint angles
    nm = 1;  % Initialize norm of error
    count = 0;  % Iteration counter

    while true
        % Forward kinematics for current joint angles
        T_current = fkine_sym(robot, q);
        
        % Compute error between current and desired transformation matrix
        e = tr2diff_sym(T_current, tr) .* mask;
        
        % Jacobian matrix for current joint angles
        J = jacob0_sym(robot, q);
        
        % Update joint angles using the symbolic pseudo-inverse
        dq = pinv(J) * e;
        q = q + dq;
        
        % Update the norm of the update step (convergence check)
        nm = norm(dq);
        
        % Check if `nm` is symbolic and whether it can converge
        if ~isAlways(nm > stol)
            break;
        end
        
        % Increment iteration count
        count = count + 1;
        if count > ilimit
            error('Solution did not converge');
        end
    end

    % Return the symbolic solution for joint angles
    qt = q;
end
