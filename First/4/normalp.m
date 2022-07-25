function [ksi, nu] = normalp(n ,m)
    psi = 2*pi * rand(n, m);
    omega = expdist(1/2, n, m);
    ksi = sqrt(omega).*cos(psi);
    nu = sqrt(omega) .*sin(psi);
end