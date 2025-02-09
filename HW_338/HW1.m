% Define the time vector from 0 to 10 seconds
t = linspace(0, 10, 1000);

% Define the function x(t)
x = 2 * exp(-t) - exp(-2 * t);

% Plot the function
figure;
plot(t, x, 'LineWidth', 1.5);
title('Plot of x(t) = 2e^{-t} - e^{-2t}');
xlabel('Time (seconds)');
ylabel('x(t)');
grid on;
