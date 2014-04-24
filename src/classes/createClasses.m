% ATTENTION!!! - change root path to ksn_classify
%%
% sample - rgb image without alpha channel
% alpha - opacity. It's need for set empty spaces by value -1,
%         for calculating mean and stddev.
%%
blockSize = [8,8];

[sample,map,alpha] = imread('./samples/summer/forest.png');

summerForestSample = im2double(rgb2gray(sample));
summerForestParams = calcParams(summerForestSample,alpha,blockSize);

[sample,map,alpha] = imread('./samples/summer/road.png');

summerRoadSample = im2double(rgb2gray(sample));
summerRoadParams = calcParams(summerRoadSample,alpha,blockSize);

[sample,map,alpha] = imread('./samples/summer/field.png');

summerFieldSample = im2double(rgb2gray(sample));
summerFieldParams = calcParams(summerFieldSample,alpha,blockSize);

plot(summerForestParams(:,1),summerForestParams(:,2),'rs',summerRoadParams(:,1),summerRoadParams(:,2),'gs',summerFieldParams(:,1),summerFieldParams(:,2),'bs');
