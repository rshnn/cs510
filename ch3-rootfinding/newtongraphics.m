function [root] = newtongraphics(x0,error_bd,max_iterate)
    syms x real;
    syms z real;
    %Input function
    f = x^2-2;
    %Taylor's polynomial of degree 1, Tangent line.
    p=z^2-2+2*z*(x-z);
    
    
format short e
error = 1;
it_count = 0;
iteration=[];
while abs(error) > error_bd && it_count <= max_iterate  
    grid
    ezplot(f,[0,2])
    hold on
    ezplot(subs(p,'z',x0),[0,2])
    grid
    fx =  subs(f,'x',x0);
    dfx = subs(diff(f,x,1),'x',x0);
    if dfx == 0
        disp('The derivative is zero.  Stop')
        return
    end
    x1 = x0 - fx/dfx;
    error = abs(x1 - x0);
%   Internal print of newton method. Tap the carriage
%   return key to continue the computation.
disp('it_count x0 fx dfx error')
    iteration = [iteration
        it_count x0 fx dfx error];
    disp(double(iteration))
    
    
    pause
    x0 = x1;
    it_count = it_count + 1;
end
 
if it_count > max_iterate
    disp('The number of iterates calculated exceeded') 
    disp('max_iterate.  An accurate root was not')
    disp('calculated.')
else
    root =iteration;
    
end
