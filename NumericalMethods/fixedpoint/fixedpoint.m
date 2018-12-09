%% John DeSalvo
Fixed Point Iteration

%% Fixed-Point Iteration Function
%function r = fpi(g, x0, TOL, N)
%    x = [];
%    x(1) = x0;
%    i = 2;
%    x(2) = g(x0);
%    while(abs(x(i) - x(i-1)) > TOL && i <= N)
%        i = i + 1;
%        x(i) = g(x(i-1));
%    end
%    r = x(i);
%    i
%    r
%end

%% Problem 1
% All three of the following FPIs converge to an approximation of 
% $\sqrt{2}$ . The functions happen to be listed from fastest to slowest 
% as shown by the number of iterations. This is possibly because each
% $f(x) = 0$ expression reduces to $ax^{2}+2 = (a+1)x^{2}$ (which each
% reduce to $x^{2} = 2$ ) but the functions here are listed in ascending
% order of $a$ value.
%%
% $\frac{x}{2}+\frac{1}{x}$
g = @(x) x./2 + 1./x;
fpi(g, 1, 1e-6, 50);
figure(1);
cobweb(g, 1, 50, 0.1, 20);
%%
% $\frac{2x}{3}+\frac{2}{3x}$
g = @(x) (2*x)./3 + 2./(3*x);
fpi(g, 1, 1e-6, 50);
figure(2);
cobweb(g, 1, 50, 0.1, 20);
%%
% $\frac{3x}{4}+\frac{1}{2x}$
g = @(x)(3*x)./4 + 1./(2*x);
fpi(g, 1, 1e-6, 50);
figure(3);
cobweb(g, 1, 50, 0.1, 20);

%% Problem 2
% The FPI for the first function diverges to $-\infty$, though it can be
% shown analytically that is has a root of $\sqrt{5}$. The second converges
% to $2$ (given these initial conditions). The third and fourth FPIs
% converge to $\sqrt{5}$ where the fourth converges faster then the third.
%%
% $5+x-x^{2}$
g = @(x) 5 + x - x.^2;
fpi(g, 2.5, 1e-8, 50);
figure(4);
cobweb(g, 2.5, 50, 0.1, 10);
%%
% $\frac{5}{x}$
g = @(x) 5./x;
fpi(g, 2.5, 1e-8, 50);
figure(5);
cobweb(g, 2.5, 50, 0.1, 100);
%%
% $1+x-\frac{x^{2}}{5}$
g = @(x) 1 + x - (1/5)*x.^2;
fpi(g, 2.5, 1e-8, 50);
figure(6);
cobweb(g, 2.5, 50, 0.1, 6);
%%
% $\frac{x}{2}+\frac{5}{2x}$
g = @(x) (1/2)*(x + 5./x);
fpi(g, 2.5, 1e-8, 50);
figure(7);
cobweb(g, 2.5, 50, 0.1, 25);

%% Problem 3
% For the $r$ values of $0.9$ and $2.8$ , a few values are attempted for
% $x_{0}$. For $x_{0} = 1$ , the root $r-1$ is found for both given values
% of $r$ .
%%
% $rx-x^{2}$
g = @(x) 0.9*x - x.^2;
x_0 = [1, 0.1, 0.01];
for n = 1:length(x_0)
    x_0(n)
    fpi(g, x_0(n), 1e-6, 200);
    figure(7+n);
    cobweb(g, x_0(n), 200, 0.1, 0.5);
end
g = @(x) 2.8*x - x.^2;
for n = 1:length(x_0)
    x_0(n)
    fpi(g, x_0(n), 1e-6, 200);
    figure(10+n);
    cobweb(g, x_0(n), 200, 0.1, 3.5);
end

%% Problem 4
% Using the initial guess of $x_{0}=1$ is a better execution than $1.4$
% since the former converges to the root of $\frac{1}{3}$ and the ladder,
% which may not be close enough to the root, diverges to $\infty$ .
%%
% $\frac{1}{3}+(x-\frac{1}{3})^{3}$
g = @(x) 1./3 + (x - 1./3).^3;
fpi(g, 1, 1e-6, 50);
figure(14);
cobweb(g, 1, 50, 0.1, 1);
fpi(g, 1.4, 1e-6, 50);
figure(15);
cobweb(g, 1.4, 50, 0.1, 1);
