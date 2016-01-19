L6 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];

for i = 1:length(L6);
    G6(i) = tf(1,[(1-L6(i)) 1 0],'InputDelay',L6(i));
    [T1_L2_Kp3(:,i) normaG6(i)]=identyfikacja(G6(i));
    G6_CC(i)=tf(T1_L2_Kp3(3,i),[T1_L2_Kp3(1,i) 1],'InputDelay',T1_L2_Kp3(2,i));
    regulator = Regulator_PI(T1_L2_Kp3(1,i),T1_L2_Kp3(2,i),T1_L2_Kp3(3,i));
    sys(i)= G6(i)*regulator;
   
    closed(i)=feedback(sys(i),1);
    figure();
    step(closed(i));
end