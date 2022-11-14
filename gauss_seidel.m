clc
clear
format long

A=[4.63 -1.21 3.22; -3.07 5.48 2.11; 1.26 3.11 4.57];

[m,n]=size(A);
B=[2.22;-3.17;5.11];
x0=zeros(n,1);
x=zeros(n,1);

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
        x0(i)=(B(i)-sum)./A(i,i);
    end
    if norm((x-x0),'inf')<tol
            disp(x0)
            break
    end        
end
disp(k)
disp("The answer is : ");
disp(x0)

