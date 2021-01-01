addpath OrbitDetermination\ PlottingTools\

%% Script to test orbitdetermination function


% Example vectors of the ISS 12/26/20 converted to DUe or DUe/TU
% Accessed from https://spaceflight.nasa.gov/realdata/sightings/SSapplications/Post/JavaSSOP/orbit/ISS/SVPOST.html

r = [0.292768687676 -0.838731022264 0.587159656632];
v = [0.795986637698 -0.103850330044 -0.543736570272];

[a,e,i, raan, aop, tae] = determineorbit(r,v);

p = a*(1-norm(e)^2);



drawgroundtrack(p, a, norm(e), i, raan);
orbit = figure('Name','Orbit');
sphere(30);
hold on
plotorbit(p, norm(e), i, 'g');


% Print results
fprintf('### Basic Orbit Data ###\n');
fprintf('+ COE (a %.2f ; e %.2f ; i %.2f ; RAAN %.2f ; AOP %.2f ; v0 %.2f)\n', a, norm(e), i, raan, aop, tae);
