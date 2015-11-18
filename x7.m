function [ val ] = x7( t )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
t2 = zeros(1,size(t,2));
for i=1:size(t,2)
   t2(1,i) = t(1,i)*t(1,i);
end
val = exp(-pi*t2);

end

