function [x_tilde] = restoration_wiener_white(y, h, var_n)
    Y = fft2(y);
    H = psf2otf(h,size(Y));
    NSPR = var_n/var(y(:));
    
    % we assume white noise, so:
    R = conj(H) ./ (abs(H).^2 + NSPR);
    x_tilde = abs(ifft2(R.*Y));
end
