%There are n light bulbs in a room and the same 
%number of people outside the room. Each bulb has 
%its own switch and is currently switched off. 
%People come in one by one, and the i-th person, 
%1 ? i ? n flips switches that are divisible by i. 
%In particular, the first person switches every bulb. 
%How many of the light bulbs are illuminated after
%the last person has passes through the room?

clear all

n = 100

switches = zeros(1, n)

for i = 1:n
    for j = 1:n
        if( mod(j, i)==0)
            if(switches(j) == 0)
                switches(j) = 1
            else
                switches(j) = 0
            end
        end
    end
end
            
switches