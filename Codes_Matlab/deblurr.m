% Deblurring algorithm
%
% Given A and xtilde, solve the linear optimization problem: 
% 
% min_{0 <= x <= 1} ||A*xtilde - x||_2^2 + lambda ||x||_2^2

function x = deblurr(A,xtilde,lambda)

n = length(xtilde);
% !!! Write your code HERE to compute x !!!
x(:,1) = xtilde;
x(:,2) = zeros(n,1);

syms t;
iter = 0; % Compteur d'itérations
iterx = 0; % Compteur de variables

while (abs(x(:,2) - x(:,1)) >= 1e-10*ones(n,1) & iter <= 30)
    der = 0;
    x(:,1) = x(:,2);
    iter = iter + 1;
    % Une itération de descente de coordonnée
    for k = 1:n % pour chaque variable
        clc;
        iter
        iterx = iterx + 1
        for i = 1:n % pour chaque variable
            if i ~= k
                der = der + 2*A(i,:)*x(:,2) + 2*lambda*x(i,2);
            else
                der = der - 2*A(k,k)*x(k,2) + 2*A(i,i)*t + 2*lambda*t;
            end
        end
        x(k,2) = solve(der,t);
    end
end
x = x(:,2);
end