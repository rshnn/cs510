
function coeff = expsin_tay(n)
   
% f(x) = exp(x) * sin(x) 

syms x
f(x) = exp(x) * sin(x);
coeff = ones(n+1, 1); 
fact = 1;

coeff(1) = subs(f,x,0);

    for i=1:n

        f = diff(f,x);
        val = subs(f,x,0);
        fact = i*fact;
        coeff(i+1)= val/fact;

    end


end
