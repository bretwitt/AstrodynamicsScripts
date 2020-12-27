clear
clc

% Radar Readings (Deg & DU)
El= -40.1;
Az = 165.4;
p = 2.26;

dp = 0;
dAz = -10;
dEl= 50;

% Radar Location (Deg)
Long = -106;
Lat = 53;

% Time
thetaG0 = 210; 
D = 10;

% Calculating  Local Sidreal Time
thetaG = thetaG0 + 1.00273739 * 2 * pi * D;
theta = thetaG + Long;

% Calculate SEZ/Topographic Position & Velocity vectors
ps = -p * cosd(El) * cosd(Az);
pe = p * cosd(El) * sind(Az);
pz = p * sind(El);

dps = (-dp*cosd(El)*cosd(Az)) + (p*sind(El)*dEl*cosd(Az)) + (p*cosd(El)*sind(Az)*dAz);
dpe = (dp*cosd(El)*sind(Az)) - (p*sind(El)*dEl*sind(Az)) + (p*cosd(El)*cosd(Az)*dAz);
dpz = (dp*sind(El))+(p*cosd(El)*dEl);
    
sezPosition = [ ps; pe; pz + 1];
sezVelocity = [ dps; dpe; dpz ];

% Transform position Vector SEZ/Topographic => IJK/Geocentric vector 
r1 = sind(Lat) * cosd(theta);
r2 = -sind(theta);
r3 = cosd(Lat) * cosd(theta);
r4 = sind(theta) * sind(Lat);
r5 = cosd(theta);
r6 = cosd(Lat) * sind(theta);
r7 = -cosd(Lat);
r8 = 0;
r9 = sind(Lat);

sezToIJKMatrix = [ r1 r2 r3; r4 r5 r6; r7 r8 r9];

% IJK/Geocentric Vectors
ijkPos = sezToIJKMatrix * sezPosition;
ijkVel = sezToIJKMatrix * sezVelocity;
    
earthAngularVelocity = cross([0,0,0.0588], ijkPos);
r = ijkPos(:)';
v = ijkVel(:)' + earthAngularVelocity;

% Solve Keplerian Elements 

ke = determineorbit(r,v);

a = ke(1);
e = ke(2);
i = ke(3);
raan = ke(4);
aop = ke(5);

% Print results

plotOrbit(a,norm(e),i);

fprintf('### Orbit Determination @ LST %.1f STN LOC %.1f LAT %.1f LONG\n### STN INIT (RNG %.1f EL. %.1f AZ. %.1f)', theta, Lat, Long, p, El, Az);
fprintf('=> VEC %.2fS %f.2E %.2fZ\n', sezPosition(1),sezPosition(2),sezPosition(3));

fprintf('+ Object Position (Geocentric) = %.4fI %.4fJ %.4fK\n', r(1), r(2), r(3));
fprintf('+ Object Velocity (Geocentric) = %.4fI %.4fJ %.4fK\n', v(1), v(2), v(3));
fprintf('+ KE (a %.2f ; e %.2f ; i %.2f ; RAAN %.2f ; AOP %.2f ; v0 %.2f)\n', a, norm(e), i, raan, aop, tae);
