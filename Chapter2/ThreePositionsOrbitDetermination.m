addpath OrbitDetermination
r1 = [0.70711255 0 0.70710101];
r2 = [-0.89497879 0.56568081 -0.0949618];
r3 = [0.0949618 -0.56568081 -0.89497879];


[a,p,e,Q,W,P,v] = determineorbitgibbsian(r1,r2,r3);

Q = norm(Q);
W = norm(W);
P = norm(P);
v = norm(v);

fprintf('a %.2f p %.2f e %.2f Q %.2f W %.2f P %.2f v1 %.2f \n', a,p,e,Q,W,P,v);
plotorbit(p,e,0);