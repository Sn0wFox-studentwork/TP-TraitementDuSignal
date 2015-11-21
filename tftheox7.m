function [ val ] = tftheox7( w )
w2 = zeros(1,size(w,2));
for i=1:size(w,2)
   w2(1,i) = w(1,i)*w(1,i);
end
val = exp(-(w2/(4*pi)))

end