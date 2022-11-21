function [CLASS_MAP] = segment(IMG, MODEL)
    sx = size(IMG,1);
    sy = size(IMG,2);
    num_of_classes = size(MODEL,1);
    
    BB = zeros(sx, sy, 9, 3);
    for k = 1:9
        for rgb = 1:3
            B = conv2(IMG(:,:,rgb), get_laws_kernel(k), 'same');
            B_squared_avg = conv2(B.^2, (1/(15*15))*ones(15), 'same');
            % e = 8;  % edge expansion because of convolution -- 8 = (3-1)/2 + (15-1)/2
            BB(:, :, k, rgb) = B_squared_avg; %(1+e:end-e, 1+e:end-e);
        end
    end

    CLASS_MAP = zeros(sx, sy);
    sum_abs_diff = zeros(num_of_classes,1);
    for x = 1:sx
        for y = 1:sy
            for n = 1:num_of_classes
                sum_abs_diff(n)  =  sum(abs( squeeze(BB(x,y,:,:)) - squeeze(MODEL(n,:,:)) ), 'all');
            end
            [minval, texture_class_index] = min(sum_abs_diff);
            CLASS_MAP(x,y) = texture_class_index;
        end
    end
    
end