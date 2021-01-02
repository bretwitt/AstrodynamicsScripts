addpath OrbitDetermination\ PlottingTools\

%% Script to test orbitdetermination function


% Example vectors of the ISS 12/26/20 converted to DUe or DUe/TU
% Accessed from https://spaceflight.nasa.gov/realdata/sightings/SSapplications/Post/JavaSSOP/orbit/ISS/SVPOST.html

r = [0.292762445015 -0.838713138133 0.587147136718];
v = [0.795986637698 -0.103850330044 -0.543736570272];

[a,e,i, raan, aop, tae] = determineorbit(r,v);

p = a*(1-norm(e)^2);
peri = a*(1-norm(e));
apoap = a*(1+norm(e));
T = 360 * sqrt(a^3) * 13.4468 / 60;

figure('Name', "Ground Track");
title('ISS Ground Track');
drawgroundtrack(p, norm(e), i, raan,tae, 3);

figure('Name','Earth View');
title('Earth View');
hold on
h1 = gca;
earth_sphere(h1,'km');
plotorbit(p,norm(e),i, raan,'y');

% Print results
fprintf('### Basic Orbit Data ###\n');
fprintf('+ COE # a %.2f # e %.2f # i %.2f # RAAN %.2f # AOP %.2f # v0 %.2f #\n', a, norm(e), i, raan, aop, tae);
fprintf('+       T %.2fmin # Peri %.2f # Apo %.2f\n', T, peri,apoap);
fprintf('+ ');