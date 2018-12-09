%Get the data from the CSV file
M=csvread('Fatalities.csv',2,0);
%The category under consideration 
Age55Up= M(1:36,4);
%All other columns
NOT_Age55Up = [M(1:36,1:3) M(1:36,5:7)];
%Store this data in an array
X=NOT_Age55Up
%Covariance matrix
R=X'*X;
%Cross correlation vector
P=X'*Age55Up;
%Optimum weights via normal equation
w = inv(R)*P;
%Plot of predicted vs. actual
figure(1)
scatter(Age55Up, X*w, 10) 
hline=refline(1,0); 
hline.Color = 'red'; 
ylabel('\fontsize{16}Predicted'); 
xlabel('\fontsize{16}Actual'); 
title('\fontsize{20}Concentration of fatalities over age 55 vs. other ages');
%e = Age55Up - X*w
m = length(w)
ErrorTrain = (w'*w)/m

%Training Part
Age55Up= M(37:45,4);
NOT_Age55Up = [M(37:45,1:3) M(37:45,5:7)];
X=NOT_Age55Up
figure(2)
scatter(Age55Up, X*w, 10) 
hline=refline(1,0); 
hline.Color = 'red'; 
ylabel('\fontsize{16}Predicted'); 
xlabel('\fontsize{16}Actual'); 
title('\fontsize{20}Concentration of fatalities over age 55 vs. other ages');
%e = Age55Up - X*w
ErrorTest = (w'*w)/m