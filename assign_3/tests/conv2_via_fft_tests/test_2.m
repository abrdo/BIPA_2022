% more than 2 dimension matrxi input should throw error

k = ones(2, 3, 4);
g = ones(1,2);

cf = conv2_via_fft(k,g);
