function [ c, target ] = getTarget( sample, map, alpha, block )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

target = imcrop(sample,block);
targetAlpha = imcrop(alpha,block);

if(size(targetAlpha) == [0,0])
    c = 0;
    target = 0;
    return   
end

for i = 1:1:block(3)
    for j = 1:1:block(4)
        if(targetAlpha(i,j) == 0)
            c = 0;
            target = 0;
            return
        end
    end
end

gsample = im2double(rgb2gray(target));
alpha = ones(block(3:4));

c = calcParams(gsample,alpha,block(3:4));

end

