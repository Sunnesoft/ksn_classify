function [ params ] = calcParams( graySample,alpha, blockSize )
%calcParams 
% graySample - single-channel(gray) of image [double matrix]
% alpha - opacity-channel of image
% blockSize - [N,M]

%% calculate array of [mean, stddev+mean] for every block , 
%  which size is blockSize. 
%%

[sw,sh,ch] = size(graySample);
blockCount = [sw/blockSize(1),sh/blockSize(2)];

params = [;];

iterator = 1;

for i=0:1:blockCount(1)-1
   for j=0:1:blockCount(2)-1
       start = [1+i*blockSize(1), 1 + j*blockSize(2)];
       mean = 0;
       mean2 = 0;
       var = 0;
       N = 0;
       
       %% calculate mean
       for k = start(1):1:start(1)+blockSize(1)-1
           for l = start(2):1:start(2)+blockSize(2)-1
               if(alpha(k,l) == 0)
                   continue;
               end
               N = N + 1;
               mean = mean + graySample(k,l);
               mean2 = mean2 + graySample(k,l)*graySample(k,l);
           end
       end
       
       mean = mean / N;
       mean2 = mean2 / N;
       
       %% calculate var [http://ru.wikipedia.org/wiki/��������� ��������� ��������]      
       var = mean2 - mean*mean;
       
       % check if NaN
       if(var ~= var || mean ~= mean)
           continue;
       end
       
       params(iterator,1) = mean;
       params(iterator,2) = sqrt(var)+mean;
             
       iterator = iterator + 1;
   end
end

end

