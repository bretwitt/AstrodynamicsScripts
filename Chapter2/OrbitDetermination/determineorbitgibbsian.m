%% From 3 position vectors finds: Semi Major Axis, Orbital Parameter, Eccentricity, Perifocal Position, Velocity (of first vector... in this function)

function [a, p, e, Q, W, P, v1] = determineorbitgibbsian(r1, r2, r3)

    coplanarTest = dot(r1,cross(r3,r3));
    
   if(coplanarTest ~= 0)
       fprintf('Given positions do not represent an orbit');
       return;
   end
    
    r1scal = norm(r1);
    r2scal = norm(r2);
    r3scal = norm(r3);
    
    N = cross(r3scal .* r1, r2) + cross(r1scal .* r2, r3) + cross(r2scal .* r3, r1);
    D = cross(r1,r2) + cross(r2,r3) + cross(r3,r1);
    S = ((r2scal - r3scal) .* r1) + ((r3scal - r1scal) .* r2) + ((r1scal - r2scal) .* r3);
    
    if(D == 0 | N == 0 | dot(D,N) < 0) 
        fprintf('Given positions do not represent an orbit');
        return;
    end
    
    L = sqrt(1 ./ (norm(D)*norm(N)));
    B = cross(D,r1);
    
    v1 = ((L ./ r1scal)) .* B + (L .* S); 
    v1scal = norm(v1);
    
    p = norm(N) ./ norm(D);
    e = norm(S) ./ norm(D);
    a = p / (1-e^2);
    Q = S ./ norm(S);
    W = N ./ norm(N);
    P = cross(Q,W);
    
end
