
%%
% sample - rgb image without alpha channel
% alpha - opacity. It's need for set empty spaces by value -1,
%         for calculating mean and stddev.
%%

[pathstr,name,ext] = fileparts(strcat(mfilename('fullpath'),'.m'));
addpath(strcat(pathstr,'/./../parzen/'));

blockSize = [8,8];

path = strcat(pathstr,'/./../../samples/winter/forest.png')
[sample,map,alpha] = imread(path);

classes = cell(3);

summerForestSample = im2double(rgb2gray(sample));
classes{1} = calcParams(summerForestSample,alpha,blockSize);

path = strcat(pathstr,'/./../../samples/winter/road.png')
[sample,map,alpha] = imread(path);

summerRoadSample = im2double(rgb2gray(sample));
classes{2} = calcParams(summerRoadSample,alpha,blockSize);

path = strcat(pathstr,'/./../../samples/winter/field.png')
[sample,map,alpha] = imread(path);

summerFieldSample = im2double(rgb2gray(sample));
classes{3} = calcParams(summerFieldSample,alpha,blockSize);

figure(1);
x = classes{1};
plot(x(:,1),x(:,2),'rs');
hold on;
x = classes{2};
plot(x(:,1),x(:,2),'gs');
hold on;
x = classes{3};
plot(x(:,1),x(:,2),'bs');
hold off;

width = parzenWindowWidth(0.1,1,0.1,classes)
i = parzenClassify([2,2],0.1,classes)

pd = parzenDensity([0,0.05,1,0,0.05,1],width,classes);

figure(2);
colormap('Autumn')
surf(pd(:,:,1));
hold on;

mesh(pd(:,:,2));
hold on;

mesh(pd(:,:,3));
hold off;