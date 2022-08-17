clear
clc
syms x
f=@(x) cos(x)-x*exp(x);

x0=input("Enter initial guess : ");
e=input("Enter Tolerance : ");
fx=diff(f,x);
f1=inline(fx);

x1=x0-(f(x0)/f1(x0));
N=100;
i=1;

while(i<=N)
    if(abs(x1-x0)>e)
        x0=x1;
        x1=x0-(f(x0)/f1(x0));  
        i=i+1;
    else
        disp(x1)
        break;  

    end
end
