function [ val ] = x6per( t, tau )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
val = zeros(1,size(t,2));
for i=1:size(t,2)
    if (sign(t(1,i))*mod(t(1,i),4*tau) < -2*tau) || (sign(t(1,i))*mod(t(1,i),4*tau) > 2*tau)
        val(1,i) = 0;
    else
        val(1,i) = 1;
    end
end


end

