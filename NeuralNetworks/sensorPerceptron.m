iterations = 500

%'1'
x1 = [0 0 0 1 1 0; 1 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 0 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0]
%'4'
x2 = [0 1 1 1 0 1; 1 1 1 1 0 1; 1 0 1 1 1 0; 1 0 1 1 1 0; 1 1 1 1 0 1; 1 1 1 1 0 1; 0 0 1 1 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 0 1 1 0; 0 0 1 1 1 0; 0 0 0 1 1 0]
%'7'
x3 = [1 1 0 0 1 0; 1 1 0 1 0 0; 1 1 0 1 0 0; 1 1 0 1 1 0; 1 1 0 0 1 0; 1 1 0 0 1 0; 0 0 0 1 0 0; 0 1 0 1 0 0; 0 1 0 1 1 0; 0 1 0 1 0 0; 0 1 0 0 1 0; 0 1 0 0 0 0]

w = rand(3, 6)
weightgraph = zeros(iterations, 3, 6)
bias = 2 
a = 0.02


for i = 1:iterations
    %'1'
    y = heaviside(x1(mod(i, 12)+1, :)*w.'-bias)
    error = [1 0 0] - y
    w(1, :) = w(1, :) + a*error(1)*x1(mod(i,12)+1, :).*rand(1, 6)
    w(2, :) = w(2, :) + a*error(2)*x1(mod(i,12)+1, :).*rand(1, 6)
    w(3, :) = w(3, :) + a*error(3)*x1(mod(i,12)+1, :).*rand(1, 6)
    
    %'4'
    y = heaviside(x2(mod(i, 12)+1, :)*w.'-bias)
    error = [0 1 0] - y
    w(1, :) = w(1, :) + a*error(1)*x2(mod(i,12)+1, :).*rand(1, 6)
    w(2, :) = w(2, :) + a*error(2)*x2(mod(i,12)+1, :).*rand(1, 6)
    w(3, :) = w(3, :) + a*error(3)*x2(mod(i,12)+1, :).*rand(1, 6)
    
    %'7'
    y = heaviside(x3(mod(i, 12)+1, :)*w.'-bias)
    error = [0 0 1] - y
    w(1, :) = w(1, :) + a*error(1)*x3(mod(i,12)+1, :).*rand(1, 6)
    w(2, :) = w(2, :) + a*error(2)*x3(mod(i,12)+1, :).*rand(1, 6)
    w(3, :) = w(3, :) + a*error(3)*x3(mod(i,12)+1, :).*rand(1, 6)
    
    weightgraph(i, :, :) = w(:, :)
end

plot(weightgraph(:, :, 1))
plot(weightgraph(:, :, 2))
plot(weightgraph(:, :, 3))
plot(weightgraph(:, :, 4))
plot(weightgraph(:, :, 5))
plot(weightgraph(:, :, 6))

totalError = 0

for i = 1:12
    %'1'
    y = heaviside(x1(mod(i, 12)+1, :)*w.'-bias)
    error = [1 0 0] - y
    totalError = totalError + sum(abs(error))
    
     %'4'
    y = heaviside(x2(mod(i, 12)+1, :)*w.'-bias)
    error = [0 1 0] - y
    totalError = totalError + sum(abs(error))
    
     %'7'
    y = heaviside(x3(mod(i, 12)+1, :)*w.'-bias)
    error = [0 0 1] - y
    totalError = totalError + sum(abs(error))
end
    
