function areas_in_pxls = processor(IMG_IN, h, r, MODEL, colors)
    
    %% 2. uses an iterative deconvolution method (Richardson-Lucy)

    IMG_REC = reconstruct_RL(IMG_IN, h, 10);

    figure(1)
    subplot(121)
    imshow(IMG_IN)
    title("Original (degraded) image")
    subplot(122)
    imshow(IMG_REC)
    title("Restored (R-L deconv.) image")

    %% 3. applies local contrast enhancement (Wallis filter)
    
    IMG_REC = restoration_wiener_white(IMG_REC, h, 0.001);
    
    figure(2)
    subplot(121)
    imshow(IMG_IN)
    title("Restored (R-L deconv.) image")
    subplot(122)
    imshow(IMG_REC)
    title("Wallis-filtered deconvolved image")
     
    %% plate masking, cropping  
    [cx, cy] = find_plate(IMG_REC, 1058);
    plate_mask = get_circle_mask(r-40, cx, cy, size(IMG_REC,1), size(IMG_REC,2));
    
    IMG_MASKED = IMG_REC .* plate_mask;
    IMG_MASKED = IMG_MASKED(1+cx-r : 1+cx+r,   1+cy-r : 1+cy+r, :);
    figure(111)
    imshow(IMG_MASKED)
    
    %% 4. identifies the regions using a texture matching algorithm (Laws filter)
    CLASSMAP = segment(IMG_MASKED, MODEL);
 
%     figure(22)
%     subplot(121)
%     imshow(IMG_MASKED)
%     subplot(122)
%     imagesc(CLASSMAP)
%     axis equal off;
%     title("Segmented image");
%     % disp(IMG_CLASSMAP);
    
    %% 5. filters/enhances the result based on majority voting
    %  6. returns a segmented image showing the clustered region map
    
    CLASSMAP = majority_vote(CLASSMAP, 100);
    IMG_SEGMENTED = classmap2img(CLASSMAP, colors);
    
    
    figure(3)
    subplot(121)
    imshow(IMG_MASKED)
    subplot(122)
    % imagesc(IMG_CLASSMAP)
    imshow(IMG_SEGMENTED);
    axis equal off;
    title("Segmented image");
   
    
    %% areas in pxls
    areas_in_pxls = count_areas_of_classes(CLASSMAP, 4);
end
