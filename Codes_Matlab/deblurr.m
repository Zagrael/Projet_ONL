% Deblurring algorithm
%
% Given A and xtilde, solve the linear optimization problem: 
% 
% min_{0 <= x <= 1} ||A*xtilde - x||_2^2 + lambda ||x||_2^2

function x = deblurr(A,xtilde,lambda)

n = length(xtilde);

x(:,1) = xtilde;
x(:,2) = zeros(n,1); % Second vecteur pour comparer les it�rations

iter = 0; % Compteur d'it�rations

Q = 2 * ((A' * A) + lambda * eye(n));
c = -2 * (A' * xtilde);

while (abs(x(:,1) - x(:,2)) > 0*1e-10*ones(n,1) & iter <= 30)
    % On pose le vecteur de comparaison �gal � la pr�c�dente it�ration
    x(:,2) = x(:,1);
    
    % Visualisation de l'avancement
    clc;
    iter = iter + 1;
    disp('Nombre d''it�rations : ');
    disp(iter);
    
    % Une it�ration de descente de coordonn�e
    for i = 1:n % pour chaque variable
        sum = 0;
        for j = i:n
            sum = sum + Q(i,j) * x(j,1);
        end
        disp((sum + c(i)) / Q(i,i));
        x(i,1) = min(max(x(i,1) - (sum + c(i)) / Q(i,i), 0), 1);
    end
end

x = x(:,1);

end