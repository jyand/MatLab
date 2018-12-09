function nwtn = Newtons(f, df, x0, TOL, N)
    x = [];
    x(1) = x0;
    i = 2;
    x(2) = f(x0);
    while(abs(x(i) - x(i-1)) > TOL && i <= N)
        i = i + 1;
        x(i) = x(i-1) - f(x(i-1))/df(x(i-1));
    end
    nwtn = x(i)
    i
    err = abs(x(i) - x(i-1))
end