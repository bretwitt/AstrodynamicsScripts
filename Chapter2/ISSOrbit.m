addpath OrbitDetermination

%% Script to test orbitdetermination function


% Example vectors of the ISS 12/26/20 converted to DUe or DUe/TU
% Accessed from https://spaceflight.nasa.gov/realdata/sightings/SSapplications/Post/JavaSSOP/orbit/ISS/SVPOST.html

r = [-0.815 0.3133 0.6086];
v = [0.0812 -0.8109260 0.5247];

elements = determineorbit(r,v);
%plotorbit(elements(1),elements(2),elements(3));