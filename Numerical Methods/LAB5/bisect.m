%--------------------------------
% Maciej Majewski, 184945
%--------------------------------

function [xvect, xdif, fx, it_cnt] = bisect(a,b,eps,fun)

for i = 1:1000       
      c = (a + b)/2; % bisection algorithm 
      if(abs(feval(fun,c)) <= eps && abs(b - a) <= eps)         
        break;
      elseif((feval(fun,a) * feval(fun,c)) < 0)
        b = c;
      else
        a = c;
      end
        xvect(i) = c;
      if (i>1)
        xdif(i) = abs(xvect(i-1) - c);
      else
        xdif(i) = c;
      end   
    fx = feval(fun, c);
end
it_cnt = i - 1;
end
