function r = transljac(x, y, z)
    if nargin == 1
        % Case when a single input is given
        if length(x) == 6
            % Extract the first two elements from the 6x1 vector
            %r = x(1:2); % Extract only the x and y components
            r = [x(1); x(2); x(3)];
        else
            error('Input x must be a 6x1 vector.');
        end
    elseif nargin == 3
        % Case when three separate inputs are given (x, y, z)
        t = [x; y; z];
        r = [eye(3), t;  % Create a transformation matrix
             0, 0, 0, 1];
    else
        error('Invalid number of input arguments. Expecting 1 or 3.');
    end
end
