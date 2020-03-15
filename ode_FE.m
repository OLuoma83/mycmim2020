function [sol, time] = ode_FE(f, U_0, dt, T)

    N_t = floor(T/dt);                      % Amount of time steps, rounded to low
    u = zeros(N_t+1, 1);                    % Initialize array result array with zeros
    t = linspace(0, N_t*dt, length(u));     % Initialize time step array with equally spaced values
    u(1) = U_0;                             % Set first result value from function argument
    
    for n = 1:N_t                           % Loop until all time steps are go thru
        u(n+1) = u(n) + dt*f(u(n), t(n));
    end
    
    sol = u;                                % Function return values
    time = t;
end