clc
clear

A = [2 4; 3 5];

B = [8;15];

X=A\B;
X=X.';


func1 = @(x1,x2) 2*x1 +4*x2;
func2 = @(x1,x2) 3*x1 +5*x2;
Z = @(x1,x2) 3*x1+2*x2;

x= 0:.1:15;
y1=(4-x)/2;
y2=(15-3*x)/5;
funcs = [y1;y2];
plot(x,y1,'Color','b','LineWidth',2);
hold on
plot(x,y2,'LineWidth',2,'Color','r');

plot(X(1),X(2),'Marker','o');

mat=[];
for i=1:size(funcs,1)
    i_pt=find(funcs(i,:)==0);
%     Finding the X-intercept
    plot(x(i_pt),0,'Marker','o');
%     Finding Y-intercept
    plot(0,funcs(i,1),'Marker','o');
    
%     Adding the X and Y intercepts to a matrix by extending the matrix columnwise
    mat=[mat;[x(i_pt),0]];
    mat=[mat;[0,funcs(i,1)]];
end
hold off

solutions = [];
k=1;
for i=1:size(mat,1)
    x1=mat(i,1);
    x2=mat(i,2);
    if (func1(x1,x2)<=8) && (func2(x1,x2)<=15 && x1>=0 && x2>=0)
%         Check if constraints are satisfied then add to solution matrix
        solutions=[solutions;[x1 x2]];
    end
end

if (X(1)>=0 && X(2)>=0)
%     Checking intersection point of lines satisfy >=0 constraint
    solutions = [solutions;X];
end

mat=[];
if (isempty(solutions))
    disp("No solution found.")
else
    for i=1:size(solutions,1)
        x1=solutions(i,1);
        x2=solutions(i,2);
        mat=[mat Z(x1,x2)];
    end
    disp(max(mat))
    optim=find(mat==max(mat));
    disp(solutions(optim,:))
end






legend('2x1+4x2=8','3x1+5x2=15')
ax = gca;
ax.XAxisLocation = 'bottom';
ax.YAxisLocation = 'origin';
xlim([0 inf]);
ylim([0 inf]);
