function z = ODEprint(fmt, header, t, y, yt)
   err = [];
   fprintf('%s \n', header);
    for i = 1:length(t)
        err(i) = abs(yt(i) - y(i));
        if mod(i, 10) == 0
            fprintf(cat(2, '%4.0f', fmt, fmt, fmt, fmt), i-1, t(i), y(i), yt(i), err(i));
            fprintf('\n');
        end
    end
    plot(t, y, t, yt);
    legend('w(t)', 'y(t)');
end
