%--------------------------------
% Maciej Majewski, 184945
%--------------------------------

function [value] = compute_impedance( omega )
    R=725; %Ohm
    C=0.00008; %F
    Z=75; %Ohm
    L=2; %H
    value = 1/(sqrt(1/R^2 + ( omega* C - 1/(omega*L) )^2 )) - Z;
end
