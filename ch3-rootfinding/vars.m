tol=1.0E-8;
N=100;

y1  = @(x) x;
g_a = @(x) x - (x^2-3*x+2)/(2*x-3);



g_b = @(x) (x^2+2)/3;
g_c = @(x) sqrt(3*x-2);
g_d = @(x) 3-(2/x);
g_e = @(x) (x^2-2)/(2*x-3);

%% Nah i got 2/3, 3/4, 1/2, and 0 for e

syms x
yy = x;
g_bs = (x^2+2)/3;


g_cs = sqrt(3*x-2);



g_ds = 3 - 2/x;

g_es = (x^2-2)/(2*x-3);



%%

syms x;
syms a;
f(x) = x^2-a;


%%

syms x; 

h(x) = (x^3+15*x)/(3*x^2+5);