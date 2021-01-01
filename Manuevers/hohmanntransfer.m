function [deltaV, a, e , p] = hohmanntransfer(r1, r2)

%% Velocity of both circular orbits
vcs1 = sqrt(1 / r1);
vcs2 = sqrt(1 / r2);

%% Calculate Transfer Ellipse

% Calculate semi-major axis, eccentricity, orbial parameter of transfer
% orbit
a = (r1 + r2) / 2;
e = -((r1 / a) - 1);
p = a * (1 - e^2);

% Calculate energy of the orbit
Et = -1/(r1+r2);

% Velocity of perigee of the transfer ellipse
v1 = sqrt(2*(1/r1)+Et);

% Calculate dV to get into transfer ellipse
dV1 = v1 - vcs1;

%% Calculate manuever of Transfer Ellipse to higher orbit

v2 = sqrt(2*(1/r2) + Et);

% Calculate dV to go from transfer ellipse into new orbit
dV2 = vcs2 - v2;

%% Calculate total dV

deltaV = dV1 + dV2;

end

