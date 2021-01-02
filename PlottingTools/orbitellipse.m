function orbitellipse(p, e, i, raan, color) 
% p,e,i are all scalars
    
    i = deg2rad(i);
    
    %% Cartesian representation of orbital equation on fundamental plane
    t = linspace(0,2*pi);
    r = p ./ (1+e*cos(t));
    x = r.*cos(t);
    y = r.*sin(t);
    z = zeros(1,100);
    
    %% Transform orbital plane about Y axis i degrees
    inclinedOrbit = [cos(i) 0 -sin(i); 0 1 0; sin(i) 0 cos(i)] * [x;y;z];
    
    x = inclinedOrbit(1,:);
    y = inclinedOrbit(2,:);
    z = inclinedOrbit(3,:);
    

    %% Rotate Orbit around Z axis to match RAAN
    
    rotAboutZ = [ cosd(raan) sind(raan) 0 ; -sind(raan) cosd(raan) 0; 0 0 1 ] * [x; y; z;];
    
    x = rotAboutZ(1,:);
    y = rotAboutZ(2,:);
    z = rotAboutZ(3,:);
    
    
    %% Plot
    plot = plot3(x * 6378.136,y * 6378.136,z * 6378.136);
    set(plot,"Color",color, "LineWidth", 1);

end