function [OUT] = majority_vote(IN, w_dia)
    OUT = IN;
    
    for x = 1 : w_dia : size(IN,1)
        for y = 1 : w_dia : size(IN, 2)
            startX = x;
            endX = min([x+w_dia-1, size(IN,1)]);
            startY = y;
            endY = min([y+w_dia-1, size(IN,2)]);
            SelectedWindow = IN(startX:endX, startY:endY);
            MajorityValue = mode(mode(SelectedWindow));
            OUT(startX:endX, startY:endY) = MajorityValue;
        end
    end
    
end

