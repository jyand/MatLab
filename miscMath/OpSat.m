function y = OpSat(x)
    A = ones(3, 9)
    B = zeros(9)
    for k = 1:9
        A(;, k) = k
    end
    for i = 1:9
        while(B(i) ~= x)
            if(B(i)<x)
                
            end
        end 
    end
end