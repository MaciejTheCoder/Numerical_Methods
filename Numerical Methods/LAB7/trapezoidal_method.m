%--------------------------------
% Maciej Majewski, 184945 - trapezoidal method
%--------------------------------

function[t] = trapezoidal_method(f,n)
t=0;
delta=(5)/n;
x=linspace(0,5,n+1);
x(1)=0;
for i=1:n
    if (i~=1)
     x(i)=x(i-1) + delta;
    end
    a = (f(x(i)) + f(x(i+1)))/2;
    t = t + delta.*a;
end
end
