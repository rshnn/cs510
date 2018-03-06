
function runge(n,a, b, f_index)
    %Function that shows the Runge phenomena
    %
    % The Polynomial interpolation of f(x) =1/(1 +10 * x^2)
    % on equal distributed n nodes on [-1 1]
    % causes extreme variation near the ends
    % as n increases
    %INPUT n the # of equally distributed nodes in [-1 1]
    close all


    
    x=a:0.02:b; % mesh points on [-1 1] used for plotting

    % Doing element-wise division.   
    % y=1./(1 + 10 * x.^2);

    switch f_index
        case 1
            y = 1./(1+10*x.^2);
        case 2 
            y = cos(x) ;
    end
    
    % just plot to see the function.  
    plot(x,y) % a plot of f


    % Get evenly spaced set of points on the function.  This builds the input dataset.     
    xp=linspace(a,b,n); % the interpolation nodes
    % yp=1./(1 + 10 * xp.^2); %y_i=f(x_i)

    switch f_index
    case 1
        yp = 1./(1+10*xp.^2);
    case 2 
        yp = cos(xp) ;
    end
        
    hold on
    grid on
    plot(xp,yp,'o') %plotting the data points on the graph of f



    % Chebyshev nodes

    
   
    
    
    
    
    
    C=polyfit(xp,yp,n-1); %computes the coefficients of P_{n-1}
    Interp=polyval(C,x); %evaluates the Interpolant P_{n-1} at the mesh points
    plot(x,Interp,'r')
end