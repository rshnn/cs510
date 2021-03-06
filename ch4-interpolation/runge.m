
function runge(n,a, b, f_index)
    %Function that shows the Runge phenomena
    close all
    x=a:0.02:b; % mesh points on [a b] used for plotting

    switch f_index
        case 2
            y = 1./(1+10*x.^2);
            fname = "1/(1+10*x^2)";
        case 1 
            y = cos(x);
            fname = "cos(x)";
    end
    
    % just plot to see the function.  
    figure;
    subplot(2, 2, 1);     grid on; 
    plot(x,y, 'm', 'LineWidth', 1.25); % a plot of f
    subplot(2, 2, 3);    grid on;  
    plot(x,y, 'm', 'LineWidth', 1.25); % a plot of f

    % Get evenly spaced set of points on the function.  This builds the input dataset.     
    % Basic interpolation.  Evenly spaced points.  
    xp = linspace(a, b, n);
    % Chebyshevshev spacing
    i = 1:n;
    xch = ((b-a)/2) * cos( ((2*i+1)*pi) / (2*n+2) ) + (a+b)/2;

    
    switch f_index
        case 2
            yp = 1./(1+10*xp.^2);
            ych = 1./(1+10*xch.^2);
            
        case 1 
            yp = cos(xp);
            ych = cos(xch);
    end
        
    
    subplot(2, 2, 1); grid on; hold on;
    plot(xp,yp,'o') %plotting the data points on the graph of f
    C=polyfit(xp,yp,n-1); %computes the coefficients of P_{n-1}
    Interp=polyval(C,x); %evaluates the Interpolant P_{n-1} at the mesh points
    plot(x,Interp,'r--', 'LineWidth', 2);
    
    xlabel('x-axis');
    ylabel('y-axis');
    title(sprintf('Interp with n= %d of f(x)= %s; evenly-spaced', n, fname), 'fontsize', 14);
    legend({'f(x)','x_i even-spacing','P_{evensp}'},'fontsize',10,'Location','southwest'); 

    
    % Chebyshev plotting 
    subplot(2, 2, 3); grid on; hold on;
    plot(xch, ych, 'k^');
    Cheb=polyfit(xch, ych, n-1);
    InterCh = polyval(Cheb, x);
    plot(x, InterCh, 'k--', 'LineWidth', 2);

    xlabel('x-axis');
    ylabel('y-axis');
    title(sprintf('Interp with n= %d of f(x)= %s; Chebyshev nodes', n, fname), 'fontsize', 14);
    legend({'f(x)','x_i cheb-nodes','P_{cheb}'},'fontsize',10,'Location','southwest'); 

    
    
    % Calculating error    
    err = Interp-y;
    errch = InterCh-y;
    
    subplot(2, 2, [2,4]);
    plot(x, abs(err), 'g', 'LineWidth', 2)
    hold on;
    plot(x, abs(errch), 'c', 'LineWidth', 2);
    title('abs(Error)', 'fontsize', 14);
    legend({'evenly-spaced', 'Chebyshev Nodes'}, 'fontsize',10, 'Location', 'northwest');
    grid on;
    
    
    
end