% ATTENTION!!! - change root path to ksn_classify
%%
% sample - rgb image without alpha channel
% alpha - opacity. It's need for set empty spaces by value -1,
%         for calculating mean and stddev.
%%
[sample,map,alpha] = imread('./samples/summer/forest.png');

graySample = rgb2gray(sample);
graySample = im2double(graySample);

figure(1);
imshow(graySample);

%% processing mean and stddev.

[sw,sh,ch] = size(graySample);
blockSize = [8,8];
blockCount = [sw/blockSize(1),sh/blockSize(2)];

for i=1:1:blockCount(1)
   for j=1:1:blockCount(2)
       
   end
end
