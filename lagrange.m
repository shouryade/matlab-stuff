clear
clc
format long
atX = [0 0.25 0.5 0.75];
[m,n]=size(atX);
atY =[1 1.64872 2.71828 4.48169];
x=input("Enter x for the value to be interpolated at : ");
sum=0;
for i=1:n
    l=1;
    for j=1:n
        if j~=i
            l=((x-atX(j))/(atX(i)-atX(j)))*l;
        end
    end
    sum=sum+(l*atY(i));

end
disp(sum)