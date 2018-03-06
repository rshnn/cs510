z=input('z=');
a=input('a=');
for n=1:10
    [ result ,error] = taylor( z,a,n );
    v(n)=result;e(n)=error;
end
x=1:n;

% PRINT OUTPUT 
disp( ' n n(1) error')
disp([x' v' e'])
fid=fopen('expsin.txt','w');
fprintf(fid,'%s\n',' n Pn(1) error');
fprintf(fid,'%2u %14.10f %14.10f\n',[x;v;e]);
fclose(fid);



%%

z=input('z=');
a=input('a=');
m=input('m=');
for n=1:m
    [ result ,error] = taylor( z,a,n );
    v(n)=result;e(n)=error;
end
for i=1:m-1
    e1(i)=abs(v(i+1)-v(i));
end
e1(m)=e1(m-1);
x=1:n;
disp( ' n n(1) error error1')
disp([x' v' e' e1'])
fid=fopen('expsin_tay_1.txt','w');
fprintf(fid,'%s\n',' n Pn(1) error v(n+1)-v(n)');
fprintf(fid,'%2u %14.10f %14.10f\n %14.10f\n',[x;v;e;e1]);
fclose(fid);
%[x' ,single(v'),single(e')]


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