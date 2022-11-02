clc
clear all
f=@(x)((cos(x))^2);

a=input("Enter value of a :");
b=input("Enter value of b :");
n=input("Enter number of subintervals :");
h=(b-a)/n;
sum=f(a)+f(b);
for i=1:n-1
    x=(a + (h*i));
    sum=sum+(2*f(x));
end
c=sum*(h/2);
disp(c)
