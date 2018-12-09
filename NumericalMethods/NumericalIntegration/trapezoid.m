function T = trapezoid(f, a, b, m)
    h = (b-a)/m;
    j = 0:m;
    x = [];
    sum = 0;
    for i = 1:m+1
        x(i) = a + h*j(i);
    end
    for i = 1:m-1
        sum = sum + f(x(i));
    end
    T = h*(0.5*(f(a) + f(b)) + sum);
end