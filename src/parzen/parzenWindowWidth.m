function [ width ] = parzenWindowWidth( wmin, wmax, wstep, classes )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[n nn]= size(classes);

wrongsmin = 9999999;
width = 0;

for w = wmin:wstep:wmax
    wrongs = 0;
    
    for i = 1:n
        x = classes{i};
        [N d] = size(x(:,:));
        
        for j = 1:N
            cl = cell(n);
            cl = classes;
            cl{i,j} = [];
            itest = parzenClassify(x(j,:),w,cl);
            
            if(itest ~= i)
                wrongs = wrongs + 1;
            end
        end
    end
    
    if(wrongs < wrongsmin)
        wrongsmin = wrongs;
        width = w;
    end
end

end

