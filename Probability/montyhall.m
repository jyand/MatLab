%% John DeSalvo
% The Monty Hall Problem

%% Part 1
% In this part of the lab, the Monty Hall problem is simulated. Behind one
% out of three doors there is a car and behind the other two there are
% goats. For 1,000 trials, a door is selected at random. Before the prize
% behind the door is revealed, one of the doors with the goat is revealed
% and there is the option to switch to the remaining door or stick with the
% original choice. The consequences of both of these options are evaluated
% and the results are consistent with the analysis that the choice of
% swapping after one of the doors with a goat is revealed effectively
% changes the probability of picking the car from 1/3 to 1 - 1/3 = 2/3.
N = 1000; %1,000 trials
%a fixed array of strings represting the contents behind the doors
doors = ["goat", "car", "goat"];
%initialization of the array of random selections
randDoors = [];
%the entire simulation is done 5 times, just because there are some
%small error deviations, since we are only doing 1,000 trials
for n = 1:5
    stayCount = 0; %number of times staying results in car being chosen
    swapCount = 0; %number of times swapping results in the car being chosen
    for i = 1:N
        %the array is populated with either 1, 2, or 3 at random
        randDoors(i) = randi([1 3]);
        %if the initial door chosen had the car behind it, swapping would
        %result in a goat, and staying would succesgul attain the car
        if(randDoors(i) == 2)
            stay = "car";
            swap = "goat";
            stayCount = stayCount + 1; %increment stayCount
        %if the initial dor chosen has the goat behind it, swapping would
        %result in the car since the other door with the goat is revealed
        else
            stay = "goat";
            swap = "car";
            swapCount = swapCount + 1; %increment swapCount
        end
    end
    %the number of times staying results in the car out of all the trials
    %approximates 1/3
    staySuccess = stayCount/N
    %the number of times swapping results in the car out of all the trials
    %approximates 2/3
    swapSuccess = swapCount/N
end

%% Part 2
% This part is exactly like the previous part with one caveat. In this case,
% there are five doors in total and since three doors with goats behind them
% are revealed before the decision to swap or stay is made, the simulation
% similarly shows that this effectively switches the probability from 1/5 to
% 1 - 1/5 = 4/5.
doors = ["goat", "goat", "car", "goat", "goat"];
randDoors = [];
for n = 1:5
    stayCount = 0;
    swapCount = 0;
    for i = 1:N
        randDoors(i) = randi([1 5]);
        if(randDoors(i) == 3)
            stay = "car";
            swap = "goat";
            stayCount = stayCount + 1;
        else
            stay = "goat";
            swap = "car";
            swapCount = swapCount + 1;
        end
    end
    %approximates 1/5
    staySuccess = stayCount/N
    %apprixmates 4/5
    swapSuccess = swapCount/N
end
