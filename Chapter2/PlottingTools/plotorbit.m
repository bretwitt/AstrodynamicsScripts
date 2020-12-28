function [] = plotorbit(p, e, i, color)
%PLOTORBIT Summary of this function goes here
%   Detailed explanation goes here

    title('Project Orbit(s) of Satellite', "FontSize", 10, "FontWeight", 'normal');
    xlabel('x-axis (DUe)');
    ylabel('y-axis(DUe)');
    
    orbitellipse(p, e, i, color);
    
    xlim auto
    ylim auto
    zlim auto
    xlim ([-2,2]);
    ylim ([-2,2]);
    zlim ([-2,2]);

end

