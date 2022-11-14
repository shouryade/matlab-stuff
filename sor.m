clc
clear
format long

A=[4 1 -1 1; 1 4 -1 -1; -1 -1 5 1;1 -1 1 3];
[m,n]=size(A);
w=1.2;
B=[-2;-1;0;0];
x0=[0;0;0;0];
x=[0;0;0;0];

tol=input("Enter tolerance : ");
N=input("Enter max num of iterations : ");
for k=1:N
    for i=1:n
        sum=0;
        for j=1:n
            if(j~=i)
              sum=sum+x0(j).*A(i,j);  
            end
        end
        x=x0;
        x0(i)=((1-w)*x0(i)+(w/A(i,i))*(B(i)-sum));
    end
    if norm((x-x0),'inf')<tol
            disp(x0)
            break
    end        
end
disp(k)
disp("The answer is : ");
%round(x0)
