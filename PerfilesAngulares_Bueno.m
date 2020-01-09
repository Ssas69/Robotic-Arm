%PERFILES ANGULARES 
%theta3 = 71.93 degrees = 72 degreees = 1.26 rad por lo que al tanteo
%propongo un valor de alphamax para que theta3 sea 1.26 rad

alfamax=6.3;  %rad/seg2

dt=.1; %seg

tf=1;

t1=(1-4*dt)/2;

ti2=[0 dt t1+dt t1+2*dt t1+3*dt 2*t1+3*dt tf]';

alfai=[0 alfamax alfamax 0, -alfamax, -alfamax 0]';

plot(ti2,alfai)

t2=(0:.01:tf)';

alfa_z=interp1(ti2,alfai,t2,'linear');
figure(1)
plot(t2,alfa_z)
title('Aceleración angular de caja');
xlabel('Time (seg)');
ylabel('Alpha (rad/seg^2)');
grid on;

w=cumtrapz(t2,alfa_z); %rad/seg
figure(2)
plot(t2,w)
title('Velocidad angular de caja');
xlabel('Time (seg)');
ylabel('Omega (rad/seg)');
grid on;

theta=cumtrapz(t2,w) %rad
figure(3)
plot(t2,theta)
title('Posición angular de caja');
xlabel('Time (seg)');
ylabel('Theta (rad)');
grid on;

%az_caja=R_caja(end,1)*alfa_z;
%a_caja2=[az_caja*0 az_caja*0 az_caja];
a_caja2=[alfa_z*0 alfa_z*0 alfa_z];