%John DeSalvo

%% Part 1
%%
% 
% $$\sum_{k=1}^{n=100}k$$
% 
S = 0;
for k = 1:100
	S = S + k;
end
fprintf('%d:th Partial Sum = %3.6f\n', k, S);
S = 0;

%%
% 
% $$\sum_{k=1}^{n=100}\frac{(-1)^{k+1}}{l}$$
% 
for k = 1:100
	if (mod(k, 2) == 0) %testing for even/odd
		S = S - 1/k;%subtract when S is even
    else
		S = S + 1/k;%add when S is odd
	end
end
fprintf('%d:th Partial Sum = %3.6f\n', k, S);

%% Exercise 1
%%
% 
% $$arctan(x) = \sum_{k=1}^{\infty} \frac{x^{2k-1}}{2k-1}$$
% 
S = 0;
x = 1; %arctan(1) is analytically pi/4
for k = 1:100
	if (mod(k, 2) == 0) %when S is even we subtract the kth term to the sum
		S = S - (x^(2*k - 1))/(2*k - 1);
    else %when S is odd we add the kth term according to the sum
		S = S + (x^(2*k - 1))/(2*k - 1);
	end
end
S = 4*S;
fprintf('%dth Partial Sum = %3.6f\n', k, S);
%Approximating pi using this method is only accurate up to 3 decimal places

%% Part2
%%
% 
% $$S = \sum_{k=1}^{\infty}\frac{(-1)^{k+1}}{l}$$
%
tolerance = 1e-4;
S = 0;
term = 1;
k = 1;
sgn = 1;
while (abs(term) > tolerance)
	term = sgn/k;
	S = S + term;
	k = k + 1;
	sgn = -sgn;
end

%% Exercise 2
%%
% 
% $$e^{x} = \sum_{k=1}^{\infty}\frac{x^{n}}{n!}$$
%
tolerance = 1e-5;
S = 1;
k = 1;
term = 1e-5; %initialization of the error term is arbitrary but this is the lowest possible value for the loop to work
while (abs(term) > tolerance) %comparing the kth term of the Taylor Polynomial or the 'error term' with the tolerance
	term = 1/factorial(k); %approximating exp(1) using the Series expansion
	S = S + term;
    fprintf('%d :partial sum equals %3.6f \n', k, S);
	k = k + 1;
end
%Approixmating e within 10^-5 takes 10 iterations

%% Making Plots
x = -1:0.01:1;
y = x.^2;
plot(x, y);
xlabel('x');
ylabel('y = x^2')
legend('Plot of f(x) = x^2')
title('Plot of function f(x) = x^2')
x = linspace(-1, 1, 200);

%% Exercise 3
%%
% 
% $$f(x) = sin(2sin(2sin(2sin(x))))$$
%
x = linspace(-4*pi, 4*pi, 1000); %the x range is 1,000 points from -4pi to 4pi
y = sin(2*sin(2*sin(2*sin(x)))); %f(x)
plot(x, y);
grid on %adding some gridlines to make it look nice
grid minor
xlabel('x')
ylabel('y')
legend('plot of f(x) = sin(2sin(2sin(2sin(x))))')
title('plot of f(x) = sin(2sin(2sin(2sin(x))))')
