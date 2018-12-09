iterations = 500

x = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]
yideal = [0; 0; 1; 0; 1; 1; 0; 1]
w = ones(8, 3)
w0 = 1

for i = 1:iterations
	%R = rand
    ycalc = zeros(8, 1)
    for k = 1:8
       ycalc(k) = u(w(k, 1)*x(k, 1) + w(k, 2)*x(k, 2) + w(k, 3)*x(k, 3) - w0)
       error = yideal(k) - ycalc(k)
       w(k, 1) = w(k, 1) + x(k, 1)*error'
       w(k, 2) = w(k, 2) + x(k, 2)*error'
       w(k, 3) = w(k, 3) + x(k, 3)*error'
    end
end
