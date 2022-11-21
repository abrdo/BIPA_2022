function areas_in_pxls = processor(IMG_IN, h, MODEL, colors, plate_mask, crop_xs, crop_ys, img_empty, num)
    %% 2. uses an iterative deconvolution method (Richardson-Lucy)
    
    
    % IMG_REC = reconstruct_RL(IMG_IN, h);
    
    % --- I implemented it, but it does not work.. I did not found the
    % mistake..
    
    IMG_REC = deconvlucy(IMG_IN, h, 1);


    %% 3. applies local contrast enhancement (Wallis filter)
    
    IMG_IN = mat2gray(IMG_IN);
    IMG_REC = restoration_wiener_white(IMG_IN, h, 0.001);
    IMG_REC = mat2gray(IMG_REC, [0, 1]);
    
    figure(1)
    subplot(121)
    imshow(IMG_IN)
    title("Original (degraded) image")
    subplot(122)
    imshow(IMG_REC)
    title("Restored (R-L deconv.) image")
    
    % saving
    % imwrite(IMG_REC, "train_samples/recovered_00.jpg");


%IMG_REC = im2double(IMG_IN);

     
    %% plate masking, cropping, subtruct empty
    % IMG_IN = IMG_IN - img_empty;
    IMG_MASKED = IMG_REC .* plate_mask;
    IMG_MASKED = IMG_MASKED(crop_xs(1):crop_xs(2), crop_ys(1):crop_ys(2), :);
    figure(111)
    imshow(IMG_MASKED)
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %% 4. identifies the regions using a texture matching algorithm (Laws filter)
    
    CLASSMAP = segment(IMG_MASKED, MODEL);
    
    figure(33)
    subplot(121)
    imshow(IMG_MASKED)
    subplot(122)
    imagesc(CLASSMAP)
    axis equal off;
    title("Segmented image");
    % disp(IMG_CLASSMAP);
    
    %% 5. filters/enhances the result based on majority voting
    %  6. returns a segmented image showing the clustered region map
    
    CLASSMAP = majority_vote(CLASSMAP, 10);
    IMG_SEGMENTED = classmap2img(CLASSMAP, colors);
    
    figure(333)
    subplot(121)
    imshow(IMG_MASKED)
    subplot(122)
    % imagesc(IMG_CLASSMAP)
    imshow(IMG_SEGMENTED);
    axis equal off;
    title("Segmented image");
    disp(CLASSMAP);
   
    
    %% areas in pxls
    areas_in_pxls = count_areas_of_classes(CLASSMAP, 4);
end

