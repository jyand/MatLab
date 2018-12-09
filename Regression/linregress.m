%% John DeSalvo
% Linear Regression

data = csvread('dataa.csv'); %reading the data from a csv file
x = data(:, 1); %prey density
y1 = data(:, 2); %P. steadius
y2 = data(:, 3); %P. speedius

%% Problem 1: Basic Linear
% $y = mx$
%slopes of the lines y = mx for P. steadius and P. speedius, respectively
m1 = sum(x.*y1)/sum(x.^2)
m2 = sum(x.*y2)/sum(x.^2)
%sum-of-squared erros for P. steadius and P. speedius, respectively
sse1 = sum(y1.^2) - m1*sum(x.*y1)
sse2 = sum(y2.^2) - m2*sum(x.*y2)

%% Problem 2 : General Linear
% $y = mx + b$
% In this section, we create new vectors for our data by shfiting each by
% the its mean.
X = [];
Y1 = [];
Y2 = [];
for i = 1:length(x)
    X(i) = x(i) - mean(x);
    Y1(i) = y1(i) - mean(y1);
    Y2(i) = y2(i) - mean(y2);
end
% new m values for P. steadius and P. speedius, respectively
m1 = sum(X.*Y1)/sum(X.^2)
m2 = sum(X.*Y2)/sum(X.^2)
% new SSE values for P. steadius and P. speedius, respectively
SSE1 = sum(Y1.^2) - m1*sum(X.*Y1)
SSE2 = sum(Y2.^2) - m2*sum(X.*Y2)
%b values for P. steadius and P. speedius, respectively
b1 = mean(y1) - m1*mean(x)
b2 = mean(y2) - m2*mean(x)

%% Problem 3: Quadratic
% $y = b + mx + ax^{2}$
%For P. steadius, we find the intercept b and coefficients m and a
mdl1 = fitlm(x, y1)
%and the SSE
mdl1.SSE
%For P. speedius, we find the intercept b and coefficients m and a
mdl2 = fitlm(x, y2)
%and the SSE
mdl2.SSE

%% Problem 4: Nonlinear
% $y = qx/(a+x)$
% When fitting the data to this nonlinear model, model function of
% coefficients a and the dummy variable t is used. In this case, a(1) is q,
% a(2) is a, and the "beta0" coefficients are initially 1.
f = @(a, t) a(1).*x./(a(2) + x);
%For P. steadius, b1 is q and b2 is a
nmdl1 = fitnlm(x, y1, f, [1 1])
%and the SSE
nmdl1.SSE
%For P. speedius, b1 is q and b2 is a
nmdl2 = fitnlm(x, y2, f, [1 1])
%and the SSE
nmdl1.SSE

%% Problem 5: Model Selection
% We create a vector to list all SSE values for all models for both P.
% Steadius and P. Speedius and then compute the AIC for each. We see that
% the nonlinear model has the lowest AIC/highest statistical integrity for
% both P. Steadius with a value of 35.7718 and P. Speedius with a value of
% 23. 6742
SSE_list = [sse1, sse2, SSE1, SSE2, mdl1.SSE, mdl2.SSE, nmdl1.SSE, nmdl2.SSE] ;
AIC = @(t) length(x).*log(t./length(x)) + 8;
for i = 1:length(SSE_list)
    AIC(SSE_list(i))
end