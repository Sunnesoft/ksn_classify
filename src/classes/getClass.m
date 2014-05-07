function [ c ] = getClass( sample, map, alpha, blockSize )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

sample = im2double(rgb2gray(sample));
c = calcParams(sample,alpha,blockSize);

end

