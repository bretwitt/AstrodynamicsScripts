function [x,y,z] = rotatePlaneZAxis(x,y,z,i)
%ROTATEPLANEZAXIS Summary of this function goes here
%   Detailed explanation goes here
    plane = [ cosd(i) sind(i) 0 ; -sind(i) cosd(i) 0; 0 0 1 ] * [x; y; z;];
    x = plane(1,:);
    y = plane(2,:);
    z = plane(3,:);
end

