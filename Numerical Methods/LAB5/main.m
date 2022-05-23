%--------------------------------
% Maciej Majewski, 184945 - main function
%--------------------------------

%I did tasks 1 and 2. 

clc
clear all
close all

a = 0;   
b = 50;

figure(1)
[xvect, xdif, fx, it_cnt] = bisect(a,b,1e-12,@compute_impedance);
plot(1:it_cnt, xvect, 'r')
hold on
[xvect, xdif, fx, it_cnt] = secant(a,b,1e-12,@compute_impedance);
plot(1:it_cnt, xvect, 'b');
title('impedance')
ylabel('x');
xlabel('iterations');
hold off
saveas(gcf,'184945_Maciej_Majewski_impedance_1.png');

figure(2)
[xvect, xdif, fx, it_cnt] = bisect(a, b,1e-12,@compute_velocity);
plot(1:it_cnt, xvect, 'r');
hold on
[xvect, xdif, fx, it_cnt] = secant(a, b,1e-12,@compute_velocity);
plot(1:it_cnt, xvect, 'b');
title('velocity')
ylabel('x');
xlabel('iterations');
hold off
saveas(gcf,'184945_Maciej_Majewski_velocity_1.png');

figure(3)
[xvect, xdif, fx, it_cnt] = bisect(a,b,1e-12,@compute_impedance);
semilogy(1:it_cnt, xdif, 'r');
hold on
[xvect, xdif, fx, it_cnt] = secant(a,b,1e-12,@compute_impedance);
semilogy(1:it_cnt, xdif, 'b');
title('impedance')
ylabel('difference between xi and xi−1');
xlabel('iterations');
hold off
saveas(gcf,'184945_Maciej_Majewski_impedance_2.png');


figure(4)
[xvect, xdif, fx, it_cnt] = bisect(a, b,1e-12,@compute_velocity);
semilogy(1:it_cnt, xdif, 'r');
hold on
[xvect, xdif, fx, it_cnt] = secant(a, b,1e-12,@compute_velocity);
semilogy(1:it_cnt, xdif, 'b');
title('velocity')
ylabel('difference between xi and xi−1');
xlabel('iterations');
hold off
saveas(gcf,'184945_Maciej_Majewski_velocity_2.png');

clc
