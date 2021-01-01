function drawgroundtrack(p, a, e, i, raan) 
    hold on
    
    %% Solve Orbit    
    long = linspace(0,360, 100);
    
    r = p ./ (1+norm(e)*cosd(long));
    x = r.*cosd(long);
    y = r.*sind(long);
    z = zeros(1,100);
    
    %% Rotate Orbit around Y axis I deg
    inclinedOrbit = [cosd(i) 0 -sind(i); 0 1 0; sind(i) 0 cosd(i)] * [x;y;z];
    
    x = inclinedOrbit(1,:);
    y = inclinedOrbit(2,:);
    z = inclinedOrbit(3,:);
    
    %% Convert to km
    x = x .* 6378.136;
    y = y .* 6378.136;
    z = z .* 6378.136;
    
    %% Find Geodetic Lattitude and Longitude (w/ WGS84 Ellipsoid)
    [lat,long] = ecef2geodetic(wgs84Ellipsoid('kilometer'), x,y,z);
    
    long = long + raan;
    
    
    %% Plot
    map = worldmap('World');
    setm(map, 'MapProjection','eqdcylin');
    p = findobj(map,'type','patch'); % Find background
    set(p, 'FaceColor',  [0.8 0.8 0.8]);
    mlabel('off');
    geoshow('landareas.shp', 'FaceColor', 'white');
    geoshow(lat,long, 'Color','blue','LineWidth',2);   

    hold on


end