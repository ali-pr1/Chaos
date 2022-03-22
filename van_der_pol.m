function dx=vanderpol(t,x,mu)
dx=[
  x(2);
  mu*x(2)*(1-(x(1))^2)-x(1);
];
end
