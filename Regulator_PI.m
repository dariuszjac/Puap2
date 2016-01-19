function [regulator] = Regulator_PI(T,L,Kp)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
a=Kp*L/T;
tau=L/(L+T);
P=0.9*(1+(0.092*tau)/(1-tau))/a;
Ti=L*(3.3-3*tau)/(1+1.2*tau);

regulator=pidstd(P,Ti);

end

