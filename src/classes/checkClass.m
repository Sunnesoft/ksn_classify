function [ truesize ] = checkClass( sample,map,alpha, size, blockSize , kernelWidth, classes, typeName)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

blockCount = [floor(size(1)/blockSize(1)),floor(size(2)/blockSize(2))];

anssize = 0;
truesize = 0;

for i=0:1:blockCount(1)-3
   for j=0:1:blockCount(2)-3
       start = [1+i*blockSize(1), 1 + j*blockSize(2)];
       
       [targetParams,target] = getTarget(sample,map,alpha,[start(1),start(2),blockSize(1),blockSize(2)]);
       if(targetParams ~= 0)
           i = classify(targetParams,kernelWidth,classes);
           
           if(strcmp(i,typeName))
               truesize = truesize + 1;
           end
           
           anssize = anssize + 1;
       end     
   end
end

truesize = truesize / anssize;

end

