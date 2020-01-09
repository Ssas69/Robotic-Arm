%PERFILES DE ACELERACION, VELOCIDAD Y POSICION 
clear all

aymax = 0.777;  %m/seg2

dt=.1; %seg

tf=2;

t1=(2-4*dt)/2;

ti=[0 dt t1+dt t1+2*dt t1+3*dt 2*t1+3*dt tf]';

ayi=[0 aymax aymax 0, -aymax, -aymax 0]';

plot(ti,ayi)

t=(0:.01:3)';

ay=interp1(ti,ayi,t,'linear');
ay(202:301,1)=ay(201,1);
figure(1)
plot(t,ay)
title('Aceleración de caja en Y');
xlabel('Tiempo (seg)');
ylabel('Aceleración (m/seg^2)');
grid on;


vy=cumtrapz(t,ay);
vy(202:301,1)=vy(201,1);
figure(2)
plot(t,vy)
title('Velocidad de caja en Y');
xlabel('Tiempo (seg)');
ylabel('Velocidad (m/seg)');
grid on;

y=cumtrapz(t,vy)
y(202:301,1)=y(201,1);
figure(3)
plot(t,y)
title('Posicion de caja en Y');
xlabel('Tiempo (seg)');
ylabel('Posición (m)');
grid on;
