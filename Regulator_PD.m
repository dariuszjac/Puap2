function [regulator] = Regulator_PD(T,L,Kp)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
a=Kp*L/T;
tau=L/(L+T);
P=1.24*(1+(0.13*tau)/(1-tau))/a;
Ti=inf;
Td=L*(0.27-0.36*tau)/(1-0.87*tau);

regulator=[P,Ti,Td];

end

