iterations = 1000

x = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1]
yideal = [0; 0; 1; 0; 1; 1; 0; 1]
w = -1*2.*rand(3,1)
bias = -1

for i = 1:iterations
    ycalc = zeros(8, 1)
    for k = 1:8
        ycalc(k) = (exp(-1*(bias*w(1, 1) + x(k, 1)*w(2, 1) + x(k, 2)*w(3, 1))) + 1)^(-1)
        error = yideal(k) - ycalc(k)
        w(1, 1) = 0.7*bias*error + w(1, 1)
        w(2, 1) = 0.7*x(k, 1)*error + w(2, 1)
        w(3, 1) = 0.7*x(k, 2)*error + w(3, 1)
    end
end
