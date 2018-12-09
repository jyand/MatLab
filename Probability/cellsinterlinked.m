%% John DeSalvo
%

n = 10;
A = randi(2, n, n);

%initial state
figure(1)
colormap lines
image(A)

%stepping stone
figure(2)
colormap lines
N = 10000;
for k = 1:N
    %choose a random cell
    i = randi([1 n]);
    j = randi([1 n]);
    S = A(i, j);
    %choose a random cell adjacent to the first selected cell
    ii = randi([i-1 i+1]);
    jj = randi([j-1 j+1]);
    %the matrix is "spherical"
    switch ii
        case 0
	    ii = n
	case n
	    ii = n + 1;
	otherwise
	    ii = ii;
    end
    switch jj
	case 0
	    jj = n;
	case n + 1;
	    jj = 1;
	otherwise
	    jj = jj;
    end
    %the adjacent cell takes on the value of the first selected cell
    A(ii, jj) = S;
    hold on
    image(A)
end
