function columnWise(n)

%     n=input('n=');
    a=ones(n,n)+n*eye(n,n);
%     display('A is ');
%     disp(a);
    l=eye(n);
    tic
    for k=1:n-1
        
        for i=k+1:n
            l(i,k)=a(i,k)/a(k,k);
        end

        for j=k:n
            for i=k+1:n
                a(i,j)=a(i,j)-l(i,k)*a(k,j);
            end
        end
    end

    toc
    U=a; 
    L=l;
%     disp('U is ');
%     disp(U);
%     disp('L is ');
%     disp(L)
end