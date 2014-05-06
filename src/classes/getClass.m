function [ c ] = getClass( path, blockSize )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[sample,map,alpha] = imread(path);

sample = im2double(rgb2gray(sample));
c = calcParams(sample,alpha,blockSize);

end

