function ClassMap = recognition_phase(I, MODEL)
    ClassMap = zeros(size(I));
    BB = zeros(size(I,1),size(I,2),9);
    N = 1/(15*15) * ones(15);
    sum_abs_diff = zeros(size(MODEL,1),1); % number of textures
    for k=1:9
        B = conv2_via_fft(I,laws_kernel(k),'same');
        BB(:,:,k) = conv2_via_fft(B.^2,N,'same');
    end
    for y=1:size(I,1)
        for x=1:size(I,2)
            for n=1:size(MODEL,1)
                sum_abs_diff(n) = sum(abs(transpose(squeeze(BB(x,y,:)))-MODEL(n,:)));
            end
            [m,i] = min(sum_abs_diff);
            ClassMap(x,y) = i;
        end
    end
end
