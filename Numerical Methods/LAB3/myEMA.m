function EMA = myEMA(data_vec, N, i)

ALFA = 2/(N+1); %N is number of sessions in funtion EMA

num = sum(data_vec(i:-1:i-N).*( 1 - ALFA ).^[0:1:N]);
den = sum(( 1 - ALFA ).^[0:1:N]);
EMA = num/den;

end