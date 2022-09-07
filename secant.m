clear
clc
syms x
f=@(x) ((1500/x)*(((1+x)^240)-1)-750000);

x0=input("Enter initial guess x0 : ");
x1=input("Enter initial guess x1 : ");
e=input("Enter Tolerance : ");
%fx=diff(f,x);
%f1=inline(fx);

x2=x1-(((x1-x0)*f(x1))/(f(x1)-f(x0)));
N=100;
i=1;

while(i<=N)
    if(abs(x2-x1)<e)
        disp(x2)
        break;
        
    else
        x0=x1;
        x1=x2;
        x2=x1-((x1-x0)*f(x1)/(f(x1)-f(x0)));
        i=i+1;
    end
end
disp(x2)
