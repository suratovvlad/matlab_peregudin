clear all;
a = 0;
b = 2;
c_1 = 0.7;
c_2 = -0.5;
c = 0;
d_1 = 0.53;
d_2 = 0.19;
d = -0.4;

N = 50;

% calculate step
h = (b - a)/N;

%create arrays
u       = zeros(N+1, 1);
v       = zeros(N+1, 1);
alpha	= zeros(N+1, 1);
beta	= zeros(N+1, 1);
gamma	= zeros(N+1, 1);
phi     = zeros(N+1, 1);
x       = zeros(N+1, 1);
y       = zeros(N+1, 1);

%initialize
alpha(1)	= 0;
beta(1)     = c_1 * h - c_2;
gamma(1)	= c_2;
phi(1)      = h * c;
x(1)        = a;

alpha(N+1)	= - d_2;
beta(N+1)	= h * d_1 + d_2;
gamma(N+1)	= 0;
phi(N+1)	= h * d;
x(N+1)      = b;

u(1)        = phi(1) / beta (1);
v(1)        = - gamma(1) / beta(1);


%direct

for i = 2 : N 
    x(i)        = x(i - 1) + h;    
    alpha(i)    = 1 - 0.5 * p_function( x(i) ) * h;
    beta(i)     = q_function( x(i) ) * h^2 - 2;
    gamma(i)	= 1 + 0.5 * p_function( x(i) ) * h;
    phi(i)      = f_function( x(i) ) * h^2;
    
    v(i)        = - gamma(i)                        / ( beta(i) - alpha(i) * v(i-1) );
    u(i)        = ( phi(i) - alpha(i) * u(i-1) )	/ ( beta(i) + alpha(i) * v(i) );
    
end

v(N+1)        = - gamma(N+1)                        / ( beta(N+1) - alpha(N+1) * v(N) );
u(N+1)        = ( phi(N+1) - alpha(N+1) * u(N) )	/ ( beta(N+1) + alpha(N+1) * v(N+1) );

%reverse

y(N+1) = u(N+1);

for i = N:-1:1
    y(i) = u(i) + v(i) * y(i+1);
end


plot(x, y, 'b');
hold on;
plot(x, y, 'bo');



