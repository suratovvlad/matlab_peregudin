function [ y ] = myfunction2( t, x )

y(1) = x(1) + x(2)^2;
y(2) = (x(1) - x(2))^2;
y=y';
end