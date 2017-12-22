% Deblurring algorithm
%
% Given A and xtilde, solve the linear optimization problem: 
% 
% min_{0 <= x <= 1} ||A*xtilde - x||_2^2 + lambda ||x||_2^2

function x = deblurr_grad(A,xtilde,lambda,maxIter)

if ~exist('maxIter','var')
    maxIter = 3000;
end

n = length(xtilde);

x(:,1) = xtilde;
x(:,2) = zeros(n,1); % Second vecteur pour comparer les itérations

iter = 0; % Compteur d'itérations

Q = 2 * ((A' * A) + lambda * eye(n));
c = -2 * (A' * xtilde);

while (norm(x(:,1) - x(:,2),'fro') > 1e-10 && iter <= maxIter)
    % On pose le vecteur de comparaison égal à la précédente itération
    x(:,2) = x(:,1);
    
    gf = Q * x(:,1) + c;
    a = (gf' * gf) / (gf' * Q * gf);
    
    x(:,1) = min(max(x(:,1) - a * gf,0),1);
    
%     % Visualisation de l'avancement
%     clc;
    iter = iter + 1;
%     disp(iter);
    
end
disp(iter);
x = x(:,1);
end