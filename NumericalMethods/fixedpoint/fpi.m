function r = fpi(g, x0, TOL, N)
    x = [];
    x(1) = x0;
    i = 2;
    x(2) = g(x0);
    while(abs(x(i) - x(i-1)) > TOL && i <= N)
        i = i + 1;
        x(i) = g(x(i-1));
    end
    r = x(i);
    i
    r
end