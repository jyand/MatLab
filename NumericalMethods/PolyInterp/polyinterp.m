%% John DeSalvo
% Lagrange Polynomial Interpolation

%% Part 1
f = @(x) exp(-x)
b = [2, 4, 8];
n = [2, 3, 4, 5];
for i = 1:length(b)
    x = linspace(0, b(i));
    y = f(x);
    figure(i);
    title('exp(-x)');
    err = [];
    for j = 1:length(n)
        P = Lagrange(x, f, 0, b(i), n(j));
        plot(x, P);
        hold on;
        err(j) = max(abs(y-P));
    end
    legend('n=2', 'n=3', 'n=4', 'n=5');
    err
end

%% Part 2.1
f = @(x) 1./(1+12*x.^2)
n = [3, 4, 5, 6, 7, 8, 9, 10, 20, 100];
x = linspace(-1, 1, 201) ;
y = f(x);
figure(4);
plot(x, y);
hold on;
for i = 1:length(n)
    P = Lagrange(x, f, -1, 1, n(i)+1);
    plot(x, P);
    hold on;
end
legend('f', 'n=3', 'n=4', 'n=5', 'n=6', 'n=7', 'n=8', 'n=9', 'n=10', 'n=20', 'n=100');

figure(5);
for i = 1:length(n)
    xk = [];
    for j = 1:n(i)
        xk(j) = cos((2*j-1)*pi/(2*n(i)));
    end
    P = Lagrange(x, f, -1, 1, xk);
    plot(x, P);
    hold on;
end
legend('n=3', 'n=4', 'n=5', 'n=6', 'n=7', 'n=8', 'n=9', 'n=10', 'n=20', 'n=100');

%% Part 2.2
f = @(x) x.^5-x.^2+x
n = [3, 4, 5, 6, 7, 8, 9, 10];
x = linspace(-1, 1, 201);
y = f(x);
figure(6);
plot(x, y);
hold on;
for i = 1:length(n)
     xi = linspace(-1, 1, n(i)+1);
     P = Lagrange(x, f, -1, 1, xi);
     plot(x, P);
     hold on;
 end
legend('f', 'n=3', 'n=4', 'n=5', 'n=6', 'n=7', 'n=8', 'n=9', 'n=10');   


figure(7);
for i = 1:length(n)
    xk = [];
    for j = 1:n(i)
        xk(j) = cos((2*j-1)*pi/(2*n(i)));
    end
    P = Lagrange(x, f, -1, 1, xi);
    plot(xk, yk);
    hold on;
end
legend('n=3', 'n=4', 'n=5', 'n=6', 'n=7', 'n=8', 'n=9', 'n=10');
