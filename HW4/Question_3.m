% Define symbolic variables
syms L1 L2 L3 theta1 theta2 theta3 real
syms s1 s2 s3 c1 c2 c3 s12 s23 c12 c23 s123 c123

% Define sin and cos shorthand for each angle
s1 = sin(theta1); c1 = cos(theta1);
s2 = sin(theta2); c2 = cos(theta2);
s3 = sin(theta3); c3 = cos(theta3);
s12 = sin(theta1 + theta2); c12 = cos(theta1 + theta2);
s23 = sin(theta2 + theta3); c23 = cos(theta2 + theta3);
s123 = sin(theta1 + theta2 + theta3); c123 = cos(theta1 + theta2 + theta3);

% Define the Jacobian matrix
J = [
    -L1*s1 - L2*s12 - L3*s123, -L2*c1*s2 - L3*c1*s23, -L3*c1*s23;
    L1*c1 + L2*c12 + L3*c123, L2*s1*s2 - L3*s1*s23, -L3*s1*s23;
    0, L2*c2 + L3*c23, L3*c23
];

% Compute the determinant of the Jacobian matrix
det_J = simplify(det(J));

% Display the result
disp('The determinant of the Jacobian is:');
pretty(det_J);
