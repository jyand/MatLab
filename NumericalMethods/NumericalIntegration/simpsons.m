function S = simpsons(f, a, b, m)
    h = (b-a)/(2*m);
    j = 0:2*m;
    x = [];
    sum = 0;
    summ = 0;
    for i = 1:2*m+1
        x(i) = a + h*j(i);
    end
    for i = 1:m
        sum = sum + f(x(2*i-1));
    end
    for i = 1:m-1
        summ = summ + f(x(2*i));
    end
    S = (h/3)*(f(a) + f(b) + 4*sum + 2*summ);
end