function [ c ] = classify( targetParams,width,classes )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

i = parzenClassify(targetParams,width,classes);

if i == 1
    c = 'forest';
elseif i == 2
    c = 'road';
elseif i == 3
    c = 'field';
end

end

