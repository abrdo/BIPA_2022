function IMG_REC = reconstruct_RL(IMG_IN, h, iter)
    img = double(IMG_IN);
    otf = psf2otf(h,size(IMG_IN)); 
    for i = 1:iter
        imgf = fft2(img); 
        imgH = otf.*imgf; 
        imgHif = ifft2(imgH); 
        r = double(IMG_IN)./imgHif; 
        rf = fft2(r); 
        res = otf .* rf; 
        resf = ifft2(res); 
        img = resf.*img; 
    end
    IMG_REC = uint8(img);
end

