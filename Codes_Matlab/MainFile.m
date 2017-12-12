% Mainfile to run 
clear all; close all; clc; 

% Load input data
load Example0
figure; 
imshow( reshape(xtilde,l,L) ); 
title('Image flout�e et bruit�e'); 

% Choose parameter and solve problem
lambda = 1e-6; 
x = deblurr(A,xtilde,lambda); % Un param�tre peut �tre ajout� pour modifier le nombre d'it�rations

% Display solution
figure; 
imshow( reshape(x,l,L) ); 
title('Image d�flout�e et d�bruit�e'); 

% If xtrue is known, you can use it to display the relative error in %
fprintf('L''erreur relative de reconstruciton L1 est de %2.2f %% \n', ... 
    norm(x-xtrue,1)/norm(xtrue,1)*100); 