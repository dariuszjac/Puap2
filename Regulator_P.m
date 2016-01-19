function [regulator] = Regulator_P(T,L,Kp)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
a=Kp*L/T;
tau=L/(L+T);
P=(1+(0.35*tau)/(1-tau))/a;

regulator=pidstd(P);

end

