clc
clear all
x=0:0.1:15;

y1=(10+x)/3;
y2=(6-x);
y3=(x-2);
funcs=[y1;y2;y3];
plot(x,y1,'Color','r','LineWidth',2);
hold on;
plot(x,y2,'Color','g','LineWidth',2);
plot(x,y3,'Color','b','LineWidth',2);


for i=1:3
    if(find(funcs(i,:)==0))
        i_pt=find(funcs(i,:)==0);
        plot(x(i_pt),0,'Marker','o');
    end
    plot(0,funcs(i,1),'Marker','o');
end

A=[-1 3;1 1];
B=[10;6];
X=A\B;
X=X.';
plot(X(1),X(2),'Marker','o');

A=[1 1;1 -1];
B=[6;2];
X=A\B;
X=X.';
plot(X(1),X(2),'Marker','o');


A=[-1 3;1 -1];
B=[10;2];
X=A\B;
X=X.';
plot(X(1),X(2),'Marker','o');

hold off;
ax=gca;

legend('-x1+3x2=10','x1+x2=6','x1-x2=2');
ax.XAxisLocation='bottom';
ax.YAxisLocation='origin';
xlim([0 inf]);
ylim([0 inf]);
