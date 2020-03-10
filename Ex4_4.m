close all;
clear;
clc;

f = @(u, t) 0.1*(1 - u/500)*u;
U_0 = 100;

expression = 1;
k = 0;

while expression == 1
    
    close all;
   
    dt = 60; T = 100;
    dtk = 2^k * dt;
    [u, t] = ode_FE(f, U_0, dtk, T);
    plot(t, u, 'r-');
    hold on;

    dt = 60; T = 100;
    dtk = 2^(k-1) * dt;
    [u, t] = ode_FE(f, U_0, dtk, T);
    plot(t, u, 'b-');
    xlabel('t'); ylabel('N(t)');
    legend('dtk-1', 'dtk', 'Location', 'southeast');
    
    fprintf('dtk value is: %g\n', dtk);
    expression = input('Smaller dtk? (Yes = 1/No = 0):');
    
    k = k - 1;
    
end

