function [ maxisum ] = parzenClassify( point,h,classes )
%parzenClassify Summary of this function goes here
%% Arguments
% 1 - point: d-dimension array
% 2 - kernel width
% 3 - ... - classes: matrix of N:d - dimensinons

isum = 1;
sum = [];
maxsum = 0;
maxisum = 0;

[n nn]= size(classes);

for i = 1:n
    x = classes{i};
    [N d] = size(x(:,:));
    sum(isum) = 0;
    
    for j = 1:1:N
        r = 0;
        for k = 1:1:d
           r = r + (point(k) - x(j,k))*(point(k) - x(j,k)); 
        end
        
        sum(isum) = sum(isum) + exp(-0.5*r/(h*h));
    end
    
    sum(isum) = sum(isum)/((2*pi)^(d/2));
    
    if(sum(isum) > maxsum)
       maxsum = sum(isum); 
       maxisum = isum;
    end
    
    isum = isum + 1;
end

end

