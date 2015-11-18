function [ val ] = x3( t,b,U )
% exp(-b.t).U(t)


val = exp(-b*t)*U;

end

