function ellipse(xCenter,yCenter,SemiMajorRadius,SemiMinorRadius,phi)

% xCenter, yCenter are the centroids of the ellipse
% SemiMajorRadius,SemiMinorRadius are the valves of the lengths of the
% semimajor and semiminor axis
% phi is the tilt of the ellipse

phi = 3;
xRadius = SemiMajorRadius;
yRadius = SemiMinorRadius;

theta = 0 : 0.01 : 2*pi;

X_cen = [xCenter;yCenter];

X = [xRadius * cos(theta);
     yRadius * sin(theta)];

R = [cos(phi) -sin(phi);
     sin(phi) cos(phi)];
Xr = R*X + X_cen;

x = Xr(1,:);
y = Xr(2,:);

pl = plot(x, y,'Color',[1,0,0]);
set(pl, {'Color'},{'g'});
set(pl, {'LineWidth'},{3});

hold on;

% Plotting lines
% Coordinates of the semimajor axis
Xma1 = R*[xRadius * cos(pi); yRadius * sin(pi)] + X_cen;
Xma2 = R*[xRadius * cos(0); yRadius * sin(0)] + X_cen;

% Coordinates of the semiminor axis
Xmi1 = R*[xRadius * cos(pi/2); yRadius * sin(pi/2)] + X_cen;
Xmi2 = R*[xRadius * cos(-pi/2); yRadius * sin(-pi/2)] + X_cen;

line([Xma1(1), Xma2(1)],[Xma1(2), Xma2(2)],'Color', [1,0,0]);
line([Xmi1(1), Xmi2(1)],[Xmi1(2), Xmi2(2)],'Color', [1,0,0]);
end



