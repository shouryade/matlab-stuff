clc
clear
A=[4 1 0; 1 20 1; 0 1 4];
[m,n]=size(A);

% initial guess
x=[1;1;1];

for i=1:100
    y=A*x;
    n=norm(y,'inf');
    x=y/n;
    K(i)=n;
    if(i>1)
        if(abs(K(i)-K(i-1)))<0.001
            K(i)
            x
            break;
        end

    end
end
