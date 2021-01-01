function [] = plotorbit(p, e, i, color)
%PLOTORBIT Summary of this function goes here
%   Detailed explanation goes here
    orbitellipse(p, e, i, color);
    hold on
    axis equal
end

