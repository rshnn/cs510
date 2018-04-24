function dominant = power_method(A,E)
    n = length(A);
    y = []; x= []; 
    %initial vector 
    for i = 1:n 
        x(i) = A(i,1);
    end
    
    dominant = 0;
    e = E;

    while e>=E
          for i = 1:n
              y(i) = 0;
              for j = 1:n
                  y(i) = y(i) + A(i,j)*x(j);
              end
          end
          e = dominant;
          dominant = 0;  
          m = 0;
          for i = 1:n
              dominant = dominant + x(i)*y(i);
              m = m + x(i)*x(i);
          end
          %eigenvalue 
          dominant = dominant/m;    
          % compute error 
          e = abs(dominant - e); 
          x = y;
    end

end