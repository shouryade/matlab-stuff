clear
clc
format short
U = [1 2 4 ; 3 8 14 ; 2 6 13];
L=zeros(3,3);
B=[3;13;4];
X=zeros(3,1);
for i=1:3
    L(i,i)=1;
    for j=(i+1):3
        mul=(U(j,i)/U(i,i));
        L(j,i)=mul;
        for k=i:3
            U(j,k)=U(j,k)-mul*U(i,k);
        end
    end
end
disp(U)
disp(L)

Y=zeros(3,1);

n=3;

for i=1:3
    sum=0;
    j=1;
    while(j<i)
        sum=sum+L(i,j).*Y(j);
        j=j+1;
    end

    Y(i)=B(i)-sum;

end
disp(Y)
disp(U)

for i=3:-1:1
    sum=0;
    j=1;
    while(j<4)
        sum=sum+(U(i,j).*X(j));
        j=j+1;
    end
    disp(sum)
    X(i)=(Y(i)-sum)./U(i,i);
end
disp(X)