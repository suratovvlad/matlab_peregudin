clear all
a = 1;
b = 3;
n = 30;
y_1 = 0.5;
y_2 = -0.5;
h = (b-a) / n;
x = a;
array_y_1 = [];
array_y_2 = [];
array_x = [];
while x <= b + h
    
    myfunc = myfunction(x, [y_1, y_2]);
    
    y_1_1 = y_1 + h * myfunc(1);
    y_2_1 = y_2 + h * myfunc(2);
    
    y_1 = y_1_1;
    y_2 = y_2_1;
    
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
ode45(@myfunction, [1:0.1:3], [0.5 -0.5]);


