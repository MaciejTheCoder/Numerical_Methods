function [F] = density_function(t)
delta=3;
u=10;
F=(1/(delta*(sqrt(2*pi))))*exp(-((t-u).^2)/(2*delta.^2));
end
