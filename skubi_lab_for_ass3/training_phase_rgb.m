function MODEL = training_phase(T_cell)
    N = size(T_cell,2);
    MODEL = zeros(N,9);
    for n=1:N % texture index
        for k=1:9 % filter kernel index
            % convolve training texture with kernel
            A = conv2_via_fft(T_cell{n},laws_kernel(k),'same');
            
            MODEL(n,k) = 1/(size(T_cell{n},1)*size(T_cell{n},2)) * sum(sum(A.^2));
        end
    end
end
