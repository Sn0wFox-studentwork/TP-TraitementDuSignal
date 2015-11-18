function [ val] = Rect( t, fe )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
val = zeros(1,size(t,2));
for i=1:size(t,2)
    if (t(1,i) < -fe) || (t(1,i) > fe)
        val(1,i) = 0;
    else
        val(1,i) = 1;
    end
end

end

