% Skrypt generuj¹cy obliczanie 
T2 = [0.01 0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500];



for i = 1:length(T2);
    G2(i) = tf(1,[T2(i) 1],'InputDelay',1);
    [T1_L2_Kp3(:,i) normaG2(i)]=identyfikacja(G2(i));
    G2_CC(i)=tf(T1_L2_Kp3(3,i),[T1_L2_Kp3(1,i) 1],'InputDelay',T1_L2_Kp3(2,i));
    regulator = Regulator_PD(T1_L2_Kp3(1,i),T1_L2_Kp3(2,i),T1_L2_Kp3(3,i));
    sys(i)= G2(i)*regulator;
   
    closed(i)=feedback(sys(i),1);
    figure();
    step(closed(i));

end

