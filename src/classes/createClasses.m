
%%
% sample - rgb image without alpha channel
% alpha - opacity. It's need for set empty spaces by value -1,
%         for calculating mean and stddev.
%%

[pathstr,name,ext] = fileparts(strcat(mfilename('fullpath'),'.m'));
addpath(strcat(pathstr,'/./../parzen/'));

blockSize = [8,8];
classes = cell(3);

pathstr = strcat(pathstr,'/./../../samples/winter/');

classes{1} = getClass(strcat(pathstr,'forest.png'),blockSize);
classes{2} = getClass(strcat(pathstr,'road.png'),blockSize);
classes{3} = getClass(strcat(pathstr,'field.png'),blockSize);

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

figure(3);

[targetParams,target,sample] = getTarget(strcat(pathstr,'view.png'),[40,80,16,16]);
i = classify(targetParams,width,classes)

subplot(3,2,1);
imshow(sample);
subplot(3,2,2);
imshow(target);

[targetParams,target,sample] = getTarget(strcat(pathstr,'view.png'),[160,80,16,16]);
i = classify(targetParams,width,classes)

subplot(3,2,3);
imshow(sample);
subplot(3,2,4);
imshow(target);

[targetParams,target,sample] = getTarget(strcat(pathstr,'view.png'),[80,80,16,16]);
i = classify(targetParams,width,classes)

subplot(3,2,5);
imshow(sample);
subplot(3,2,6);
imshow(target);

