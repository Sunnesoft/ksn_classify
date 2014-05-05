function [ pd ] = parzenDensity( range,h,classes )
%parzenClassify Summary of this function goes here

pd = [;;];

[n nn]= size(classes);

for i = 1:n
    X = classes{i};
    [N d] = size(X(:,:));
    
    V = 0;
    
    x = 1;   
    for l = range(1):range(2):range(3)
        y = 1;
        for m = range(4):range(5):range(6)
            
            point = [l m];

            pd(x,y,i) = 0;

            for j = 1:1:N
                r = 0;
                for k = 1:1:d
                   r = r + (point(k) - X(j,k))*(point(k) - X(j,k)); 
                end

                pd(x,y,i) = pd(x,y,i) + exp(-0.5*r/(h*h));
            end          
            pd(x,y,i) = pd(x,y,i)/((2*pi)^(d/2));  

            V = V + pd(x,y,i);
            
            y = y + 1;   
        end
        x = x + 1;
    end
    
    x = 1; 
    for l = range(1):range(2):range(3)
        y = 1;
        for m = range(4):range(5):range(6)
            pd(x,y,i) = pd(x,y,i)/V/N;            
            y = y + 1;   
        end
        x = x + 1;
    end
end

end

