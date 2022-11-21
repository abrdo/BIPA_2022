function cc = conv2_via_fft(a, b)
% application of the Convolution Theorem
%   zero padding applied
    if(size(size(a),2) ~= 2 || size(size(b),2) ~= 2)
        error("matrix dimensions must be 2");
    end
    
    sax = size(a, 1);
    say = size(a, 2);
    sbx = size(b, 1);
    sby = size(b, 2);
    ss = [sax+sbx-1, say+sby-1];
    
    aa = padarray(a, ss-[sax, say], 0, 'post');
    bb = padarray(b, ss-[sbx, sby], 0, 'post');
    
    AA = fft2(aa); 
    BB = fft2(bb); 
    
    
    cc = abs(ifft2(AA .* BB));
end

