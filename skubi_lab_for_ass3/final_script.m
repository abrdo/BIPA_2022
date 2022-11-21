clc; close all; clear;


% I = imread('input/train.png');
% I = mat2gray(rgb2gray(I));
% 
% T1 = I(  1:100,   1:100);
% T2 = I(  1:100, 101:200);
% T3 = I(101:200,   1:100);
% T4 = I(101:200, 101:200);
% 
% 
% 
% R = imread('input/test.png');
% R = mat2gray(rgb2gray(R));
% 
% G = imread('input/gt.png');
% G = mat2gray(rgb2gray(G))*3 + 1;
% 
% 
% GUESS = recognition_phase(R, MODEL);
% VOTED = majority_voting(GUESS, 6);
% 
% CORRECT1 = sum(sum(GUESS == G)) / numel(G) * 100;
% CORRECT2 = sum(sum(VOTED == G)) / numel(G) * 100;
% 
% 
% figure(1);
% subplot(2,2,1); imshow(R); title('Original input');
% subplot(2,2,2); imagesc(G); axis equal off; title('Ground truth');
% subplot(2,2,3); imagesc(GUESS); axis equal off; title({'Raw output', [num2str(CORRECT1), '% accurate']});
% subplot(2,2,4); imagesc(VOTED); axis equal off; title({'Output + majority voting',[num2str(CORRECT2), '% accurate']});



T1 = imread('11.JPG');
T2 = imread('22.JPG');
T3 = imread('33.JPG');
T4 = imread('44.JPG');
T5 = imread('5.jpg');
T6 = imread('6.jpg');

T1 = rgb2gray(T1);
T2 = rgb2gray(T2);
T3 = rgb2gray(T3);
T4 = rgb2gray(T4);
T5 = rgb2gray(T5);
T6 = rgb2gray(T6);


T_cell = {T1, T2, T3, T4};
MODEL = training_phase(T_cell);

R = imread('recovered_cropped_07.jpg');
R = rgb2gray(R);

GUESS = recognition_phase(R, MODEL);
disp("recognition done.")
VOTED = majority_voting(GUESS, 6);



G = imread('input/gt.png');
G = mat2gray(rgb2gray(G))*3 + 1;
CORRECT1 = 1; %sum(sum(GUESS == G)) / numel(G) * 100;
CORRECT2 = 1; %sum(sum(VOTED == G)) / numel(G) * 100;


figure(1);
subplot(2,2,1); imshow(R); title('Original input');
subplot(2,2,2); imagesc(G); axis equal off; title('Ground truth');
subplot(2,2,3); imagesc(GUESS); axis equal off; title({'Raw output', [num2str(CORRECT1), '% accurate']});
subplot(2,2,4); imagesc(VOTED); axis equal off; title({'Output + majority voting',[num2str(CORRECT2), '% accurate']});

a = 1;
