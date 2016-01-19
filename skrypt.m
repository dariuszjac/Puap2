clear all

GCC = tf(1,[1 1],'InputDelay',1);

T1 = [0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500 1000];

for i = 1:length(T1);
    G1(i) = tf(1,[T1(i) 1],'InputDelay',1);
    [T1_L2_Kp3(:,i) normaG1(i)]=identyfikacja(G1(i));
    G1_CC(i)=tf(T1_L2_Kp3(3,i),[T1_L2_Kp3(1,i) 1],'InputDelay',T1_L2_Kp3(2,i));
end
%%
T2 = [0.01 0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500];
for i = 1:length(T2);
    G2(i) = tf(1,[T2(i)*T2(i) 2*T2(i) 1],'InputDelay',1);
    [T1_L2_Kp3_P2(:,i) normaG2(i)]=identyfikacja(G2(i));
    G2_CC(i)=tf(1,[T1_L2_Kp3(1,i) 1],'InputDelay',T1_L2_Kp3(2,i));
end
%%
T3 = [0.005 0.01 0.02 0.05 0.1 0.2 0.5 2 5 10];
for i = 1:length(T3);
    G3(i) = tf(1,[T3(i)*T3(i) T3(i)*T3(i) 2*T3(i) 1 1],'InputDelay',1);
    G3(i) = tf(1,[T3(i) 1],'InputDelay',1);
    [parametryG3(:,i) normaG3(i)]=identyfikacja(G3(i));
    G3_CC(i)=tf(1,[parametryG3(1,i) 1],'InputDelay',parametryG3(2,i));
end
%%
n4 = [ 3 4 5 6 7 8];
for i = 1:length(n4);
    syms s;
    c = sym2poly((s+1)^n4(i));
    G4(i) = tf(1,c);
    [parametryG4(:,i) normaG4(i)]=identyfikacja(G4(i));
    G4_CC(i)=tf(1,[parametryG4(1:i) 1],'InputDelay',parametryG4(2,i));
     
end


alfa5 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
for i = 1:length(alfa5)
    syms s
    c = sym2poly((1+s)*(1+alfa5(i)*s)*(1+alfa5(i)*alfa5(i)*s)*(1+alfa5(i)*alfa5(i)*alfa5(i)*s));
    G5(i) = tf(1,c);
    [parametryG5(:,i) normaG5(i)]=identyfikacja(G5(i));
    G5_CC(i)=tf(1,[parametryG5(1:i) 1],'InputDelay',parametryG5(2,i));
end


L6 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];
for i = 1:length(L6);
    G6(i) = tf(1,[(1-L6(i)) 1 0],'InputDelay',L6(i));
    [parametryG6(:,i) normaG6(i)]=identyfikacja(G6(i));
    G6_CC(i)=tf(1,[parametryG6(1:i) 1],'InputDelay',parametryG6(2,i));
end


alfa8 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
for i = 1:length(alfa8);
    G8(i) = tf([-alfa8(i) 1], [1 3 3 1]);
    [parametryG8(:,i) normaG8(i)]=identyfikacja(G8(i));
    G8_CC(i)=tf(1,[parametryG8(1:i) 1],'InputDelay',parametryG8(2,i));
end

T9 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for i = 1:length(T9)
    syms s
    c = sym2poly((s+1)*((s*T9(i))*(s*T9(i)) + 1.4*s*T9(i) +1));
    G9(i) = tf(1,c);
    [parametryG9(:,i) normaG9(i)]=identyfikacja(G9(i));
    G9_CC(i)=tf(1,[parametryG9(1:i) 1],'InputDelay',parametryG9(2,i));
end