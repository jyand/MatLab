function [t, y] = RK4(dy, a, b, y0, h)
    v1 = [];
    v2 = [];
    v3 = [];
    v4 = [];
    y(1,:) = y0;
    t(1) = a;
    n = (b-a)/h;
    for i = 1:n
       t(i+1) = t(i) + h;
       v1(i) = dy(t(i), y(i, :));
       v2(i) = dy(t(i) + h/2, y(i) + h/2*v1(i));
       v3(i) = dy(t(i) + h/2, y(i) + h/2*v2(i));
       v4(i) = dy(t(i) + h, y(i) + h*v3(i));
       y(i+1, :) = y(i, :) + h/6*(v1(i) + 2*v2(i) + 2*v3(i) + v4(i));
    end
end