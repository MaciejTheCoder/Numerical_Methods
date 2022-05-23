%--------------------------------
% Maciej Majewski, 184945 - midpoint method
%--------------------------------

function[m] = midpoint_method(f,n)
m=0;
delta=(5)/n;
x=linspace(0,5,n+1);
x(1)=0;
for i=1:n
    if (i~=1)
     x(i)=x(i-1) + delta;
    end
    a = (x(i) + x(i+1))/2;
    m = m + delta.*f(a);
end
end