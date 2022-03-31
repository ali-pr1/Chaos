% A few useful exports
% 1- plotting potential
% x: quantity of interest
% t: time
% i: facator of possible bifurcation
x=0:0.1:2;

for i=-1:0.5:1
    % y: potential
    y=i*x+(i-1)*(x.^2)/2-(x.^3)/3;
    plot(x,y);figure(1)
    hold on
end
hold off

% plotting vector field
% differential equation we are interested in
dy = @(t,y) [y(1)*(3-2*y(1)-y(2)); y(2)*(2-y(1)-y(2))];
% define a grid containing critical points
[X1,X2] = meshgrid(0:0.5:5);
u = zeros(size(X1));
v = zeros(size(X2));
% we can use a single loop over each element to compute the derivatives at
% each point (y1, y2)
t=0; % initial conditions
for i = 1:numel(X1)
    Yprime = dy(t,[X1(i); X2(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
% plot the field
figure(2)
quiver(X1,X2,u,v,'g')
xlabel('y_1')
ylabel('y_2')
axis tight equal;
hold on
% check some solutions
y0=[10 0;0 10;0.5 0.2; 2 3];
for i=1:length(y0)
    [ts,ys] = ode45(dy,[0,50],y0(i,:));
    plot(ys(:,1),ys(:,2))
    plot(ys(1,1),ys(1,2),'bo') % starting point
    plot(ys(end,1),ys(end,2),'ks') % ending point
end
hold off