%% John DeSalvo
fmt = '%17.12f |';
header = "   n         t_i               w_i                y_i                e_i           ";

%% Problem 1
% In this section, we apply Euler's Method, RK2, and RK4 to solve the
% following differential equation. In general, in order of greater to lower
% accuracy in terms of results we have: RK4 > RK2 > Euler's Method. When
% plotting the numerical solution and the analytical solution on the same
% graph, the functions are indistinguishable for RK2 and RK4 but are
% visible for Euler's Method. As expected, lower values of h give more
% accurate resutls. For the second part of problem 1, error ratios
% approximate 1 for all three methods. In this case we are looking at the
% nth error value after n iterations. Since the error is largely dependent
% on the h value and accumulates with successive iterations, it is not
% unexpected for the ratio of successive errors to approach or approximate
% 1 for a fixed h value.
dy = @(t, y) y*cos(t);
a = 0;
b = 1;
y0 = 1;

%% Problem 1.1: Euler's Method
h = 0.2;
[t, y] = Eulers(dy, a, b, y0, h);
yt = exp(sin(t));
fprintf('%s \n', "Euler's Method:");
fprintf('%s \n', "h = 0.2");
figure(1);
ODEprint(fmt, header, t, y, yt);

h = 0.1;
[t, y] = Eulers(dy, a, b, y0, h);
yt = exp(sin(t));
fprintf('%s \n', "h = 0.1");
figure(2);
ODEprint(fmt, header, t, y, yt);

%% Problem 1.1: RK2
fprintf('%s \n', "Runge-Kutta 2:");

h = 0.2;
fprintf('%s \n', "h = 0.2");
[t, y] = RK2(dy, a, b, y0, h);
yt = exp(sin(t));
figure(3);
ODEprint(fmt, header, t, y, yt);

h = 0.1;
fprintf('%s \n', "h = 0.1");
[t, y] = RK2(dy, a, b, y0, h);
yt = exp(sin(t));
figure(4);
ODEprint(fmt, header, t, y, yt);

%% Problem 1.1: RK4
fprintf('%s \n', "Runge-Kutta 4:");

h = 0.2;
fprintf('%s \n', "h = 0.2");
[t, y] = RK4(dy, a, b, y0, h);
yt = exp(sin(t));
figure(5);
ODEprint(fmt, header, t, y, yt);

h = 0.1;
fprintf('%s \n', "h = 0.1");
[t, y] = RK4(dy, a, b, y0, h);
yt = exp(sin(t));
figure(6);
ODEprint(fmt, header, t, y, yt);

%% Problem 1.2: Euler's Method
fprintf('%s \n', "Euler's Method:");
header = "   n         h               error_n          ratio_n";
fprintf('%s \n', header);
for k = 1:9;
    n = 5*2^(k-1);
    h = (b-a)/n;
    [t, y] = Eulers(dy, a, b, y0, h);
    yt = exp(sin(t));
    err = [];
    for i = 1:n
        err(i) = abs(yt(i) - y(i));
        if i > 1
            ratio(i) = err(i-1)/err(i);
        end
    end
    fprintf(cat(2, '%4.0f', fmt, fmt, fmt), n, h, err(i), ratio(i));
    fprintf('\n');
end

%% Problem 1.2: RK2
fprintf('%s \n', "Runge-Kutta-2:");
fprintf('%s \n', header);
for k = 1:9;
    n = 5*2^(k-1);
    h = (b-a)/n;
    [t, y] = RK2(dy, a, b, y0, h);
    yt = exp(sin(t));
    err = [];
    for i = 1:n
        err(i) = abs(yt(i) - y(i));
        if i > 1
            ratio(i) = err(i)/err(i-1);
        end
    end
    fprintf(cat(2, '%4.0f', fmt, fmt, fmt), n, h, err(i), ratio(i));
    fprintf('\n');
end

%% Problem 1.2: RK4
fprintf('%s \n', "Runge-Kutta-4:");
fprintf('%s \n', header);
for k = 1:9;
    n = 5*2^(k-1);
    h = (b-a)/n;
    [t, y] = RK4(dy, a, b, y0, h);
    yt = exp(sin(t));
    err = [];
    for i = 1:n
        err(i) = abs(yt(i) - y(i));
        if i > 1
            ratio(i) = err(i)/err(i-1);
        end
    end
    fprintf(cat(2, '%4.0f', fmt, fmt, fmt), n, h, err(i), ratio(i));
    fprintf('\n');
end

%% Problem 2
h = [0.02, 0.015, 0.01];
dy = @(t, y) -100*y + 100*exp(-t);
y0 = 2;
for i = 1:length(h)
    figure(6+i)
    [t, y] = Eulers(dy, a, b, y0, h(i));
    yt = exp(-t) + exp(-100*t);
    plot(t, yt, t, y);
    hold on;
    [t, y] = RK2(dy, a, b, y0, h(i));
    plot(t, y);
    hold on;
    [t, y] = RK4(dy, a, b, y0, h(i));
    plot(t, y)
    legend('y(t)', 'Eulers', 'RK2', 'RK4')
end

%% Appendix: Functions

% function [t, y] = Eulers(dy, a, b, y0, h)
%     y(1,:) = y0;
%     t(1) = a;
%     n = (b-a)/h;
%     for i = 1:n
%         t(i+1) = t(i)+h;
%         y(i+1, :) = y(i, :) + h*dy(t(i), y(i, :));
%     end
% end

% function [t, y] = RK2(dy, a, b, y0, h)
%     y(1,:) = y0;
%     t(1) = a;
%     n = (b-a)/h;
%     for i = 1:n
%        t(i+1) = t(i) + h;
%        y(i+1, :) = y(i, :) + h*dy(t(i) + h/2, y(i,:) + h/2*dy(t(i), y(i)));
%     end
% end

% function [t, y] = RK4(dy, a, b, y0, h)
%     v1 = [];
%     v2 = [];
%     v3 = [];
%     v4 = [];
%     y(1,:) = y0;
%     t(1) = a;
%     n = (b-a)/h;
%     for i = 1:n
%        t(i+1) = t(i) + h;
%        v1(i) = dy(t(i), y(i, :));
%        v2(i) = dy(t(i) + h/2, y(i) + h/2*v1(i));
%        v3(i) = dy(t(i) + h/2, y(i) + h/2*v2(i));
%        v4(i) = dy(t(i) + h, y(i) + h*v3(i));
%        y(i+1, :) = y(i, :) + h/6*(v1(i) + 2*v2(i) + 2*v3(i) + v4(i));
%     end
% end

% function z = ODEprint(fmt, header, t, y, yt)
%    err = [];
%    fprintf('%s \n', header);
%     for i = 1:length(t)
%         err(i) = abs(yt(i) - y(i));
%         fprintf(cat(2, '%4.0f', fmt, fmt, fmt, fmt), i-1, t(i), y(i), yt(i), err(i));
%         fprintf('\n');
%     end
%     plot(t, y, t, yt);
%     legend('w(t)', 'y(t)');
% end
