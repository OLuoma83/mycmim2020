close all;
clear;
clc;

f = @(u, t) 0.1 * (1 - u / 500) * u;    % ODE function
U_0 = 100;                              % Initial value of first result

expression = 1;
k = 0;

while expression == 1                   % Loop until user wants to end 
    
    close all;                          % Close all plot windows before next loop round
   
    dt = 60; T = 100;                   % 
    dtk = 2^k * dt;                     % Calculates and plots values using smallest dtk value
    [u, t] = ode_FE(f, U_0, dtk, T);    %
    plot(t, u, 'r-');                   %
    
    hold on;

    dt = 60; T = 100;                   %
    dtk = 2^(k-1) * dt;                 % Calculates and plots values using 
    [u, t] = ode_FE(f, U_0, dtk, T);    % second smallest dtk value (dtk-1)
    plot(t, u, 'b-');                   %
    
    xlabel('t'); ylabel('N(t)');                        %
    legend('dTk-1', 'dTk', 'Location', 'southeast');    % Plot visualisation definitions
    str = sprintf('dTk = %.3g',dtk);
    title(str);                          %
    
    fprintf('dtk value is: %g\n', dtk);                     % User input if values using smaller timestep 
    expression = input('Smaller dTk? (Yes = 1/No = 0):');   % will be calculated
    
    k = k - 1;
    
end

print('Ex4_4', '-dpng');                % Print plot to png file

