addpath Manuevers PlottingTools OrbitDetermination

% Regular circular orbit
r = [1.0627, 0, 0];
v = [0, 0.97, 0];
[a,e] = determineorbit(r,v);
e = norm(e);
p = a * (1 - e^2);

% New orbit 
r1 = [1.4703 0, 0];
v1 = [0, 0.8247, 0];
[a1,e1] = determineorbit(r1,v1);

e1 = norm(e1);
p1 = a1 * (1 - e1^2);

% Calculate Hohmann Transfer
[deltaV, at, et, pt] = hohmanntransfer(norm(r), norm(r1));

% Plot these orbits
plotorbit(p,e,0, 'green');
plotorbit(p1,e1,0, 'blue');
plotorbit(pt,et,0, 'red');

fprintf('dV of Hohmann Transfer: %.2f\n', deltaV);