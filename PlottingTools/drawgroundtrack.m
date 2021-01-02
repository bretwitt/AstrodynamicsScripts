function drawgroundtrack(p, e, i, raan, tae, orbits) 
    hold on
    theta = linspace(0,700, 100);
    
    %% Earth's Rotation
    a = p / (1-norm(e)^2);
    T = 360 * sqrt(a^3) * 13.4468 / 60 / 60;
    deltaN = T * 15;
    factor = (360 - deltaN) / 360;
    theta = theta .* factor;

    %% Solve Orbit Lats   

    [lat,long] = coordinatesorbit(theta,p,norm(e),i,raan, 100);
    
    %% Solve future orbits
    for n=1:orbits
        [latfuture(n,:),longfuture(n,:)] = coordinatesorbit(theta, p, norm(e), i, raan -(deltaN*n), 100);
    end
    
    %% Solve TAE Lat
    [taelat, taelong] = coordinatesorbit(tae, p, norm(e), i, raan, 1);
    
    %% Plot
    map = worldmap('World');
    setm(map, 'MapProjection','eqdcylin');
    setm(map, 'MlabelParallel', 'south');
    p = findobj(map,'type','patch');
    set(p, 'FaceColor',  [0.8 0.8 0.8]);
    mlabel('on');
    
    geoshow('landareas.shp', 'FaceColor', 'white');
    geoshow(lat,long, 'Color','blue','LineWidth',1);
    
    for n=1:orbits
        geoshow(latfuture(n,:),longfuture(n,:), 'Color','yellow','LineWidth',0.7);
    end
    %% Annotate Important Elements
    textm(taelat,taelong,'\leftarrow SAT','Color','red')
    
    hold on


end