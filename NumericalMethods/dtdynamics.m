%% John DeSalvo
% Discrete-time Dynamical Systems

%% 1)
%Array containing each day when paramecium population is measured
day = 1:24; 
%The mean density of paramecium for each day, read from the second column
%of a csv file containing the initial data
Pdata = csvread('paramecium.csv', 0, 1);

%% 2)
N = 525 %Chosen as the estimated convergent value for the function
%Creates an array of 'deltas' for Pdata where  each nth entry is 
%Pdata(n+1) - Pdata(n)
deltaPdata = diff(Pdata);
%An array is created to models the 'deltas' differently from calculating
%the difference between adjacent enetries.
%In this model, each nth entry is the nth Pdata entry multiplied by the
%difference between the chosen N value and that nth Pdata entry
deltaPmodel = []; 
for i = 1:23
    deltaPmodel(i) = Pdata(i)*(N - Pdata(i));
end
%Takes the transpose of deltaPmodel and solves the system of linear
%equations for deltaPmodel'*k = deltaPdata by using the '\' operator
k = deltaPmodel'\deltaPdata

%% 3)
figure(2) %Initializes the second window for plotting
%plots the deltaPdata against the a priori model while specifying the
%points as black circles 
plot(deltaPmodel, deltaPdata, 'o', 'MarkerFaceColor', 'k');
title('Population Change Model vs. Population Change Data');
xlabel('Population Change Model');
ylabel('Population Change Data');
hold on; %'holds' the data so that plots can be overlayed
%Plots deltaPmodel against itself multiplies by k and specifies the function
%as a solid red line
plot(deltaPmodel, k*deltaPmodel, 'r', 'Linewidth', 2);
legend('Model vs. Data', 'Least Squares Fit');

%% 4)
%Creates a mathematical model of Pdata by adding to each nth entry the term 
%in the model for deltaP multiplied by the k value to create the (n+1)th
%entry
Pmodel = [];
Pmodel(1) = Pdata(1);
for i = 2:24
    Pmodel(i) = Pmodel(i-1) + k*Pmodel(i-1)*(N - Pmodel(i-1));
end
%Creates the first figure so that subsequent plots don't overwrite in the 
%same window
figure(1);
%Plots the mean population density of paramecium for each day
%Some strings are taken as additional arguments so that the data points are
%blue circles.
plot(day, Pdata, 'o', 'MarkerFaceColor', 'b');
title('Population Growth');
xlabel('days(n)');
ylabel('Mean Density of Paramecium');
%Overlays the function of the model for paramecium popluation density with 
%that of the data.Larger red circles are used for this function
hold on;
plot(day, Pmodel, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
legend('Data', 'Model');