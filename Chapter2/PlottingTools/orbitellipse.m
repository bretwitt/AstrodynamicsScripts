function orbitellipse(p, e, i, color) 
% p,e,i are all scalars

    axis equal
    hold on;
    sphere(30);
    
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
    
    %% Plot
    plot = plot3(x,y,z);
    
    set(plot,"Color",color, "LineWidth", 2);

end