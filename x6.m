function [ val ] = x6( t, tau )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
val = zeros(1,size(t,2));
for i=1:size(t,2)
    if (t(1,i) < -tau) || (t(1,i) > tau)
        val(1,i) = 0;
    else
        val(1,i) = 1;
    end
end

end

