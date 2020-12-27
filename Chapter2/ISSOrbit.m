addpath OrbitDetermination

%% Script to test orbitdetermination function


% Example vectors of the ISS 12/26/20 converted to DUe or DUe/TU
% Accessed from https://spaceflight.nasa.gov/realdata/sightings/SSapplications/Post/JavaSSOP/orbit/ISS/SVPOST.html

r = [0.292768687676 -0.838731022264 0.587159656632];
v = [0.795986637698 -0.103850330044 -0.543736570272];

elements = determineorbit(r,v);
%plotorbit(elements(1),elements(2),elements(3));