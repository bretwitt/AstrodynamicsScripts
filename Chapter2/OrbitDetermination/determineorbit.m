function [a, e, i, raan, aop, tae] = determineorbit(r,v)

%% Solve for orbital parameter & Specific Angular Momentum

h = cross(r,v);

p = norm(h)^2;

%% Solve for Keplerian Elements

% Eccentricity Vector
e = cross(v,h) - (r / norm(r));

% Semi-Major Axis
a = p / (1-norm(e)^2);

% Line of Nodes
n = [ -h(2), h(1), 0 ];
%n = cross(h,[0 0 1]);

% Inclination
i = acosd(h(3) ./ norm(h));

% Right Ascension of Ascending Node
raan = norm(acosd(n(1) / norm(n)));
if n(2) < 0                         % This (and others) might be in error, will have to mathematically verify
    raan = raan * 2;
end

% Argument of Periapsis/Perigee
aop = norm(acosd((dot(n,e)) / (norm(n)*norm(e))));
if e(3) < 0
    raan = raan * 2;
end

% True Anomaly at Epoch 
tae = norm(acosd((dot(e,r)) / (norm(e)*norm(r))));

% Apogee/Periapsis or Apoapsis/Periapsis
ap = p / (1 + norm(e));
peri = p / (1 - norm(e));

% Print results
fprintf('### Basic Orbit Data ###\n');
fprintf('+ Keplerian Elements (a %.2f ; e %.2f ; i %.2f ; RAAN %.2f ; AOP %.2f ; v0 %.2f)\n', a, norm(e), i, raan, aop, tae);
fprintf('+ ap %.2f peri %.2f\n', ap,peri);

end