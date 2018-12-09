function rf = RegFalsi(f, a, b, TOL, N)
    i = 0;
    fa = f(a);
    fb = f(b);
    while (abs((b-a)/2) > TOL && i <= N)
        rf = (b*fa - a*fb)/(fa-fb);
        fc = f(rf);
        if (fc == 0)
            break;
        end
        if (sign(fa)*sign(fc) < 0)
            b = rf;
            fb = fc;
        else
            a = rf;
            fa = fc;
        end
        i = i + 1;    
    end
    rf = (b*fa - a*fb)/(fa-fb)
    i
    err = abs((b-a)/2)
end
