function [] = plotorbit(a,e,i)
%PLOTORBIT Summary of this function goes here
%   Detailed explanation goes here
    hold on
    axis auto
    axis equal
    sphere(30);
    orbitellipse(a,e,i);
    title("3d Orbit View");
    str = ['a=' num2str(a,3)];
    str1 = ['e=' num2str(e,3)];
    str2 = ['i=' num2str(i,3)];
    % display it later
end

