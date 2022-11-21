clear;

k = 1;
N = 19;  
imgs = cell(N,1);

% 1.a loading
img_empty = imread("sample_00.jpg");
for i = k:N
    imgs{i} = imread("sample_" + sprintf('%02d', i) + ".jpg");
end


% 1.b deconv kernel gen
%   marker endpoints coords: (2857, 371) (2886, 366) from sample_02
len =   29.43;
theta = 9.78;
h = fspecial('motion', len, theta);

% Plate masking
r = 1058;
cx = 1550;
cy = 2123;
sx = size(img_empty, 1);
sy = size(img_empty, 2);
plate_mask = get_circle_mask(sx, sy, r, cx, cy);

crop_coords_x = [cx-r-5; cx+r+5];
crop_coords_y = [cy-r-5; cy+r+5];

% 4. identifies the regions using a texture matching algorithm (Laws filter)
[samples, colors] = def_train_samples();
MODEL = train(samples);

% 7. Calculates (based on area size) the price of the food.

% look up table
foods = ["fries    ", "schnitzel", "salad    ", "rice     "];
prices_per_100cm2 = [0.60; 2.00; 0.77; 0.55];

pxl2cm2 = 25.0 / (2*r);

areas_in_cm2 = cell(N,1);
bill = cell(N,1);

% processing
areas_in_pxls = cell(N,1);
for i = k:N
    % processing
    areas_in_pxls{i} = processor(imgs{i}, h, MODEL, colors, plate_mask, crop_coords_x, crop_coords_y, img_empty, i);
    
    % bill
    for j = k:N
        areas_in_cm2{j} = areas_in_pxls{j} * pxl2cm2;
        bill{j} = areas_in_cm2{j} .* prices_per_100cm2 / 100;
    end
    
    %%% consol display %%%
    disp("-- sample_" + sprintf('%02d', i) + " --")
    for j = 1:size(bill{i}, 1)
        disp(foods(j) + "        " + areas_in_cm2{i}(j) + "   cm2" + "        " + prices_per_100cm2(j) + "   eur/100cm2" + "        " + bill{i}(j) + "   eur")
    end
    disp("--------")
    disp("SUM:          " + sum(bill{i}) + "   eur")
    disp("==============")
end
