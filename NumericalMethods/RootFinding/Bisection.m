%% John DeSalvo
% Bisection Method

%% Problem 1

%%
% 
% $$x^{3} = 9$$
%
% By inspection, the cube root of $9$ lies somewhere between $2$ and $3$ , so that interval is chosen. Manually computing 2 steps of the bisection method results in a root of 
% $2.125$. In contrast, calculating within $10^{-4}$ results in a root of $\approx 2.080$ with $13$ steps.
func = @(x) x^3 - 9;
bisect(func, 2, 3, 1e-4);

%% Problem 2
%%
% 
% $$6-sin^{2}(x) = x$$
%
% By inspection, the root lies somewhere between $6$ and $2 \pi$, so the interval $[6, 7]$ is chosen. Manually computing 2 steps of the bisection method results in a root of 
% $6.125$. In contrast, calculating within $10^{-4}$ results in a root of $\approx 6.052$ with $13$ steps.
func = @(x) 6 - x + sin(x)^2;
bisect(func, 6, 7, 1e-4);

%% Problem 3
%%
% 
% $$1000000 = (50000 + \frac{10000}{r})e^{20r} - \frac{10000}{r}$$
%
% The interval $[0, 100]$ is chosen since the root is an interest rate. It is evaluated on both a $20$ year and a $10$ year time-frame.
func = @(x) (5e4 + 1e-4*x)*exp(20*x) - 1e-4*x - 1e6;
bisect(func, 0, 100, 1e-6);
func = @(x) (5e4 + 1e-4*x)*exp(10*x) - 1e-4*x - 1e6;
bisect(func, 0, 100, 1e-6);

%% Problem 4
%%
% 
% $$f(x) = \frac{|x-2|}{x^{3}-2x^{2}-x-2}$$
%
% on the interval
%%
% 
% $$[1, 4]$$
% 
func = @(x) (abs(x-2))/(x^3-2*x^2-x-2);
bisect(func, 1, 4, 1e-4);

%% Problem 5
%%
% 
% $$f(x) = \frac{|x-2|}{x^{3}-2x^{2}-x-2}$$
%
% on the interval
%%
% 
% $$[4, 6]$$
%
func = @(x) (abs(x-2))/(x^3-2*x^2-x-2);
bisect(func, 4, 6, 1e-4);

%% Problem 6
%%
% 
% $$27x^{3} - 27x^{2} + 9x = 1$$
%
% on the interval
%%
% 
% $$[0, 1]$$
%
func = @(x) 27*x^3 - 27*x^2 + 9*x -1;
bisect(func, 0, 1, 1e-6);

%% Problem 7
%%
% 
% $$\frac{sgn(x - \frac{1}{3})|x - \frac{1}{3}|^{\frac{1}{3}}}{0.001 + (x-0.33)^{2}}$$
%
% on the interval
%%
% 
% $$[0, 1]$$
%
func = @(x) (sign(x-1/3)*abs(x-1/3)^(1/3))/(0.001+(x-0.33)^2);
bisect(func, 0, 1, 1e-6);

%% Problem 8
%%
% 
% $$64x^{3} - 48x^{2} + 12x = 1$$
%
% on the interval
%%
% 
% $$[0, 1]$$
% 

func = @(x)(64*x^3 - 48*x^2 + 12*x - 1);
bisect(func, 0, 1, 1e-6);
