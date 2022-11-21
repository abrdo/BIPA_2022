function IMG_REC = reconstruct_RL(IMG_IN, h)

    % After iteration 12 , results seem to be worsened. 12 is a good.
    % Applying Richardson-Lucy Deconvolution Algorithm in spatial domain.
    iterations = 12;
    fn = double(I); % at the first iteration
    OTF = psf2otf(PSF,size(I)); 
    for i=1:iterations
        ffn = fft2(fn); 
        Hfn = OTF.*ffn; 
        iHfn = ifft2(Hfn); 
        ratio = double(I)./iHfn; 
        iratio = fft2(ratio); 
        res = OTF .* iratio; 
        ires = ifft2(res); 
        fn = ires.*fn; 
    end
    % Typecasted to uint8 
    result = uint8(fn);
    
    
%     h = flip(h);
%     
%     px = floor(size(h,1)/2);
%     py = floor(size(h,2)/2);
% 
%     IMG = double(rgb2gray(IMG_IN));
%     % IMG = padarray(IMG_IN,[3 15],'replicate','both');
%     IMG_REC = IMG;
%     h = h>0;
%     h = double(h);
%     
%     % IMG_REC = IMG_IN;
%     
%     for i = 1:9
%         IMG_REC = double(IMG_REC);
%         
%         tmp = conv2_via_fft(IMG_REC, h);
%         tmp = tmp(px+1:end-px, py+1:end-py);
%         tmp1 = IMG ./ tmp;
%         tmp2 = flip(h);
%         tmp11 = conv2_via_fft(tmp1, tmp2);
%         tmp11 = tmp11(px+1:end-px, py+1:end-py);
%         %IMG_REC = padarray(IMG_REC,[3*2 15*2],'replicate','both');
%         IMG_REC = IMG_REC .* tmp11;
%         
%         IMG_REC = cast(IMG_REC, 'uint8');
%         figure(i)
%         imshow(IMG_REC);
%     end
    
end

