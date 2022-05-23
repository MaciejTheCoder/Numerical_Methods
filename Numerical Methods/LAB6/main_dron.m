%--------------------------------
% Maciej Majewski, 184945
%--------------------------------

clc
clear all
close all

warning('off','all')

load trajectory1
N = 50;
[ poly_coeff, xa ] = polynomial_approx(n,x,N);  % approximation 'x'.
[ poly_coeff, ya ] = polynomial_approx(n,y,N);  % approximation 'y'.
[ poly_coeff, za ] = polynomial_approx(n,z,N);  % approximation 'z'.

% task number 2
plot3(x,y,z,'o')
grid on
axis equal
hold on
plot3(xa,ya,za,'LineWidth',4)
title('Approximation of the dron position')
xlabel('x')
ylabel('y')
zlabel('z')
saveas(gcf,'184945_Maciej_Majewski_task2','png') % saving plot as png

%task number 3
load trajectory2
N = 50;
[ poly_coeff, xa ] = polynomial_approx(n,x,N);  % approximation 'x'.
[ poly_coeff, ya ] = polynomial_approx(n,y,N);  % approximation 'y'.
[ poly_coeff, za ] = polynomial_approx(n,z,N);  % approximation 'z'.

figure(2)
plot3(x,y,z,'o')
grid on
axis equal
hold on
plot3(xa,ya,za,'LineWidth',4)
title('Other approximation of the dron position(n=50)')
xlabel('x')
ylabel('y')
zlabel('z')
saveas(gcf,'184945_Maciej_Majewski_task3','png') % saving plot as png

%i did same plot for N=60 to see what will happen 
N = 60;
[ poly_coeff, xa ] = polynomial_approx(n,x,N);  % approximation 'x'.
[ poly_coeff, ya ] = polynomial_approx(n,y,N);  % approximation 'y'.
[ poly_coeff, za ] = polynomial_approx(n,z,N);  % approximation 'z'.

figure(3)
plot3(x,y,z,'o')
grid on
axis equal
hold on
plot3(xa,ya,za,'LineWidth',4)
title('Other approximation of the dron position (N=60)')
xlabel('x')
ylabel('y')
zlabel('z')
saveas(gcf,'184945_Maciej_Majewski_task3additional','png') % saving plot as png

%task number 4
%I used trajectory2 to this exercise 
%This effect is Runge's phenomenon, 
%We see that after N=45 error level is increasing really fast
for N = 1:71
[ poly_coeff, xa ] = polynomial_approx(n,x,N);  % approximation 'x'.
[ poly_coeff, ya ] = polynomial_approx(n,y,N);  % approximation 'y'.
[ poly_coeff, za ] = polynomial_approx(n,z,N);  % approximation 'z'.
M = length(x);
errx = (sum((x-xa).^2))^(1/2)/M;
M = length(y);
erry = (sum((y-ya).^2))^(1/2)/M;
M = length(z);
errz = (sum((z-za).^2))^(1/2)/M;
err(N)= errx+erry+errz;
end

figure(4)
semilogy(err);
title('Error plot (polynomal appoximation) for N from 1 to 71')
xlabel('N')
ylabel('err')
saveas(gcf,'184945_Maciej_Majewski_task4','png') % saving plot as png

%task number 5 for trajectory1
load trajectory1
N = 50;
[ xa ] = aprox_tryg(N,n,x); 
[ ya ] = aprox_tryg(N,n,y);
[ za ] = aprox_tryg(N,n,z);

figure(5)
plot3(x,y,z,'o')
hold on
grid on
axis equal
plot3(xa,ya,za,'LineWidth',4)
title('Approximation of trajectory 1 using trigonometric functions')
xlabel('x')
ylabel('y')
zlabel('z')
saveas(gcf,'184945_Maciej_Majewski_task5-1','png') % saving plot as png

%task number 6 for trajectory1,
%It didn't work

% for N = 1:71
% [ xa ] = aprox_tryg(N,n,x); 
% [ ya ] = aprox_tryg(N,n,y);
% [ za ] = aprox_tryg(N,n,z);
% M = length(x);
% errx = (sum((x-xa').^2))^(1/2)/M;
% M = length(y);
% erry = (sum((y-ya').^2))^(1/2)/M;
% M = length(z);
% errz = (sum((z-za').^2))^(1/2)/M;
% err(N)= errx+erry+errz;
% end
% 
% figure(6)
% semilogy(err);
% title('Error plot (trigonometry appoximation) for N from 1 to 71')
% xlabel('N')
% ylabel('err')
saveas(gcf,'184945_Maciej_Majewski_task6-1','png') % saving plot as png

%task number 5 for trajectory2
load trajectory2 
N = 50;
[ xa ] = aprox_tryg(N,n,x); 
[ ya ] = aprox_tryg(N,n,y);
[ za ] = aprox_tryg(N,n,z);

figure(7)
plot3(x,y,z,'o')
hold on
grid on
axis equal
plot3(xa,ya,za,'LineWidth',4)
title('Approximation of trajectory 2 using trigonometric functions')
xlabel('x')
ylabel('y')
zlabel('z')
saveas(gcf,'184945_Maciej_Majewski_task5-2','png') % saving plot as png

% %task number 6 for trajectory2
for N = 1:71
[ xa ] = aprox_tryg(N,n,x); 
[ ya ] = aprox_tryg(N,n,y);
[ za ] = aprox_tryg(N,n,z);
M = length(x);
errx = (sum((x-xa').^2))^(1/2)/M;
M = length(y);
erry = (sum((y-ya').^2))^(1/2)/M;
M = length(z);
errz = (sum((z-za').^2))^(1/2)/M;
err(N)= errx+erry+errz;
end

figure(8)
semilogy(err);
title('Error plot (trigonometry appoximation) for N from 1 to 71')
xlabel('N')
ylabel('err')
saveas(gcf,'184945_Maciej_Majewski_task6-2','png') % saving plot as png
