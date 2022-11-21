function MODEL = train(T_cell)
% Computes the texture model
    N = size(T_cell, 2);
    MODEL = zeros(N, 9, 3);
    for n = 1:N
        for k = 1:9
            for rgb = 1:3
                A = conv2(T_cell{n}(:,:,rgb), get_laws_kernel(k), 'same');
                MODEL(n,k, rgb) = mean(A.^2, 'all');
            end
        end
    end
end
