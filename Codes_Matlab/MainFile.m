% Mainfile to run 
clear all; close all; clc; 

% Load input data
load Example1
figure; 
imshow( reshape(xtilde,l,L) ); 
title('Image floutée et bruitée'); 

%%
% Choose parameter and solve problem
lambda = 1e-6; 
x = deblurr(A,xtilde,lambda,3000); % Un paramètre peut être ajouté pour modifier le nombre d'itérations

%%
% % Pour le tableau de l'erreur en fonction de lambda
% err = zeros(18,1);
% lambda = zeros(18,1); % lambda = {1e-1, 5e-2, 1e-2, ..., 1e-10, 5e-11}
% for i = 1:9
%     % impairs
%     lambda(2*i-1,1) = 1*10^(-i-1);
%     x = deblurr(A,xtilde,lambda(2*i-1,1));
%     err(2*i-1,1) = norm(x-xtrue,1)/norm(xtrue,1)*100;
%     % pairs
%     lambda(2*i,1) = 0.5*10^(-i-1);
%     x = deblurr(A,xtilde,lambda(2*i,1));
%     err(2*i,1) = norm(x-xtrue,1)/norm(xtrue,1)*100;
%     clc;
%     disp(i);
% end

%%
% Display solution
figure; 
imshow( reshape(x,l,L) ); 
title('Image défloutée et débruitée'); 

% If xtrue is known, you can use it to display the relative error in %
fprintf('L''erreur relative de reconstruciton L1 est de %2.2f %% \n', ... 
    norm(x-xtrue,1)/norm(xtrue,1)*100); 