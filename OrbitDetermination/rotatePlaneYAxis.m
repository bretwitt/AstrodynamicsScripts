function [x,y,z] = rotatePlaneYAxis(x,y,z,i)
%ROTATEPLANEYAXIS Summary of this function goes here
%   Detailed explanation goes here
    plane = [cosd(i) 0 -sind(i); 0 1 0; sind(i) 0 cosd(i)] * [x;y;z];
    x = plane(1,:);
    y = plane(2,:);
    z = plane(3,:);
end

