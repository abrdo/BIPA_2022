function SEGMENTED_IMG = classmap2img(CLASSMAP, colors)
    h = size(CLASSMAP, 1);
    w = size(CLASSMAP, 2);
    SEGMENTED_IMG = zeros(h, w, 3);
    for x = 1:h
        for y = 1:w
            SEGMENTED_IMG(x,y,:) = colors{CLASSMAP(x,y)}; 
        end
    end
    SEGMENTED_IMG = uint8(SEGMENTED_IMG);
   
end
    
%%% test
%     [samples, colors] = def_train_samples();
%     CLASSMAP = [1 1 2 3;
%                 1 1 4 3;
%                 5 5 4 4;
%                 6 6 6 6];
%     IMG_SEGMENTED = classmap2img(CLASSMAP, colors);
%     figure(1)
%     subplot(121)
%     imagesc(CLASSMAP)
%     subplot(122)
%     imshow(IMG_SEGMENTED)


