function Z_wedge = wedge_surface(x)
    % WEDGE_SURFACE computes the Z position of a wedge surface at a given X position.
    %
    % Inputs:
    %   x          - X-coordinate where the Z position of the wedge is required
    %
    % Outputs:
    %   Z_wedge    - Z position of the wedge surface at the given X-coordinate
    
    % Wedge parameters
    tip_x = 0.75;                % X-coordinate of the wedge tip
    slope = tan(deg2rad(30));    % Slope of the wedge (tan(30 degrees))
    
    % Compute Z position of the wedge
    Z_wedge = slope * (x - tip_x);
end
