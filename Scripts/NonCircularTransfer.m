% Orbit 1
r1 = [1.097 0 0]
v1 = [0 1.087 0]

[a1 e1 i1] = determineorbit(r1,v1);
p1 = a1*(1-norm(e1)^2);

% Orbit 2
r2 =  [5.01 0 0];
v2 =  [0 0.5308 0];

[a2 e2 i2] = determineorbit(r2,v2);
p2 = a2*(1-norm(e2)^2);

% Transfer Ellipse

plotorbit(p1,norm(e1),i1,'r');
plotorbit(p2,norm(e2),i2,'b');
