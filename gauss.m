clear
clc
format short
A = [10 8 -3 1 16;2 10 1 -4 9; 3 -4 10 1 10; 2 2 -3 10 11];
X=zeros(4,1);
for i=1:3
    for j=(i+1):4
        mul=(A(j,i)/A(i,i));
        for k=i:5
            A(j,k)=A(j,k)-mul*A(i,k);
        end
    end
end
disp(A)

for i=4:-1:1
    sum=0;
    j=1;
    while(j<5)
        sum=sum+(A(i,j).*X(j));
        j=j+1;
    end
    X(i)=(A(i,5)-sum)./A(i,i);
end
disp(X)


