clc
clear
format short
atX = [3 1 0 2];
[m,n]=size(atX);
atY =[8 2 1 4];
diffTable=zeros(n-1,n-1);

x=input("Enter point to be interpolated : ");

for i=1:n-1
    diffTable(i,1)=(atY(i+1)-atY(i))/(atX(i+1)-atX(i));
end

for i=2:n-1
    for j=1:(n-i)
        diffTable(j,i)=(diffTable(j+1,i-1)-diffTable(j,i-1))/(atX(j+i)-atX(j));
    end
    
end
disp("The difference table generated is : ")
disp(diffTable)

sum=atY(1);
for i=1:n-1
    prod=1;
    for j=1:i
        prod=prod*(x-atX(j));
    end
    sum=sum+(prod*(diffTable(1,i)));
end
disp(sum)

