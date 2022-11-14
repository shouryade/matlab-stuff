clc
clear all
syms x
f=@(t,y)(y-t^2+1);
t0=input("Enter starting point");
y0=input("Enter Function value at t0 ");
h=input("Enter step size");
t1=input("Enter the point for which f is to be calculated ");
n=(t1-t0)/h;
for i=1:n
    y1=y0+(h*f(t0,y0));
    t0=t0+h;
    y0=y1;
end
disp(y1);