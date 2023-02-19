clc
clear all
% A=[1 1 -1 3;5 1 4 15];
% C=[1 2 -1 1];
% b=[15;12];

A=[-1 1 1 0;1 1 0 1];
b=[1;2];
C=[1 2 0 0];

bfs=[];

[m,n] =size(A);
if(n<m)
    disp('No solution')
end

combinations=nchoosek(1:n,m);
length=size(combinations);
length=length(1);

disp('Basic Feasible Solutions are')
for i=1:length
    sol=zeros(n,1);
    B=[A(:,combinations(i,1)),A(:,combinations(i,2))];
    x = B\b;
    sol(combinations(i,:))=x;
    if all(x>0 & x~=inf & x~=-inf)
        disp('Non degenerate BFS')        
        disp(sol)
        bfs= [bfs sol];
    else 
        if (any(x(:)==0))
            disp('Degenerate BFS')
            disp(sol)
        end
        if (any(x(:)<0))
            disp("Not a BFS")
            disp(sol)
        end
    end
end

disp(bfs)

for i=1:size(bfs)
    obj(i,:)=sum(bfs(:,i)'.*C);    
end

[val,i]=max(obj);
fprintf('the optimal value is %f\n',val);
disp('the optimal solution is')

disp(bfs(:,i))