clc
clear all
f=@(x)(cos(x)-sin(x)-0.5);

a=input("Enter value of a :");
b=input("Enter value of b :");
e=input("Enter tolerance :");
x=linspace(a,b);    
y=cos(x)-sin(x)-0.5;

plot(x,y,'linewidth',1,'color','r')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
no=ceil((log(b-a)-log(e))/log(2));
count=0;
while abs(b-a)>e
    c=(a+b)/2;
    if f(a)*f(c)<0
        b=c;
        count=count+1;
    else
        a=c;
        count=count+1;
    end
end
disp(c)
f(c)
if no~=inf
    disp(no)
else
    disp(count)
end