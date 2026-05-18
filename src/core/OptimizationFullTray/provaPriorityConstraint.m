%%
clc
syms x1 x2 x3;
xs = [x1 x2 x3];
i = numel(xs):-1:2;
k = i-1:-1:1;
kps = xs(i) - xs(k) <= 0 
x = [0 2 3]
kpxs = sym(x(i)) - sym(x(k)) - sym(2*x(i).*(x(k)== 0)) <= 0 
% kpxs2 = xs(i) - 2*xs(i) - xs(k) <= 0 
kp = x(i) - x(k) - 2*x(i).*(x(k)== 0) <= 0
