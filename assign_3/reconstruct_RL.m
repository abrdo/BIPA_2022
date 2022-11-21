function IMG_REC = reconstruct_RL(IMG_IN, h)
    h = flip(h);
    
    px = floor(size(h,1)/2);
    py = floor(size(h,2)/2);

    IMG = double(rgb2gray(IMG_IN));
    % IMG = padarray(IMG_IN,[3 15],'replicate','both');
    IMG_REC = IMG;
    h = h>0;
    h = double(h);
    
    % IMG_REC = IMG_IN;
    
    for i = 1:9
        IMG_REC = double(IMG_REC);
        
        tmp = conv2_via_fft(IMG_REC, h);
        tmp = tmp(px+1:end-px, py+1:end-py);
        tmp1 = IMG ./ tmp;
        tmp2 = flip(h);
        tmp11 = conv2_via_fft(tmp1, tmp2);
        tmp11 = tmp11(px+1:end-px, py+1:end-py);
        %IMG_REC = padarray(IMG_REC,[3*2 15*2],'replicate','both');
        IMG_REC = IMG_REC .* tmp11;
        
        IMG_REC = cast(IMG_REC, 'uint8');
        figure(i)
        imshow(IMG_REC);
    end
    
end

