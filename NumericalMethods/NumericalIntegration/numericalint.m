%% John DeSalvo
% Numerical Integration

%% Problem 1
fmt = '%17.12f | ';
alph = 'a':'g';
F = {@(x) exp(x.^2).*cos(x); @(x) exp(5.*cos(pi*x));
    @(x) exp((sin(x)+cos(x)).^2); @(x) 5*x.^7 + 6*x.^2 + 1;
    @(x) x.^(7/2); @(x) x.^(1/3); @(x) x.^(1/3)};
a = [0 0 0 1 0 0 1];
b = [1 1/2 2*pi 3 1 1 2];
N = 1:length(F);
n = 1:9;
m = 2.^n;
slopeS = [];
slopeT = [];

for i = N
    fprintf('%s \n', alph(i));
    fprintf('%s \n', "    m            T(f)               Err_m                ratio                S(f)              Err_m              ratio");
    T = [];
    ErrT = [];
    S = [];
    ErrS = [];
    for j = n
        T(j) = trapezoid(F{i}, a(i), b(i), m(j));
        S(j) = simpsons(F{i}, a(i), b(i), m(j));
        ErrT(j) = abs(integral(F{i}, a(i), b(i)) - T(j));
        ErrS(j) = abs(integral(F{i}, a(i), b(i)) - S(j));
        fprintf(cat(2, '|%4.0f | ', fmt, fmt) , m(j), T(j), ErrT(j));
        if(j>1)
            fprintf(fmt, ErrT(j)/ErrT(j-1));
        end
        fprintf(cat(2, fmt, fmt), S(j), ErrS(j));
        if(j>1)
            fprintf(fmt, ErrS(j)/ErrS(j-1));
        end
        fprintf('\n');
    end
    fprintf('\n');
    figure(1);
    loglog(ErrT);
    hold on;
    line = polyfit(log(n), log(ErrT), 1);
    slopeT(i) = line(1);
    figure(2);
    loglog(ErrS);
    hold on;
    line = polyfit(log(n), log(ErrS), 1);
    slopeS(i) = line(1);
end
figure(1);
legend();
figure(2);
legend();

%% Problem 2
% The Trapezoidal Rule converges with order p = 2 and the Simpsons rule
% converges with order p = 4. This results in asymptotic behavior of
% O(n^(-p)). In effect, this means that the ratio of consecutive errors is
% 1/p. In this case, we see that the last computed ratio for the
% Trapezoidal rule is 1/2 for all functions but (c) and 1/4 for (b) for
% Simpson's rule.

%% Problem 3
% It is expected that the slope of the line is equal to the order of
% convergence. In general most are close to 2 to varying degrees and
% fucntion (c) is approximately 4 for Simpson's Rule. This is consistent
% with the results of computed error ratios, though mostly with less
% accuracy.
abs([slopeT' slopeS'])