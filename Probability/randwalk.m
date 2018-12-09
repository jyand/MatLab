%% John DeSalvo
% Random Walks

% We start off by populating a 1001 by 2 matrix with zeros as the default
% value. N is chosen to be 1001 as the length arbitrarily.
N = 1000;
A = zeros(N+1, 2);
% Leaving the first row as (0, 0) by default, the rest of the matrix is
% populated with random values. These values are determined by the random
% walk of the hypothetical drunkard. For each iteration, he moves one step
% in either the north, south, east, or west direction, away from his
% previous position.
for i = 2:N+1
    rando = randi([1 4]);
    % North 0, 1
    if(rando == 1)
        A(i, 2) = A(i-1, 2) + 1;
        A(i, 1) = A(i-1, 1);
    % South 0, -1
    elseif(rando == 2)
        A(i, 2) = A(i-1, 2) - 1;
        A(i, 1) = A(i-1, 1);
    % West -1, 0
    elseif(rando == 3)
        A(i, 1) = A(i-1, 1) - 1;
        A(i, 2) = A(i-1, 2);
    % East 0, 1
    else
        A(i, 1) = A(i-1, 1) + 1;
        A(i, 2) = A(i-1, 2);
    end
end

%% Problem 1
% N values are defined in an array to be easily iterated through, this is
% so we can analyze sub-matrices of the the matrix previously defined
N = [10, 20, 100];
% an array is initialized to hold the values for the distances for each N
% value
dist = [];
% iterating through the N array
for k = 1:length(N)
    % creating a new figure for each N value
    figure(k)
    % plotting smaller subsets of the random walk for each N value
    plot(A(1:N(k)+1, 1), A(1:N(k)+1, 2))
    hold on; % don't ket the next plot override
    % showing the point where the drunkard is for each N value
    plot(A(N(k)+1,1), A(N(k)+1, 2), 'r*')
    % computing the distance for the ultimate destination for each subset
    % of the random walk using the distance formula, which is just the
    % Euclidean norm in this case since we are measuring from the origin
    dist(k) = sqrt((A(N(k)+1, 1))^2 + (A(N(k)+1, 2))^2) ;
end
dist
%% Problem 2
% In this part of the lab, a Monte Carlo simulation is performed. 1,000
% different random matrices are generated with length of 101 rather than
% 1,001. The probability of either $|x|$ OR $|y|$ value being
% $\ge 10$ is approximated by adding the ratios of the counts of each to
% the total numer of trials.

% counter variables
xCount = 0;
yCount = 0;
% for loop that performs a Monte Carlo simulation of 1,000 trials
for k = 1:1000
    % This is the same exact subroutine that was previously used to
    % populate the matrix, the only difference is the number of rows
    N = 100;
    A = zeros(N+1, 2);
    for i = 2:N+1
        rando = randi([1 4]);
        % North 0, 1
        if(rando == 1)
            A(i, 2) = A(i-1, 2) + 1;
            A(i, 1) = A(i-1, 1);
        % South 0, -1
        elseif(rando == 2)
            A(i, 2) = A(i-1, 2) - 1;
            A(i, 1) = A(i-1, 1);
        % West -1, 0
        elseif(rando == 3)
            A(i, 1) = A(i-1, 1) - 1;
            A(i, 2) = A(i-1, 2);
        % East 0, 1
        else
            A(i, 1) = A(i-1, 1) + 1;
            A(i, 2) = A(i-1, 2);
        end
    end
    % The following statements allow either of the counter variables to
    % increment if the value is 10 or greater (we can use '>9' since all
    % values are integers)
    if(A(N+1,1) > 9)
        xCount = xCount + 1;
    end
    if(A(N+1, 2) >9)
        yCount = yCount + 1;
    end
end
xCount
yCount
% The probability of either the vertical or the horizontal poisiton being
% greater than 10
p = (xCount + yCount)/k