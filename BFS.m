clc
clear all
A=[1 1 -1 3;5 1 4 15];
C=[1 2 -1 1];
b=[15;12];
bs=[];
X=[];

[m,n] =size(A);
if(n<m)
    disp('No solution')
end

combinations=nchoosek(1:n,m);
length=size(combinations);
length=length(1);


disp('Basic Solutions are')
for i=1:length
    B=[A(:,combinations(i,1)),A(:,combinations(i,2))];
    if(det(B)~=0)
        bs=[bs B];
    end
end

disp(bs)

length=size(bs);
length=length(2);

for i=1:2:length
    B = [bs(:,i) bs(:,i+1)];
    X=[X B\b];    
end

if (all(X>0))
    disp('Non degenerate BFS')
    disp(B)
else
    if (any(X(:)==0))
        disp('Degenerate BFS')
    end
    if (any(X(:)<0))
        disp("Not a BFS")
    end
end


