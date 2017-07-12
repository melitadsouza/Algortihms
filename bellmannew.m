fprintf('\n*******Input for Erdos Renyi********');
n = input('\nEnter number of nodes: ');
p  = input('\nEnter probability: ');
deg = input('\nInitial node degree of for regular graph (use 1 or even numbers): ');

er_renyi = erdosRenyi(n, p, deg);
random_matrix = randint(n, n, [1 10]);
m = times(er_renyi, random_matrix);

tic; %Start timer
k=1;

for i=1:n
    for j=1:n
        if m(i,j) ~= 0
            edge(k,1) = i ;
            edge(k,2) = j;
            k = k+1;
        end
    end
end

d(1)= 0;
for i=2:n
 d(i)=999;
end

for i=1:n
    for j=1:k -1
        if (d(edge(j,2)) > d(edge(j,1))+m(edge(j,1),(edge(j,2))))
            d(edge(j,2)) = d(edge(j,1))+m(edge(j,1),(edge(j,2)));
            lastlabel(edge(j,2)) =edge(j,1);
        end
    end
end

fprintf('\n Vertex(Destination) = [ Predecessor Node]\n')
for i=1:n
    fprintf(' Vertex( %d ) = [ %d ] \n ',i,d(i));
end
toc; %Stop timer 
