
%%
% sample - rgb image without alpha channel
% alpha - opacity. It's need for set empty spaces by value -1,
%         for calculating mean and stddev.
%%

[pathstr,name,ext] = fileparts(strcat(mfilename('fullpath'),'.m'));
addpath(strcat(pathstr,'/./../parzen/'));

blockSize = [8,8];
classes = cell(3);

pathstr = strcat(pathstr,'/./../../samples/summer/');

[forest,mapForest,alphaForest] = imread(strcat(pathstr,'forest.png'));
[road,mapRoad,alphaRoad] = imread(strcat(pathstr,'road2.png'));
[field,mapField,alphaField] = imread(strcat(pathstr,'field.png'));

classes{1} = getClass(forest,mapForest,alphaForest,blockSize);
classes{2} = getClass(road,mapRoad,alphaRoad,blockSize);
classes{3} = getClass(field,mapField,alphaField,blockSize);

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
pd = parzenDensity([-1,0.05,1,-1,0.05,1],width,classes);

figure(2);
colormap('Autumn')
surf(pd(:,:,1));
hold on;

mesh(pd(:,:,2));
hold on;

mesh(pd(:,:,3));
hold off;

% figure(3);

[sample,map,alpha] = imread(strcat(pathstr,'view.png'));

blockSize = [8,8];
p = checkClass(forest,mapForest,alphaForest,size(sample),blockSize,width,classes,'forest')
p = checkClass(road,mapRoad,alphaRoad,size(sample),blockSize,width,classes,'road')
p = checkClass(field,mapField,alphaField,size(sample),blockSize,width,classes,'field')

'finish'

% subplot(3,2,1);
% imshow(sample);
% subplot(3,2,2);
% imshow(target);
% 
% [targetParams,target,sample] = getTarget(strcat(pathstr,'view.png'),[160,80,16,16]);
% i = classify(targetParams,width,classes)
% 
% subplot(3,2,3);
% imshow(sample);
% subplot(3,2,4);
% imshow(target);
% 
% [targetParams,target,sample] = getTarget(strcat(pathstr,'view.png'),[80,80,16,16]);
% i = classify(targetParams,width,classes)
% 
% subplot(3,2,5);
% imshow(sample);
% subplot(3,2,6);
% imshow(target);

