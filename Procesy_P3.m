% Skrypt generuj¹cy obliczanie 
T3 = [0.005 0.01 0.02 0.05 0.1 0.2 0.5 2 5 10];



for i = 1:length(T3);
    syms s
    c = sym2poly((1+s)*(1+s*T3(i))*(1+s*T3(i)));
    G3(i) = tf(1,c);
    [T1_L2_Kp3(:,i) normaG3(i)]=identyfikacja(G3(i));
    G3_CC(i)=tf(T1_L2_Kp3(3,i),[T1_L2_Kp3(1,i) 1],'InputDelay',T1_L2_Kp3(2,i));
    regulator = Regulator_PI(T1_L2_Kp3(1,i),T1_L2_Kp3(2,i),T1_L2_Kp3(3,i));
    sys(i)= G3(i)*regulator;
   
    closed(i)=feedback(sys(i),1);
    figure();
    step(closed(i));

end

