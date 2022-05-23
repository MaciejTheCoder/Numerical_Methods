%--------------------------------
% Maciej Majewski, 184945 - monte carlo method
%--------------------------------
function[mc] = monte_carlo_method(f,n)
maks=max(density_function(1:n))+ 1;
x=rand(1,n);
x=x*5; %a=0
y=rand(1,n)*maks;
S=5*maks;
N1=0;
fy = f(x);
for i = 1:n
 if(y(i)<fy(i))
 N1 = N1 + 1;
 end
end
mc = (N1/n*S);
end
