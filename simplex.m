clc
clear

my_mat=[-1 1;1 1];
b=[1;2];
c=[1 2];

n_vars= size(my_mat,2);
s=eye(size(my_mat,1));
A= [my_mat s b];
cost=zeros(1,size(A,2));
cost(1:n_vars)=c;

% setting initial basic variables

BV=n_vars+1:size(A,2)-1;
zrow=cost(BV)*A-cost;
zjcj=[A;zrow];

simplex_table=array2table(zjcj);
simplex_table.Properties.VariableNames(1:size(zjcj,2))={'x1','x2','s1','s2','solution'};


run = true;
disp(simplex_table)

% zc=zrow(1:end-1);
% [val,e_col]=min(zc);
% sol=A(:,end);
% col=A(:,e_col);
% if any(col<0)
%     disp('Infeasible solution');
% %     break;
% else
%     for i=1:size(col,1)
%         ratio(i)=sol(i)./col(i);
%     end
%     [val,position]=min(ratio);
%     BV(:,position)=e_col;
%     pivot=A(position,e_col);
%     A(position,:)=A(position,:)./pivot;
%     
% 
% 
%     for i=1:size(A,1)
%         if i~=position
%             m=A(i,e_col);
%             
%             A(i,:)=(A(i,:)-A(position,:)*m);
%         end
%     end
%     zrow=cost(BV)*A-cost;
%     zjcj=[A;zrow];
%     simplex_table=array2table(zjcj);
%     simplex_table.Properties.VariableNames(1:size(zjcj,2))={'x1','x2','s1','s2','solution'};
%     disp(simplex_table)    
% 
% end
% 

while(run)
    if (any(zrow<0))
        disp("BFS is not optimal, Iteration continues!")
        disp('Basic variables')
        disp(BV)
        zc=zrow(1:end-1);
        [val,e_col]=min(zc);
        sol=A(:,end);
        col=A(:,e_col);
        if all(col<0)
            disp('Infeasible solution');
            break;
        else
            for i=1:size(col,1)
                if(col(i)>=0)
                    ratio(i)=sol(i)./col(i);
                end
            end
            [val,position]=min(ratio);
            BV(:,position)=e_col;
            pivot=A(position,e_col);
            A(position,:)=A(position,:)./pivot;
            
        
        
            for i=1:size(A,1)
                if i~=position
                    m=A(i,e_col);
                    
                    A(i,:)=(A(i,:)-A(position,:)*m);
                end
            end
            zrow=cost(BV)*A-cost;
            zjcj=[A;zrow];
            simplex_table=array2table(zjcj);
            simplex_table.Properties.VariableNames(1:size(zjcj,2))={'x1','x2','s1','s2','solution'};
            disp(simplex_table)    
        
        end

 
    else
        run=false;
        disp('Optimal Solution is');
        disp(simplex_table)
    end
end

