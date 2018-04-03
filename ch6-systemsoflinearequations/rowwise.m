function rowWise(n)

% n=input('n=')
    a=ones(n,n)+n*eye(n,n);
    A=a;
    b=sum(a,2);
    l=eye(n);
    tic
    for k=1:n-1
        for i=k+1:n
            l(i,k)=a(i,k)/a(k,k);
            for j=k:n
                a(i,j)=a(i,j)-l(i,k)*a(k,j);
            end
        end
    end
    
    toc
    U=a; 
    L=l;
end 

