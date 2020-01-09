%PERFILES ANGULARES EN SEGUNDA ETAPA
clear all

alfamax=6.3;  %rad/seg2

dt=.1; %seg

tf=1;

t1=(1-4*dt)/2;

ti2=[0 dt t1+dt t1+2*dt t1+3*dt 2*t1+3*dt tf]';

alfai=[0 alfamax alfamax 0, -alfamax, -alfamax 0]';

plot(ti2,alfai)

t=(0:.01:1)';

t2=(0:.01:3)';

alfa_z=interp1(ti2,alfai,t,'linear');
alfa=[alfa_z*0];
alfa(102:201,1)=alfa(101,1);
alfa(201:301,1)=[alfa_z];
%alfa(202:301,1)=[alfa_z];
%alfa_z(0:100,1)=0
figure(1)
plot(t2,alfa)
title('Aceleración angular de caja');
xlabel('Time (seg)');
ylabel('Alpha (rad/seg^2)');
grid on;


w=cumtrapz(t2,alfa); %rad/seg
%w(202:301,1)=w(201,1);
figure(2)
plot(t2,w)
title('Velocidad angular de caja');
xlabel('Time (seg)');
ylabel('Omega (rad/seg)');
grid on;

theta=cumtrapz(t2,w) %rad
%theta(202:301,1)=theta(201,1);
figure(3)
plot(t2,theta)
title('Posición angular de caja');
xlabel('Time (seg)');
ylabel('Theta (rad)');
grid on;