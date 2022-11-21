function [x_tilde] = restoration_wiener_white(y, h, var_n)
    y = mat2gray(y);
    Y = fft2(y);
    H = psf2otf(h,size(Y));
    NSPR = var_n/var(y(:));
    
    % we assume white noise, so:
    R = conj(H) ./ (abs(H).^2 + NSPR);
    x_tilde = abs(ifft2(R.*Y));
    x_tilde = im2uint8(x_tilde);
end
