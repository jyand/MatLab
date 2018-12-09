function phi = RelPrime(n)

p = primes(n)
product = 1

for i = 1:length(p)
    if(mod(n, p(i))==0)
        product = product * (1 - (1/p(i)))
    end
end

phi = n * product

end

