%--------------------------------
% Maciej Majewski, 184945
%--------------------------------

clc % clear command window
clear all % clear the workspace
close all % close figure windows

% i dont use it 
% diary('diary_yourIndexNumber_lab3');

% Task A
% ----------------------------------
N = 10;
density = 3; 
Edges = generate_network(N, density); % use function generate_network to create table Edges


% Task B
% ----------------------------------
% create a function that returns tables A,B,I,b, and M (input: Edges)
% update the command below replacing 'taskB' with 'taskB_yourIndexNumber'
d = 0.85;
b = ones(N,1) * (1 - d)/N;
I = speye(N);
s=size(Edges,2);
B = sparse(Edges(2, :), Edges(1, :), ones(1,s));
L0 = full(sum(B));
A = sparse(1:N, 1:N, 1./L0);
M = I - d*B*A; 
save taskB_184945 A B I M b

% Task C
% ----------------------------------
% write a formula for the direct solution to Mr=b (see the instruction to Lab2 for details)
% update the command below replacing 'taskC' with 'taskC_yourIndexNumber'
r=M\b;
save taskC_184945 r

% Task D
% ----------------------------------
clc
clear all
close all

N = [500, 1000, 3000, 6000]; % i don't have enough RAM to use 12k
density=10;

for i = 1:length(N)
    tic
    Edges = generate_network(N(i), density);  % 1. Generate table Edges for N corresponding to the loop index
    d = 0.85; % 2. Generate tables A,B,I,b, and M
    b = ones(N(i),1) * (1 - d)/N(i);
    I = speye(N(i));
    s=size(Edges,2);
    B = sparse(Edges(2, :), Edges(1, :), ones(1,s));
    L0 = full(sum(B));
    A = sparse(1:N(i), 1:N(i), 1./L0);
    M = I - d*B*A;
    r=M\b; % 3. Formula for the direct solution to Mr=b 
    timeDirect(i) = toc;
end

figure(1)
plot(N, timeDirect)% plot computational time vs N (label both axes and add a title)
title("computational time in a function of N")
ylabel("time")
xlabel("Matrix of size N")
saveas(gcf,'taskD_184945','png') % update the command below replacing 'taskD' with 'taskD_yourIndexNumber'

figure(2)
semilogy(N, timeDirect)% plot computational time vs N using function semilogy (label both axes and add a title)
title("computational time in a function of N")
ylabel("time")
xlabel("Matrix of size N")
saveas(gcf,'taskD_semilog_184945','png')% update the command below replacing 'taskD_semilog' with 'taskD_semilog_yourIndexNumber'
%----------------------------------

% Repeat Task D using r = inv(M)*b instead of r = M\b. 
% To this end, consider only 4 cases: N = [500,1000,3000,6000]
clc
clear all
close all

N = [500, 1000];
density=10;

for i = 1:length(N)
    tic
    Edges = generate_network(N(i), density);  % 1. Generate table Edges for N corresponding to the loop index
    d = 0.85; % 2. Generate tables A,B,I,b, and M
    b = ones(N(i),1) * (1 - d)/N(i);
    I = speye(N(i));
    s=size(Edges,2);
    B = sparse(Edges(2, :), Edges(1, :), ones(1,s));
    L0 = full(sum(B));
    A = sparse(1:N(i), 1:N(i), 1./L0);
    M = I - d*B*A;
    r=M\b; % 3. Formula for the direct solution to Mr=b 
    timeDirect(i) = toc;
end

figure(3)
plot(N, timeDirect)% plot computational time vs N (label both axes and add a title)
title("computational time in a function of N")
ylabel("time")
xlabel("Matrix of size N")
saveas(gcf,'taskD2_184945','png') % update the command below replacing 'taskD' with 'taskD_yourIndexNumber'

figure(4)
semilogy(N, timeDirect)% plot computational time vs N using function semilogy (label both axes and add a title)
title("computational time in a function of N")
ylabel("time")
xlabel("Matrix of size N")
saveas(gcf,'taskD2_semilog_184945','png')% update the command below replacing 'taskD_semilog' with 'taskD_semilog_yourIndexNumber'
%----------------------------------


% Task E
%----------------------------------
clc
clear all
close all
% Jacobi

N = [500, 1000, 3000, 6000]; % i don't have enough RAM to use 12k
density=10;
eps=10^-10;
iterMax=10^3; %update this values if needed

