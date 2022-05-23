%--------------------------------
% Maciej Majewski, 184945
%--------------------------------

function [value] = compute_velocity(t)
  m0=150000; %kg
  q=2700; %kg/s
  u=2000; %m/s
  v=750; %m/s
  g=9.81; %m/s^2
  value = u * log(m0 / (m0-q*t )) - g*t -v;
end