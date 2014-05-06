function [ P ] = distrRGB( B, mean )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i = 1:3   
    P(i) = 1 - abs(B(i) - mean(i))/255;
end;

end

%     if B(i)<mean(i)
%         P(i) = max(0, 0 + (B(i) - (mean(i)-64))/64);
%     else
%         P(i) = max(0, 1 + -1/64*(B(i) - mean(i)));
%     end;