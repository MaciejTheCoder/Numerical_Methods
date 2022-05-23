%--------------------------------
% Maciej Majewski, 184945 - simpson method
%--------------------------------

function[s] = simpson_method(f,n)
s=0;
dx=(5)/n;
x=linspace(0,5,n+1);
for i=1:(length(x)-1)
s=s + (f(x(i)) + 4*f((x(i+1) + x(i))/2) + f(x(i+1)));
end
s=dx*(1/6)*s;
end
