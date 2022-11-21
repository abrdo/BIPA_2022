function [samples, colors] = def_train_samples()
    %   1: french fries
    %   2: meat
    %   3: cucumber
    %   4: rice
    %   5: plate
    %   6: mask
    
    imgs{1} = imread("recovered_01.jpg");
    imgs{7} = imread("recovered_07.jpg");
    
    samples{1} = imgs{1}(679:1087, 1551:2339, :);
    samples{2} = imgs{1}(1816:2228, 1589:2121, :);
    samples{3} = imgs{7}(733:977, 1473:2193, :);
    samples{4} = imgs{7}(1677:2021, 1445:1929, :);
    samples{5} = imgs{1}(1685:2031, 1093:1345, :);
    samples{6} = uint8(zeros(100, 100, 3));
    
    %%% SAVE %%%
%     imwrite(samples{1}, "train_samples/1.jpg");
%     imwrite(samples{2}, "train_samples/2.jpg");
%     imwrite(samples{3}, "train_samples/3.jpg");
%     imwrite(samples{4}, "train_samples/4.jpg");
%     imwrite(samples{5}, "train_samples/5.jpg");
%     imwrite(samples{6}, "train_samples/6.jpg");

    colors{1} = uint8(squeeze(mean(mean(samples{1}))));
    colors{2} = uint8(squeeze(mean(mean(samples{2}))));
    colors{3} = uint8(squeeze(mean(mean(samples{3}))));
    colors{4} = uint8(squeeze(mean(mean(samples{4}))));
    colors{5} = [255; 255; 255];  % plate
    colors{6} = [255; 255; 255];  % mask
    
    %%% SHOW %%%
%     figure(1)
%     subplot(141)
%     imshow(samples{1})
%     title('1: french fries')
%     subplot(142)
%     imshow(samples{2})
%     title('2: meat')
%     subplot(143)
%     imshow(samples{3})
%     title('3: cucumber')
%     subplot(144)
%     imshow(samples{4})
%     title('4: rice')

%     disp(colors{1});
%     disp(colors{2});
%     disp(colors{3});
%     disp(colors{4});
%     disp(colors{5});
%     disp(colors{6});
    
end