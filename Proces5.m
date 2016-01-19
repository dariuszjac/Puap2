alfa5 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];


for i = 1:length(alfa5)
    syms s
    c = sym2poly((1+s)*(1+alfa5(i)*s)*(1+alfa5(i)*alfa5(i)*s)*(1+alfa5(i)*alfa5(i)*alfa5(i)*s));
    G5(i) = tf(1,c);
    [T1_L2_Kp3(:,i) normaG5(i)]=identyfikacja(G5(i));
    G5_CC(i)=tf(T1_L2_Kp3(3,i),[T1_L2_Kp3(1,i) 1],'InputDelay',T1_L2_Kp3(2,i));
    regulator = Regulator_PI(T1_L2_Kp3(1,i),T1_L2_Kp3(2,i),T1_L2_Kp3(3,i));
    sys(i)= G5(i)*regulator;
   
    closed(i)=feedback(sys(i),1);
    figure();
    step(closed(i));

end