function x = solveFactorized()
    x = test1();
    %x = test2();
end

function x = test1()
    n = input('Enter n\n');
    a=ones(n,n)+n*eye(n,n);
    [l u p] = lu(a);
    disp('Generating input ..');
    disp('L is');
    disp(l);
    disp('U is');
    disp(u);
    
    b = sum(a, 2);
    disp('b is');
    disp(b);
    
    %Method 1
    %a = l*u;
    %x = solve(a, b);
    
    %Method 2
    disp('Z (step 1 of the output) is')
    z = forward_substitution(l, b);
    %z = solve(l, b);%step 1
    disp (z');
    x = backward_substitution(u, z);
    %x = solve(u, z');%step 2
    disp('X (step 2 of the output) is');
    disp(x);
end




function x = test2()
    l = [1, 0, 0; 0.5, 1, 0; 0, 0.5, 1];
    u = [-2, 0, 1; 0, 2, -0.5; 0, 0, -0.75];
    b = [-1; 1; 0];%Method 1
    %a = l*u;
    %x = solve(a, b);
    %Method 2
    z = solve(l, b);%step 1
    x = solve(u, z');%step 2    
end




function x = forward_substitution(l, b)
    n = length( b );
    x = zeros( n, 1 );
    for i=1:n
        x(i) = b(i);
        for j=1:(i - 1)
            x(i) = x(i) - l(i, j)*x(j);
        end
        x(i) = x(i)/l(i, i);
    end
end





function x = backward_substitution(u, b)
    a = u;
    n = size(a);
    n = n(1);
    %backward substitution
    x(n) = b(n)/a(n,n);
    for i=n-1:-1:1
        sum = b(i);
        for j=i+1:n
            sum = sum-a(i,j)*x(j);
        end
        x(i) = sum/a(i,i);
    end
end



function x = solve(a, b)
    %forward elimination
    n = size(a);
    n = n(1);
    tic
    for k=1:n-1
        for i=k+1:n
            m=a(i,k)/a(k,k);
            for j=k:n
                a(i,j)=a(i,j)-m*a(k,j);
            end
            b(i, 1) = b(i, 1) - m*b(k, 1);
        end
    end
    toc
    %backward substitution
    x(n) = b(n)/a(n,n);
    for i=n-1:-1:1
        sum = b(i);
        for j=i+1:n
            sum = sum-a(i,j)*x(j);
        end
        x(i) = sum/a(i,i);
    end
end


