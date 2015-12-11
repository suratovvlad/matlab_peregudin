clear all;

a = -1;
b = 1;
n = 20;
y_1 = 0;
y_2 = 1;

y = [y_1; y_2];

h = (b-a) / n;
x = a;

array_y_1 = [];
array_y_2 = [];
array_x = [];

while x <= b - 3*h
    
%     k_1 = h * myfunction2(0, [y_1, y_2]);
%     k_2 = h * myfunction2(0, [ [y_1 + 0.5 * h; y_1 + 0.5 * h], y_2 + 0.5 * h * k_1]);
%     k_3 = h * myfunction2(0, [ [y_1 + 0.5 * h; y_1 + 0.5 * h], y_2 + 0.5 * h * k_2]);
%     k_4 = h * myfunction2(0, [ [y_1 + h; y_1 + h], y_2 + h * k_3]);
    k_1 = h * myfunction2(0, y);
    k_2 = h * myfunction2(0, y + 0.5 * h * k_1); %[ y + 0.5 * h,
    k_3 = h * myfunction2(0, y + 0.5 * h * k_2); %[ y + 0.5 * h, 
    k_4 = h * myfunction2(0, y + h * k_3); %[ y + 0.5 * h, 
    
    y_new = y + 1/6 * (k_1 + 2 * k_2 + 2 * k_3 + k_4);
    y_1 = y_new(1);
    y_2 = y_new(2);
    
    y = [y_1; y_2];
    
    array_y_1 = [array_y_1, y_1];
    array_y_2 = [array_y_2, y_2];
    array_x = [array_x, x];
    
    x = x + h;
    
end

plot(array_x, array_y_1, 'r');
hold on;
plot(array_x, array_y_1, 'ro');
hold on;
plot(array_x, array_y_2, 'm');
hold on;
plot(array_x, array_y_2, 'mo');
hold on;
ode45(@myfunction2, [-1:0.1:1], [0 1]);

