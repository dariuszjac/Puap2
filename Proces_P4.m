n4 = [ 3 4 5 6 7 8];

for i = 1:length(n4);
    syms s;
    c = sym2poly((s+1)^n4(i));
    G4(i) = tf(1,c);
    [T1_L2_Kp3(:,i) normaG4(i)]=identyfikacja(G4(i));
    G4_CC(i)=tf(T1_L2_Kp3(3,i),[T1_L2_Kp3(1,i) 1],'InputDelay',T1_L2_Kp3(2,i));
    regulator = Regulator_PI(T1_L2_Kp3(1,i),T1_L2_Kp3(2,i),T1_L2_Kp3(3,i));
    sys(i)= G4(i)*regulator;
   
    closed(i)=feedback(sys(i),1);
    figure();
    step(closed(i));

end

