clc
clear all
syms x
f=@(x)(0.5*sqrt(10-x^3));

x0=input("Enter value of initial guess :");
e=input("Enter tolerance :");
%x=linspace(x0,b);    
%y=cos(x)-sin(x)-0.5;

% plot(x,y,'linewidth',1,'color','r')
%ax = gca;
%ax.XAxisLocation = 'origin';
%ax.YAxisLocation = 'origin';

count=0;
x1=f(x0);
g1=inline(diff(f,x));

while abs(x0-x1)>e
    if abs(g1(x0))>1
        disp("Method does not converge")
        break
    else
        x0=x1;
        x1=f(x0);
        count=count+1;
        disp(x1)
    end
end
%disp(x1)
disp(count)