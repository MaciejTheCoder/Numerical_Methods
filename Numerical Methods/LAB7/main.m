%--------------------------------
% Maciej Majewski, 184945 - main function
%--------------------------------

clear 
clc
close all

load P_ref;;
time=[];
x = linspace(0,20,100);
F = density_function(x);


%Midpoint method
m=[];
err1=[];

for i=5:50:10000
    m(length(m)+1) = midpoint_method(@density_function,i);
    err1(length(err1)+1) = abs(P_ref - m(length(m)));
end
tic;
midpoint_method(@density_function,10^7);
toc;
time(1)=toc;

figure(1)
loglog(5:50:10000, err1)
hold on
title('Midpoint method')
saveas(gcf,'184945_Maciej_Majewski_midpoint_method.png');


%Trapezoidal method
t=[];
err2=[];

for i=5:50:10000
   t(length(t)+1) = trapezoidal_method(@density_function,i);
   err2(length(err2)+1) = abs(P_ref - t(length(t)));
end
tic;
trapezoidal_method(@density_function,10^7);
toc;
time(2)=toc;

figure(2)
loglog(5:50:10000, err2)
hold on
title('Trapezoidal method')
saveas(gcf,'184945_Maciej_Majewski_trapezoidal_method.png');


%Simpson method
s=[];
err3=[];

for i=5:50:10000
  s(length(s)+1) = simpson_method(@density_function,i);
  err3(length(err3)+1) = abs(P_ref - s(length(s)));
end
tic;
simpson_method(@density_function,10^7);
toc;
time(3)=toc;

figure(3)
loglog(5:50:10000, err3)
hold on
title('Simpson method')
saveas(gcf,'184945_Maciej_Majewski_simpson_method.png');


%Monte Carlo method
mc=[];
err4=[];

for i=5:50:10000
  mc(length(mc)+1) = monte_carlo_method(@density_function,i);
  err4(length(err4)+1) = abs(P_ref - mc(length(mc)));
end
tic;
monte_carlo_method(@density_function,10^7);
toc;
time(4)=toc;

figure(4)
loglog(5:50:10000, err4)
hold on
title('Monte Carlo method')
saveas(gcf,'184945_Maciej_Majewski_monte_carlo_method.png');


%Execution time of individual algorithms (plot type: bar ) for N = 107
figure(5)
bar(time)
ylabel('time')
xlabel('methods')
saveas(gcf,'184945_Maciej_Majewski_times.png')










