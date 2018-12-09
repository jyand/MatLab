%% John DeSalvo

%% Problem 1

%Number of trials
N = 1000;
%Array containing the actual trials or events
trials = [];
%variable to keep a count of the number times that the worker gets out in less than 8 hours
lt8Count = 0;
%variable to keep a count of the number times that the worker gets out in more than 20 hours
gt20Count = 0;
%for loop iterates though N trials
for i = 1:N
    %initialization of the array whose entries represent nodes in a Markov chain
    randPaths = [];
    %the worker starts at "point 1"
    randPaths(1) = 1;
    %initialize an incrementer for the while loop
    j = 2;
    %while loop terminates when the worker reaches the exit (point 3)
    while(randPaths(j-1) ~=3)
	% at point one, the worker is able to go to any of the point
        if(randPaths(j-1) == 1)
            randPaths(j) = randi([1 3]);
	% at point two, there are only paths going to points one and two
        else
            randPaths(j) = randi([1 2]);
	% obivously, the conditions at point three are not included since that is the exit
        end
	%keeps track of the number of iterations so we know how many "hours" it takes the worker to find the exit for each trails, i.e. every iteration represents one hour
        j = j + 1;
    end
    % Each entry in the 'trials' array is the number of hours or iterations it takes
    trials(i) = j;
    %the accumulator for the number of times the worker gets out in less than 8 hours increments when appropriate
    if(j < 9)
        lt8Count = lt8Count + 1;
    end
    %the accumulator for the number of times the worker gets out in more than 20 hours increments when appropriate
    if(j > 19)
        gt20Count = gt20Count + 1;
    end
        
end
%Answering question 1, this is the expected number of hours a worker will spend trying to escape, using the average of all trials.
avg = sum(trials)/length(trials)
%Answering question 2, this is the probability that a worker will get out in 8 hours or less
lt8 = lt8Count/length(trials)
%Answering question 3, this is the probability that the worker will take more than 20 hours to escape
gt20 = gt20Count/length(trials)
%For the two above calculations, the probability is determined by simply dividing the count by the number of trials

%% Problem 2
% For the section we have the the tranisition matrix that describes the Markov chain that is simulated via Monte Carlo in the previous section.
P = [1/3, 1/3, 1/3;
    1/2, 1/2, 0;
    0, 0, 0]
% Computing the 100th power of the transition matrix shows the probabilities of going from node i to node j in the Markov Chain, represented by each entry ij, in 100 steps.
% We see that all of these probabilities are less than 10^-8
P^100
