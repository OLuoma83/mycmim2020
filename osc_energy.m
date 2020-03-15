function [f_pot, f_kin] = osc_energy(u, v, omega)
    f_pot = (1 / 2) * omega^2 * u^2;    % Potential energy calculations
    f_kin = (1 / 2) * v^2;              % Kinetic energy calculations
end
