clc
clear

B = [255,255,0];


A = [255, 0, 0;
     0, 255, 0;
     0, 0, 255;
     255, 255, 255;
     0, 0, 0;
     100, 100, 100];
 
Pa = [1/6,1/6,1/6,1/6,1/6,1/6];
 
for i = 1:6
    Pb_a(i, :) = distrRGB( B, A(i,:) );
end;

for i = 1:6
    Pb_aj(i) = sum(Pb_a(i, :))/3;
end;

sum_group = sum(Pa .* Pb_aj);
for i = 1:6
    Pa_b(i) = Pa(i) * Pb_aj(i) / sum_group;  
end;

lamda = ones(6,6);
for i = 1:6
    lamda(i,i) = 0;
end;

for i = 1:6
    R(i) = sum(lamda(i,:) .* Pa_b);
end;

plot([1:1:6],R,'or');

[m n] = min(R)

 