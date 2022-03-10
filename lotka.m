function dx=lotka(t,x,Beta)
dx=[
  x(1)*(1-Beta(1)*x(2));
  x(2)*(Beta(2)*x(1)-1);
];
end
