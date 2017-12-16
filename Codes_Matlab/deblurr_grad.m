% Deblurring algorithm
%
% Given A and xtilde, solve the linear optimization problem: 
% 
% min_{0 <= x <= 1} ||A*xtilde - x||_2^2 + lambda ||x||_2^2

function x = deblurr(A,xtilde,lambda,maxIter)

if ~exist('maxIter','var')
    maxIter = 300;
end

n = length(xtilde);

k=1;
x(:,k) = xtilde;
x(:,k+1) = zeros(n,1); 
iter = 0; % Compteur d'itérations

Q = 2 * ((A' * A) + lambda * eye(n));
c = -2 * (A' * xtilde);

while (norm(x(:,k) - x(:,k+1),'fro') > 1e-5 && iter <= maxIter)
    
    % Une itération 
    
    sym p ;
    
    x(:,k+1) = x(:,k) - 'p' * (Q * x(:,k) + c);
    df = Q * x(:,k+1) + c ;
    
    eqn = df==0;
    p1 = solve(eqn, 'p');
    p1
    
    x(:,k+1) = x(:,k) - p1 * (Q * x(:,k) + c);
    k=k+1;
    
    % Avancement
    
    clc;
    iter = iter + 1;
    disp('Nombre d''itérations : ');
    disp(iter);
    
end
x = x(:,k);
end