for i=1:1:length(N)
    Edges = generate_network(N(i), density); % Generate Edges
    d = 0.85; % Generate tables A,B,I,b,M
    b = ones(N(i),1) * (1 - d)/N(i);
    I = speye(N(i));
    s=size(Edges,2);
    B = sparse(Edges(2, :), Edges(1, :), ones(1,s));
    L0 = full(sum(B));
    A = sparse(1:N(i), 1:N(i), 1./L0);
    M = I - d*B*A;
    L=tril(M,-1); % Generate the lower triangular part of matrix M using L=tril(M,-1);
    U=triu(M,1);  % Generate the upper triangular part of matrix M using U=triu(M,1);
    D=diag(diag(M));% Generate the the main diagonal of matrix M using D=diag(diag(M));
    r=ones(N(i),1);% Set the initial r vector using ones(N(i),1);
    tic
    fprintf('Executing Jacobi method for N=%i:\n',N(i));   
    for j=1:1:iterMax % Implement iterative Jacobi method here using 'j' and its index % Use parameter 'iterMax' to fix the maximum number of iterations
      r = -D\((L+U)*r -b); % Use the forward substitution instead of using explicit matrix inverse
      res = M*r - b; % Calculate residuum vector 'res' and its norm 'nres'
      nres(j) = norm(res);
      disp(nres(j)) % displays the current norm of 'res'
        if nres(j)<=eps % stop condition
            timeJacobi(i)=toc;
            iter(i)=j;
            nresAll(i)=nres(j);
            fprintf('Number of iterations for N=%i: %i\n',N(i),iter(i));
            break
        end
    end
end

figure(1)
plot(N, timeJacobi) % plot computational time (timeJacobi) vs N (label both axes and add a title) 
title("computational time in a function of N")
ylabel("time")
xlabel("Matrix of size N")
saveas(gcf,'taskE1_184945','png') % update the command below replacing 'taskE1' with 'taskE1_yourIndexNumber'

figure(2)
plot(N, iter)% plot number of iterations (iter) vs N (label both axes and add a title)
title("number of iterations in function of N")
ylabel("iterations")
xlabel("Matrix of size N")
saveas(gcf,'taskE2_184945','png')% update the command below replacing 'taskE2' with 'taskE2_yourIndexNumber'

figure(3)
semilogy(N, nresAll)% plot residdum vector norm (nresAll) vs N using function semilogy (label both axes and add a title) 
title("residuum norm for each of the iterations")
ylabel("residdum vector")
xlabel("Matrix of size N")
saveas(gcf,'taskE3_184945','png')% update the command below replacing 'taskE3' with 'taskE3_yourIndexNumber'

save taskE_184945 timeJacobi iter nresAll
% ----------------------------------

% Task F
% ----------------------------------
clc
clear all
close all
% Do the same as in Task G, but for Gauss-Seidel method

% Gauss-Seidel

N = [500, 1000, 3000, 6000]; % i don't have enough RAM to use 12k
density=10;
eps=10^-10;
iterMax=10^3;

% use variables: rGS, res, nres, timeGS, iter, nresAll
for i=1:1:length(N)
    Edges = generate_network(N(i), density);
    d = 0.85; 
    b = ones(N(i),1) * (1 - d)/N(i);
    I = speye(N(i));
    s=size(Edges,2);
    B = sparse(Edges(2, :), Edges(1, :), ones(1,s));
    L0 = full(sum(B));
    A = sparse(1:N(i), 1:N(i), 1./L0);
    M = I - d*B*A;
    L=tril(M,-1);
    U=triu(M,1);  
    D=diag(diag(M));
    r=ones(N(i),1);
    tic
    fprintf('Executing GAUSS-SEIDEL method for N=%i:\n',N(i));   
    for j=1:1:iterMax 
      r = -(D+L)\(U*r-b); 
      res = M*r - b; 
      nres(j) = norm(res);
      disp(nres(j)) 
        if nres(j)<=eps 
            timeGAUSSSEIDEL(i)=toc;
            iter(i)=j;
            nresAll(i)=nres(j);
            fprintf('Number of iterations for N=%i: %i\n',N(i),iter(i));
            break
        end
    end
end


figure(1)
plot(N, timeGAUSSSEIDEL)
title("computational time in a function of N")
ylabel("time")
xlabel("Matrix of size N")
saveas(gcf,'taskF1_184945','png') 

figure(2)
plot(N, iter)
title("number of iterations in function of N")
ylabel("iterations")
xlabel("Matrix of size N")
saveas(gcf,'taskF2_184945','png')

figure(3)
semilogy(N, nresAll)
title("residuum norm for each of the iterations")
ylabel("residdum vector")
xlabel("Matrix of size N")
saveas(gcf,'taskF3_184945','png')

save taskF_184945 timeGAUSSSEIDEL iter nresAll
% ----------------------------------
clc
clear all
close all
