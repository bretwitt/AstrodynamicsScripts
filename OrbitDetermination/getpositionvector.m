function [r] = rotateVectorXAxis(p, e,angle)
    r = p ./ (1+norm(e)*cosd(long));
end

