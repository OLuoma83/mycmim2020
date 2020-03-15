close all;
clear;
clc;

f = @(u, v, omega) osc_energy(u, v, omega); % Function definition for kinetic and potential enegy


omega = 1;          %
dt = 0.01;          % Inital values
T = 1.6;            %

N_t = floor(T/dt);                  % Amount of time steps
t = linspace(0, N_t*dt, N_t+1);     % Initialize time step array with equally spaced values
u = zeros(N_t+1, 1);                % Initialize array result array with zeros
v = zeros(N_t+1, 1);                % Initialize array result array with zeros
pot = 0;                            % Initialize potential energy variable to zero
kin = 0;                            % Initialize kinetic energy variable to zero

X_0 = 2;            %
u(1) = X_0;         % Initial conditions
v(1) = 0;           %

for n = 1:N_t                               %
    [pot, kin] = f(u(n), v(n), omega);      %
    v(n+1) = v(n) - dt * pot;               % Loop calculates kinetic and potential energy
    [pot, kin] = f(u(n), v(n+1), omega);    % and u and v values using Euler-Cromer method
    u(n+1) = u(n) + dt * kin;               %
end

plot(t, v+u);                               % Plot energy sum

legend('Euler-Cromer', 'Location','northwest'); %
xlabel('t');                                    % Plot visualisation definitions
ylabel('potential + kinetic energy');           %
title('\Omega = 1, \Deltat = 0.01, T = 1.6');   %

print('osc_EC_energy', '-dpng');                % Print plot to png file


