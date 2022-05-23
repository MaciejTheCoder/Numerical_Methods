%--------------------------------
% Maciej Majewski, 184945
%--------------------------------

function [xvect, xdif, fx,it_cnt]=secant(a,b,eps, fun)
    
  f1 = feval(fun,a);
  f2 = feval(fun,b);
  i = 0;
for i = 1:1000  
     if((abs(f1-f2) <= eps) && (abs(a-b) <= eps))
        break;
     end
     xk = a-f1*(a-b)/(f1-f2);
     fk = feval(fun, xk);
     b = a;
     f2 = f1;
     a = xk;
     f1 = fk;
     i = i + 1;
     xvect(i) = xk;
     if (i>1)
        xdif(i) = abs(xvect(i-1) - xk);
     else
        xdif(i) = xk;
     end
end
fx = feval(fun, xk);
it_cnt = i;     
end