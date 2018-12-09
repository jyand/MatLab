function bis =Bisect(f, a, b, TOL, N)
    i = 0;
    fa = f(a);
    fb = f(b);
    while (abs((b-a)/2) > TOL && i <= N)
        bis = (a + b)/2;
        fc = f(bis);
        if (fc == 0)
            break;
        end
        if (sign(fa)*sign(fc) < 0)
            b = bis;
            fb = fc;
        else
            a = bis;
            fa = fc;
        end
        i = i + 1;    
    end
    bis = (a + b)/2
    i
    err = abs((b-a)/2)
end
