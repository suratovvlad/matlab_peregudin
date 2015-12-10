function [ y ] = myfunction( t, x )

y(1) = sin(x(2));
y(2) = cos(x(1));
y=y';
end

