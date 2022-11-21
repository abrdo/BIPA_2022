function OUT = majority_voting(IN, w_dia)
    OUT = zeros(size(IN));
    for x=1:w_dia:size(IN,1)
        for y=1:w_dia:size(IN,2)
            x_start = x;
            x_end = min(x+w_dia-1,size(IN,1));
            y_start = y;
            y_end = min(y+w_dia-1,size(IN,2));
            SelectedWindow = IN(x_start:x_end,y_start:y_end);
            MajorityValue = mode(mode(SelectedWindow));
            OUT(x_start:x_end,y_start:y_end) = MajorityValue;
        end
    end
end
