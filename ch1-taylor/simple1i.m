%% 1.i
% simple taylor 
% f(x) = exp(x) * sin(x) 


syms x
a = 0;
n = 5;
f(x) = exp(x) * sin(x); 

f2 = diff(f,x);
f3 = diff(f2, x); 
f4 = diff(f3, x); 
f5 = diff(f4, x); 
f6 = diff(f5, x); 


x = 0;

fact = factorial(0);
term_0 = subs(f)/fact

fact = factorial(1);
term_1 = subs(f2)/fact

fact = factorial(2);
term_2 = subs(f3)/fact

fact = factorial(3);
term_3 = subs(f4)/fact

fact = factorial(4);
term_4 = subs(f5)/fact

fact = factorial(5);
term_5 = subs(f6)/fact


%% 

function coeff = expsin_tay(n)
   
% f(x) = exp(x) * sin(x) 

coeff = ones(n+1, 1); 
fact = 1;

for i=1:n

    f = diff(f,x);
    val = subs(f,x,0);
    fact = i*fact;
    coeff(i+1)= val/fact;

end


end
