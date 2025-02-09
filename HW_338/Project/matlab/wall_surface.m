function output = wall_surface(u)
    % WALL_SURFACE models the behavior of a wall at Zg = 0.
    %
    % Inputs:
    %   u           - Input array containing [Zg, Zee, Kenv]
    %
    % Outputs:
    %   Fz          - Force exerted by the wall on the end-effector.
    %   corrected_Z - Adjusted Z position of the end-effector (preventing penetration).

    % Extract arguments from input array
    Zg = u(1);      % Wall's Z position
    Zee = u(2);     % End-effector Z position
    Kenv = u(3);    % Stiffness of the wall

    % Calculate penetration depth
    penetration_depth = Zg - Zee;

    % If penetration occurs, compute force and correct position
    if penetration_depth > 0
        % Wall force (Hooke's law)
        Fz = Kenv * penetration_depth;
        % Prevent end-effector from going further into the wall
        corrected_Z = Zg;
    else
        % No penetration, no force applied
        Fz = 0;
        corrected_Z = Zee;
    end
    output = [Fz; corrected_Z];
end
