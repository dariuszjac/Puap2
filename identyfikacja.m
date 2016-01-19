function [x norma] = identyfikacja(GG)

dt=0.005;
t=0:dt:1000;
[yk] = step(GG,t);
y=yk';
fun=@(x) x(3)*(1-exp(-(t-x(2))/x(1))).*heaviside(t-x(2))-y; 
% x2 opóŸnienie x1-stalaczasowa x3 wzmocnienie
lb = [0,0,0];
ub = [3000,200,2];
x0 = [1,0.5,1];
[x norma] = lsqnonlin(fun,x0,lb,ub);
    
end