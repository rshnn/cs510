z=input('z=');
a=input('a=');
for n=1:10
    [ result ,error] = taylor( z,a,n );
    v(n)=result;e(n)=error;
end
x=1:n;
disp( ' n n(1) error')
disp([x' v' e'])
fid=fopen('expsin.txt','w');
fprintf(fid,'%s\n',' n Pn(1) error');
fprintf(fid,'%2u %14.10f %14.10f\n',[x;v;e]);
fclose(fid);

function [ result ,error] = taylor( z,a,n )
    syms x real;
    f=exp(x)*sin(x);
    sum=subs(f,'x',a);
    prod=1;
    
    for j=1:n
        prod=prod*(z-a)/j;
        sum=sum+prod*subs(diff(f,x,j),'x',a);
    end
    
    format long
    result=double(sum);
    error=double(abs(result-subs(f,'x',z)));
end