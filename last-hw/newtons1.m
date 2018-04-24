function [z0] =newtons1(n, x0, y0)
    enable_print = 1;
    eps = 0.000001;
    
    syms x y
    
    f(x,y)=x^2+y^2-4;
    g(x,y)=x^2-y^2-1;

    z0=[x0;y0];
    fx(x,y)=diff(f,x);fy(x,y)= diff(f,y);gx(x,y)=diff(g,x);
    gy(x,y)=diff(g,y);
    A=double([fx(x0,y0) fy(x0,y0);gx(x0,y0) gy(x0,y0)]);

    for i=1:n  
        delta=double(-inv(A)*[f(x0,y0);g(x0,y0)]);
        z1=z0+delta;
        
        if norm(z1-z0, 2)<eps
            if enable_print 
                disp('exit condition met.')
            end 
            break;
        else
            if enable_print 
                disp('exit condition not met..continue')
            end
        end 
        
        z0=z1;
        x0=z0(1);y0=z0(2);
        A=double([fx(x0,y0) fy(x0,y0);gx(x0,y0) gy(x0,y0)]);       
    end
end
