function [ z ] = parzenVisualisation( X,w,fig )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

MIN_x1x2=min(X,[],1);
MAX_x1x2=max(X,[],1);

x1_min = MIN_x1x2(1);
x1_max = MAX_x1x2(1);
x2_min = MIN_x1x2(2);
x2_max = MAX_x1x2(2);

[gX,gY] = meshgrid(x1_min:w:x1_max,x2_min:w:x2_max);
z = parzen_pdf(gX,gY);
figure(fig), box on, grid on;
surf(gX,gY,z);
xlabel('Feature-1');
ylabel('Feature-2');
zlabel('p(x)');
title('Parzen Density Estimate');

    function [pdf] = parzen_pdf(x,y)
    [Nm l] = size(X);
    [xl yl] = size(x);
    pdf = zeros(xl,yl);
    
    for k=1:yl
        for j=1:xl
            d = [x(j,k) y(j,k)];
            
            for i=1:Nm
                xi = X(i,:);
                pdf(j,k) = pdf(j,k) + exp(-((d'-xi')'*(d'-xi'))/(w^l));
            end
            
            pdf(j,k) = pdf(j,k)*((1/Nm)*(1/((2*pi)^(l/2)*(w^l))));
        end
    end
    end
end
end

