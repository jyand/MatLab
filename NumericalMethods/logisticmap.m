%% John DeSalvo
%Discrete-time Dynamical Systems pt. 2

%% Parameters
r = [1.5, 3.2, 4]; %array of r values to be indexed by the outer for loop
x_0 = 0.1; %initial x value
N = 100; %fixed size for the vector x[n]
array_x = []; %initialized array for x[n]
x = 0:0.001:1; %fixed vector for the function x, between 0 and 1

%% Implementing the Logisitc Map
% When plotting the cobweb diagram for the discrete-time dynamical system
% $x_{n+1} = rx_{n}(1-x_{n})$ , the vector 'array_x' holds discrete values 
% for each x[n].This is used in potting the cobweb diagrams. Another vector 
% 'x' holds values separated by fixed intervals between 0 and 1 so that 
% f(x) = x and f(x) = rx(1-x) can simulate continuous funcitons.

%Outer for loop to plot the logisitc map with three different r values
for i = 1:3
    %setting the first entry in the x[n] vector to the chosen initial x
    %value
    array_x(1) = x_0;
    %the first inner for loop where the x[n] vector is populated with
    %values as decribed by the recurrence relation defined at the top of 
    %this section
    for j = 2:N
        %implmenting the recurrence relation
        array_x(j) = r(i)*array_x(j-1)*(1-array_x(j-1));
    end
    %initializing a figure window for each different value of r
    figure(i);
    %plotting a straight line y = x
    plot(x, x);
    %setting the plot hold value to 'true' to overlay plots
    hold on;
    %plotting the function y = rx(1-x)
    plot(x, r(i).*x.*(1-x));
    %again, setting the plot hold value to 'true' to overlay plots
    hold on;
    %the second inner for loop plots the cobweb diagram using values from
    %the x[n] vector
    for k = 2:N
        legend('off');
       %plots a vertical line from point (x[n], x[n]) to point (x[n],
       %x[n+1]) for each n value
       plot([array_x(k-1) array_x(k-1)], [array_x(k-1) array_x(k)]);
       %plots a horizontal line from point (x[n], x[n+1]) to point (x[n+1],
       %x[n+1]) for each n value
       plot([array_x(k-1) array_x(k)], [array_x(k) array_x(k)]); 
    end
    %a sequence of if statements to set the plot title to the corresponding
    %r value
    if i==1
        title('r = 1.5');
    elseif i==2
        title('r = 3.2');
    else
        title('r = 4');
    end
    legend('x', 'rx(1-x)');
    xlabel('x');
end