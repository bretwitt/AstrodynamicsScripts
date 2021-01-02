
function [lat,long] = coordinatesorbit(theta, p, e, i, raan, arraylength)
%COORDINATESORBIT Summary of this function goes here
%   Detailed explanation goes here
    r = p ./ (1+norm(e)*cosd(theta));
    x = r.*cosd(theta);
    y = r.*sind(theta);
    z = zeros(1,arraylength);
    % Rotate Orbit around Y axis I deg
    [inclX, inclY, inclZ] = rotatePlaneYAxis(x, y, z, i);
    % Rotate Orbit around Z axis to match RAAN
    [raanX, raanY, raanZ] = rotatePlaneZAxis(inclX,inclY,inclZ,raan);
    x = raanX .* 6378.136;
    y = raanY .* 6378.136;
    z = raanZ .* 6378.136;
    % Find Geodetic Lattitude and Longitude (w/ WGS84 Ellipsoid)
    [geodlat,geodlong] = ecef2geodetic(wgs84Ellipsoid('kilometer'), x, y, z);
    lat = geodlat;
    long = geodlong;
end

