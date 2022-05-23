



Edges = [1 4; 1 6; 2 3; 2 4; 2 5; 3 5; 3 6; 3 7; 4 5; 4 6; 5 4; 5 6; 6 4; 6 7; 7 6]'
n = max(max(Edges));
nr_of_links = size(Edges,2);
d = 0.85;

b  =ones(n,1) * (1-d)/n;
%I = eye(n);
%I = sparse(eye(n));
%I = sparse(1:n, 1:n, ones(1,n));
%I = sparse(1:n, 1:n, 1);
I = speye (n);
B = sparse(n,n);
for i = 1:nr_of_links
       B(Edges(2, i), Edges(1,i)) = 1;
end

B = sparse(Edges(2, :), Edges(2,:), ones(1,nr_of_links));

L = full(sum(B));
A = full(sparse(1:n, 1:n, 1./L))








