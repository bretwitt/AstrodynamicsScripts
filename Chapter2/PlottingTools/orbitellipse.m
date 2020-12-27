function orbitellipse(a, e, i) 
    i = deg2rad(i);
    b = sqrt(a^2*(1 - e^2));
    ellipse(0,0,a,b,i);
end