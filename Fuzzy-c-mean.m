load fcmdata
dataset = fcmdata3;
N = 4; 
exponent = 2;
maxIterations = 100;
minImprovement = 0.00001;
displayObjectiveFunction = true;
options = [exponent maxIterations minImprovement displayObjectiveFunction];
[C,U] = fcm(dataset,N,options);
maxU = max(U);
index = cell(N,1);
for i=1:N
    index{i} = find(U(i,:) == maxU);
end
figure
hold on
for i=1:N
    plot(dataset(index{i},1),dataset(index{i},2),'o')
    plot(C(i,1),C(i,2),'xk','MarkerSize',15,'LineWidth',3)
end
hold off
cluster = 2;
[X,Y] = meshgrid(0:0.05:1, 0:0.05:1);
Z = griddata(dataset(:,1),dataset(:,2),U(cluster,:),X,Y);
surf(X,Y,Z)
