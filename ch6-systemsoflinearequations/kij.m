function [L U a] = kij( a )
    m=size(a);
    n=m(1);
    for k=1:n
        for i=k+1:n
            a(i,k)=a(i,k)/a(k,k);
            for j=k+1:n
                a(i,j)=a(i,j)-a(i,k)*a(k,j);
            end
        end
    end
    L = tril(a,-1);
    U=a-L;
    L=L+eye(n);
end