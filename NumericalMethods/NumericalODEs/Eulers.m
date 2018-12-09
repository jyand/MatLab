function [t, y] = Eulers(dy, a, b, y0, h)
    y(1,:) = y0;
    t(1) = a;
    n = (b-a)/h;
    for i = 1:n
        t(i+1) = t(i)+h;
        y(i+1, :) = y(i, :) + h*dy(t(i), y(i, :));
    end
end