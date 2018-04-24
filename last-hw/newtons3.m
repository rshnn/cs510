function [z0] =newtons3(n, x0,y0, w0 )
    enable_print = 1;
    eps = 0.000001;

    syms x y w

    f(x, y, w) = x^2+y^2+w^2-16;
    g(x, y, w) = x^2+y^2-w^2-8;
    h(x, y, w) = x-y+w-2;

    z0=[x0;y0;w0];
    fx(x,y,w)=diff(f,x);
    fy(x,y,w)= diff(f,y);
    fw(x,y,w)= diff(f,w);

    gx(x,y,w)=diff(g,x);
    gy(x,y,w)=diff(g,y);
    gw(x,y,w)=diff(g,w);

    hx(x,y,w) = diff(h,x);
    hy(x,y,w) = diff(h,y);
    hw(x,y,w) = diff(h,w);


    x0=z0(1);y0=z0(2); w0=z0(3);
    A=double([fx(x0,y0, w0) fy(x0,y0, w0) fw(x0,y0, w0);
                gx(x0,y0, w0) gy(x0,y0, w0) gw(x0,y0, w0);
                hx(x0, y0, w0) hy(x0, y0, w0) hw(x0, y0, w0)
             ]);

    for i=1:n
        delta=double(-inv(A)*[f(x0,y0,w0);g(x0,y0,w0); h(x0, y0, w0)]);
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
        x0=z0(1);y0=z0(2); w0=z0(3);

        A=double([fx(x0,y0, w0) fy(x0,y0, w0) fw(x0,y0, w0);
                gx(x0,y0, w0) gy(x0,y0, w0) gw(x0,y0, w0);
                hx(x0, y0, w0) hy(x0, y0, w0) hw(x0, y0, w0)
             ]);
    end 
end