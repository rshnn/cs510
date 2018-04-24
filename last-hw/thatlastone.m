A = [1, 2, 3; 2, 3, 4; 3, 4, 5]

syms x 
AA = A - eye(3)*x;
f = det(AA);
Z = solve(f, x);
Z = double(Z)

Y = ones(3,3)
for i=1:3
    y = linsolve( subs(AA, -Z(i,1)), [0;0;0])
    y = y/norm(y);
    Y(:,i) = y;
end
Y

% 
% 
% b =
% 
%    -0.6235         0         0
%          0   -0.0000         0
%          0         0    9.6235
