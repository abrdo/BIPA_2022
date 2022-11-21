function [cx, cy] = find_plate(img, r)
    r = r + 300;

    if size(size(img),2) == 3
        img = rgb2gray(img);
    end

    s = 2*r-1;
    k = zeros(s);
    for x = 1:s
        for y = 1:s
            if (x-r)^2 + (y-r)^2 < r^2
                k(x,y) = 1;
            end
        end
    end
    
    cv = conv2_via_fft(img, k, 'same');
    
    % get max (x,y)
    [maxs_in_cols, max_xs] = max(cv);
    [max_val, max_y] = max(maxs_in_cols);
    inds = find(maxs_in_cols == max_val);
    max_x = max_xs(inds(1));
    
    cx = max_x;
    cy = max_y;
    
    %%% SHOW %%%
    img(cx-10:cx+10, cy-10:cy+10) = 0;
    cv(cx-10:cx+10, cy-10:cy+10) = 0;
    
    
    figure(1111);
    subplot(121);
    imagesc(img);
    subplot(122);
    imagesc(cv);    
end

