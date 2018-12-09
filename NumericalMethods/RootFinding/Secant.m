
function sec = Secant(f, x0, x1, TOL, N)
    x = [];
    x(1) = x0;
    x(2) = x1;
    i = 2;
    while(abs(x(i) - x(i-1)) > TOL && i <= N)
        i = i + 1;
        x(i) = x(i-1) - (f(x(i-1))*(x(i-1)-x(i-2)))/(f(x(i-1)) - f(x(i-2)));
    end
    sec = x(i)
    i
    err = abs(x(i) - x(i-1))
end