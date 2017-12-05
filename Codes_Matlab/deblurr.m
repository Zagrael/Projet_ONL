% Deblurring algorithm
%
% Given A and xtilde, solve the linear optimization problem: 
% 
% min_{0 <= x <= 1} ||A*xtilde - x||_2^2 + lambda ||x||_2^2

function x = deblurr(A,xtilde,lambda); 

n = length(xtilde); 
% !!! Write your code HERE to compute x !!! 
x = zeros(n,1); 