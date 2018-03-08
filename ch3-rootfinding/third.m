function root = third(x0,error_bd,max_iterate,index_f)
%
% function newton(x0,error_bd,max_iterate,index_f)
%
% This is Newton's method for solving an equation f(x) = 0.
%
% The functions f(x) and deriv_f(x) are given below.
% The parameter error_bd is used in the error test for the 
% accuracy of each iterate.  The parameter max_iterate
% is an upper limit on the number of iterates to be 
% computed.  An initial guess x0 must also be given.
%
% For the given function f(x), an example of a calling sequence 
% might be the following:
%    root = newton(1,1.0E-12,10,1)
% The parameter index_f specifies the function to be used.
%
% The program prints the iteration values
%      iterate_number, x, f(x), deriv_f(x), error
% The value of x is the most current initial guess, called
% previous_iterate here, and it is updated with each iteration. 
% The value of error is 
%    error = newly_computed_iterate - previous_iterate
% and it is an estimated error for previous_iterate.
% Tap the carriage return to continue with the iteration. 

format short e
error = 1;
it_count = 0;
diary(['netwon-i_',datestr(now,'hh-MM-ss'),'.txt'])
fprintf('iter, \t x_0, \t f(x),\t df(x),\t error \n')

while abs(error) > error_bd & it_count <= max_iterate
    fx = f(x0,index_f);
    dfx = deriv_f(x0,index_f);
    if dfx == 0
        disp('The derivative is zero.  Stop')
        return
    end
    %x1 = x0 - fx/dfx;
    x1 = (x0^3 + 15*x0)/(3*x0^2 + 5);
    
    error = x1 - x0;
%   Internal print of newton method. Tap the carriage
%   return key to continue the computation.
    iteration = [it_count x0 fx dfx error];
        
    % Write to file 
    fprintf('%1f,\t%e,\t%e,\t%e,\t%e\n',...
        it_count, x0, fx, dfx, error)
    
    pause
    x0 = x1;
    it_count = it_count + 1;
end

diary off

if it_count > max_iterate
    disp('The number of iterates calculated exceeded') 
    disp('max_iterate.  An accurate root was not')
    disp('calculated.')
else
    format long
    root = x1
    format short e
    error
    format short
    it_count
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function value = f(x,index)

% function to define equation for rootfinding problem.

switch index
case 1        
    value = x.^6 - x - 1;
case 2
    value = x - exp(-x);

case 3
    value =x.^2 - 2;
    
case 4
    value = 1-exp(x);
case 5
    value = x.^2-sin(x)-0.5;
case 6
    value = x.^2-3*x+2;
case 7
    value=x.^2-5;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function value = deriv_f(x,index)

% Derivative of function defining equation for rootfinding 
% problem.

switch index
case 1
    value = 6*x.^5 - 1;
case 2
    value = 1 + exp(-x);
case 3
    value = 2*x;
case 4
    value = -exp(x);
case 5
    value=2*x-cos(x);
case 6
    value = 2*x - 3;
    
case 7
    value = 2*x;
    
end
