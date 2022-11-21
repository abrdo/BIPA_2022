function [MASK] = get_circle_mask(sx, sy, r, cx, cy)
    MASK = zeros(sx, sy);
    for x = 1:sx
        for y = 1:sy
            if (x-cx)^2 + (y-cy)^2 < r^2
                MASK(x,y) = 1;
            end
        end
    end
end

