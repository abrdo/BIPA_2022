clc; close all; clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% I = imread('input/train.png');
% I = mat2gray(rgb2gray(I));
% 
% T1 = I(  1:100,   1:100);
% T2 = I(  1:100, 101:200);
% T3 = I(101:200,   1:100);
% T4 = I(101:200, 101:200);
% 
% T_cell = {T1, T2, T3, T4};
% 
% R = imread('input/test.png');
% R = mat2gray(rgb2gray(R));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% T1 = imread('11.JPG');
% T2 = imread('22.JPG');
% T3 = imread('33.JPG');
% T4 = imread('44.JPG');
% T5 = imread('5.jpg');
% T6 = imread('6.jpg');

T1 = imread('1.JPG');
T2 = imread('2.jpg');
T3 = imread('3.jpg');
T4 = imread('4.jpg');
T5 = imread('5.jpg');
T6 = imread('6.jpg');



% T1 = rgb2gray(T1);
% T2 = rgb2gray(T2);
% T3 = rgb2gray(T3);
% T4 = rgb2gray(T4);
% T5 = rgb2gray(T5);
% T6 = rgb2gray(T6);

T_cell = {T1, T2, T3, T4};

R = imread('recovered_cropped_03.jpg');
% R = rgb2gray(R);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






% MODEL = training_phase(T_cell);
MODEL = train(T_cell);

% GUESS = recognition_phase(R, MODEL);
GUESS = segment(R, MODEL);
disp("recognition done.")
VOTED = majority_vote(GUESS, 6);
disp("major voting done.")



[samples, colors] = def_train_samples();
guess_img = classmap2img(GUESS, colors);

%%% SHOW %%%
figure(1);
subplot(2,2,1); imshow(R); title('Original input');
subplot(2,2,3); imshow(guess_img); axis equal off; title({'Raw output'});
subplot(2,2,4); imagesc(VOTED); axis equal off; title({'Output + majority voting'});



