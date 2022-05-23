clc
clear all
close all


load wig20

MACDvec = zeros(1,1000);
signvec = zeros(1,1000);


for i = 27:1000 %Function starts 27th day
MACDvec(i) = myEMA((WIG20)', 12, i) - myEMA((WIG20)', 26, i);    %MACD = EMA12 − EMA26 
end

for i = 27:length(MACDvec) %Function starts 27th day and ends based on MACD
signvec(i) = myEMA (MACDvec, 9, i);  %SIGNAL = EMA9 is computed based on MACD plot.   
end
%I started from 27 and I think it works ok
figure(1) = "1000 sessions of WIG20 analyzed using MACD (12/26)"
plot(1:1000, WIG20, 'k')
hold on
xlabel("SESSIONS")
ylabel("POINTS")
plot(1:1000, (MACDvec+1800), 'r')
plot(1:1000, (signvec+1800) , 'b')
legend ("WIG20", "MACD", "SIGNAL")




