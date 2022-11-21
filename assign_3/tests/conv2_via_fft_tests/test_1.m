% result is equivalent with conv2()

k = [0 0 0;
     0 1 0.2;
     0 0 0];

g = [0 0 2;
     0 2 0.1];

% conv
c = conv2(k,g)
cf = conv2_via_fft(k,g)

equal = c == cf




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 1D example for Conv Theorem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Initialize a signal
% v = [1 2 3 4 5 6 7];
% u = [1 2 3 4 5];
% 
% % Convolve u and v
% cv = conv(u, v)
% 
% 
% 
% % Copy and pad signal
% vv = padarray(v, [0, size(u, 2) - 1], 0, 'post')
% uu = padarray(u, [0, size(v, 2) - 1], 0, 'post')
% 
% % Compute FFT
% fu = fft(uu);
% fv = fft(vv);
% 
% % Inverse FFT of frequency signal
% fcv = ifft(fu .* fv)

