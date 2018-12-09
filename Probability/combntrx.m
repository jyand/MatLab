% John DeSalvo
% Elevator Odds

%% Part 0: Parameters
ELEV = []; %an array repersenting an elevator with the capacity for 10 people
N = 1000; %the number of trials to simulate randomness
k = 10; %the number of people per elevator
count = 0; %an accumulator variable that increments to count the number of 
%times floors other than the 5th floor are reached
n_tot = 300; %the total number of people in the building
n_flr = 60; %the total number of people per floor

%% Part 1: Random Draws
% In this part of the lab, a Monte Carlo Simulation is created where each
% trial corresponds to an elevator holding ten people where every person
% has a destination that is any floor from the first trhough the fifth.
% Each elevator ride is represented by a vector holding ten random integers
% from 1 to 5, each of which represent a passenger's destination floor. In
% this case, 1000 trials are simulated and the number of elevator rides not
% containing a fifth floor destination is counted to provide an estimation
% for the probability that any given elevator ride will not have the fifth
% floor as its destination.
for i = 1:N
    hit = 1; %a boolean whose value is true if an elevator excludes the fifth floor
    for j = 1:k
        ELEV(j) = randi([1 5]); %populate the elevator with random variables
        if (ELEV(j) == 5)
            hit = 0; %false if the elevator does not exclude the fifth floor
        end
    end
    if (hit == 1)
        count = count + 1; %increments the counter if an elevator excludes the fifth floor
    end
end
Q_nofifth = count/N %ratio of elevators that exclude the fifth floor to the total number of elevators

%% Part 2: Combinatorics
% In this part, rather than simulating randomness based on pseudo-random
% algorithms built in to the MATLAB framework, the probability that any 
% given elevator ride will not have the fifth floor as its destination is
% calculated analytically using the binomial formula.
% Probability of no 5th floor workers on the elevator at a given time:
P_1 = (nchoosek((n_tot - n_flr), k)*nchoosek(n_flr, 0))/nchoosek(n_tot, k)

%% Question 1
% Comparing the result of the Monte Carlo simulation in Part 1: $P = 0.1040$ 
% with the result of "nchoosek" in Part 2: $P = 1.033$  gives a difference
% of $0.007$ , suggesting that the results are qualitatively similar.

%% Question 2
%  
% 
% $$P_{1} \cap ... \cap P_{n} = \prod_{i=1}^{n} P_{i}$$
% 
% Since all floors have the same number of workers, the probabilities of
% each floor being exluded are the same. Using the general conjunction rule
% for independent probabilities, the probability of no 5th floor workers AND 
% no 4th floor workers on the elevator at a given time is the square of
% either of those probabilities.
P_2 = P_1^2

%% Question 3
%
% 
% $$C(n, r) = \frac{n!}{(n-r)!r!}$$
% 
n = 5; %total number of floors
%A probability vector where each ith entry is the probability that i floors
%are excluded
P = [];
%A vector where each ith entry is the number of combinations of i floors
%being exlcuded
C = [];
for r = 1:4 %we consider r from 1 to 4 since we can't index vectors with 0
    P(r) = P_1^r; %The probability of 
    C(r) = factorial(n)/(factorial(r)*factorial(n-r));
end
%the proability of no floors being excluded
%take the dot product since there is a proability associated with each
%combination
%then subtract that from one since this probability is the complement
%of the sum of other proabilities
P(5) = 1 - dot(P, C) ;
%The number of combinations of no floors being excluded is 1
C(5) = 1 ;
disp(P) %displaying the final vectors
disp(C)
P_tot = dot(P, C) %verify that the sum of all proabilities = 1

%weighted avergage for expected travel time
E = [0.2, 0.4, 0.6, 0.8, 1] %time reductions for i number of floors excluded
avg = dot(E, P.*C)/length(E)%average time reduction based on corresponding probabilities

% As a result, the expected travel time is less than 90% of that assuing
% that the elevator will visit every floor