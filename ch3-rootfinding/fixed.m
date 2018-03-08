function sol=fixed(myfun,x,tol,N)
    i=1;
    y=feval(myfun,x);
    if y==x
        fprintf('The fixed point is %f',y)
    end

    fprintf('iter, \t x_0, \t f(x)/y \n');
    fprintf('%1f,\t%e,\t%e \n', i, x, y)

    while abs(x-y)>tol && i+1<=N
        i = i+1;
        x = y;
        y = feval(myfun,x);

        fprintf('%1f,\t%e,\t%e \n',i, x, y)

    end
end



