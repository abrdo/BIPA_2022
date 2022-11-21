imi = imread("gt.png");
imi = mat2gray(rgb2gray(imi));


im = imread("sample_00.jpg");
im = rgb2gray(im);

k1 = [0, -1, 0;
     -1, 4, -1;
     0, -1, 0
    ];

k = zeros(149);

k(75,75) = 1;




% im1 = conv2(im, k);
% im2 = conv2(im, k);
im3 = conv2_via_fft(im, k1, 'same');


figure(1)
subplot(121)
imshow(im)
subplot(122)
imshow(im3)

a= 1;
