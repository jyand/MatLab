%% John DeSalvo
% Numerical Differentiation

%% Problem 1
% $f(x) = \frac{1}{1+x}$
%
f = @(x) 1./(1+x);
x0 = 0; % initial x value
n = 1:9; % n = 1, 2, ..., 9
h = [];%initialization of the array of h values
Df = []; %initialization of the forward finite difference array
Dc = []; %initialization of the centered difference array
% errors between the the actual derivative and the approximated for both
% the forward difference and centered, respectively
Err_f = [];
Err_c = [];
% the ratios for two consecutive errors for both
% the forward difference and centered, respectively
ratF = [];
ratC = [];

for i = n
    h(i) = 2.^(-i); %h for each n value
    % forward difference for each n value
    Df(i) = (f(x0 + h(i)) - f(x0))./h(i);
    % centered difference for each n value
    Dc(i) = (f(x0 + h(i)) - f(x0 - h(i)))./(2*h(i)); 
    Err_f(i) = abs(-1 - Df(i)); %error ratio for fwd diff
    Err_c(i) = abs(-1 - Dc(i)); %error for ctr diff
    % ratios for two consecutive errors are computed for n >= 2
    if(i > 1)
        ratF(i) = Err_f(i)/Err_f(i-1);
        ratC(i) = Err_c(i)/Err_c(i-1);
    end
    % using the a formatting string h(i), Df(i), Dc(i), Err_f(i), Err_c(i)
    % are all printed in a table
    fprintf('%2.8f | %2.8f | %2.8f | %6.12f | %6.12f |', h(i), Df(i), Dc(i), Err_f(i), Err_c(i));
    % the ratios ratF(i) and ratC(i) are printed if n >= 2
    if(i > 1)
        fprintf('%6.12f | %6.12f', ratF(i), ratC(i));
    end
    % simply print an escape character to start a new line
    fprintf('\n');
end

%% Problem 2
% $f(x) = e^{x}$
%
f = @(x) exp(x)
D2c = []; %centered finite difference, 2nd order
D2t = []; %centered finite difference, 2nd order, truncating f(xi)
Err2c = []; %error without truncating
Err2t = []; %error with truncating
rat2c = []; %error ratio without truncating
rat2t = []; %error ratio with truncating
for i = n
    % 2nd derivative approximation without truncating for each n value
    D2c(i) = (f(x0 - h(i)) - 2*f(x0) + f(x0 + h(i)))/h(i).^2;
    % 2nd derivative approximation with truncating for each n value
    D2t(i) = (round(f(x0 - h(i)), 6) - 2*round(f(x0), 6) + round(f(x0 + h(i)), 6))/h(i).^2;
    % errors for each value of h
    Err2c(i) = abs(1 - D2c(i));
    Err2t(i) = abs(1 - D2t(i));
    % ratios are computed if n >= 2
    if(i > 1)
        rat2c(i) = Err2c(i)/Err2c(i-1);
        rat2t(i) = Err2t(i)/Err2t(i-1);
    end
    % h(i), D2c(i), D2t(i), Err2c(i), Err2t(i)
    % are all printed in a table
    fprintf('%2.8f | %2.8f | %2.8f | %6.12f | %6.12f |', h(i), D2c(i), D2t(i), Err2c(i), Err2t(i));
    % rat2c(i), rat2t(i) are printed if n >= 2
    if(i > 1)
        fprintf('%6.12f | %6.12f', rat2c(i), rat2t(i));
    end
    % start a new line
    fprintf('\n');
end

%% Extra
% We see that without truncating, the error decreases monotonically.
% However, when truncating f(xi), the error will increase after decreasing.
% This is because an additional round-off error is introduced to our error
% with the approximated derivative. Relative to double floating-point
% precision (which MATLAB uses conventionally), rounding to 6 digits after
% the decimal point is imprecise so it is apparent when plotting both
% errors.
loglog(Err2c)
hold on;
loglog(Err2t)
hold on;
loglog(h)
legend('Error without truncating', 'Error with truncating', 'h')