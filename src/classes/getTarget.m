function [ c, target, sample ] = getTarget( path, block )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[sample,map,alpha] = imread(path);

target = imcrop(sample,block);
gsample = im2double(rgb2gray(target));
alpha = ones(block(3:4));

c = calcParams(gsample,alpha,block(3:4));

end

