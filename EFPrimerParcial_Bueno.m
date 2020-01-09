%Código para conocer thetas, omegas, alphas, fuerzas, etc.
clear all

ti=[0 .1 .9 1 1.1 1.9 2];

ayi=[0 .777 .777 0 -.777 -.777 0];

t=(0:.01:2)';

tg=(0:.01:3.01)';

ay_ref=interp1(ti,ayi,t);

a_caja_ref=[ay_ref*0 ay_ref ay_ref*0]; %Aceleración en Y

V_caja_ref=cumtrapz(t,a_caja_ref); %Velocidad de referencia

Ro=[.9518,0 0];  %Posición inicial de referencia (caja)

R_caja_ref=cumtrapz(t,V_caja_ref)+Ro; %Posición de referencia

Le=[.6 .6]; %Longitud de los brazos l1 l2 

teta=[37.52 -37.52]; % Theta 1 y Theta 2

omega=[0 0];

alfa=[0 0];

x0=[teta;omega;alfa];

caja=[R_caja_ref(1,:);V_caja_ref(1,:);a_caja_ref(1,:)]; % valores de referencia a cumplir

F=brazo(x0,caja,Le);


[x,fval]=fsolve(@(x) brazo(x,caja,Le),x0);

    teta=x(1,:);
    omega=x(2,:);
    alfa=x(3,:);% cambia _z


for i=1:length(t)-1


x0=[teta(i,:);omega(i,:);alfa(i,:)]; %cambia teta_z

caja=[R_caja_ref(i+1,:);V_caja_ref(i+1,:);a_caja_ref(i+1,:)];


[x,fval]=fsolve(@(x) brazo(x,caja,Le),x0);

    teta(i+1,:)=x(1,:);
    omega(i+1,:)=x(2,:);
    alfa(i+1,:)=x(3,:);

end


[R_caja,V_caja,a_caja]=cinematica_brazo(teta,omega,alfa,Le);

PerfilesAngulares_Bueno
a_cajaT=[a_caja;a_caja2];

teta(202:302,1)=teta(201,1);
teta(202:302,2)=teta(201,2);
omega(202:302,1)=omega(201,1);
omega(202:302,2)=omega(201,2);
alfa(202:302,1)=alfa(201,1);
alfa(202:302,2)=alfa(201,2);

%CINEMATICA CAJA 
mg = a_cajaT*0;
mg(:,2)=-50*9.81;
F2C=50*a_cajaT-mg;

%CINEMATICA BRAZO 2
F12=F2C;
FC2=-F2C;
R2C=[Le(2)*cosd(teta(:,2)) Le(2)*sind(teta(:,2))];
R2C(:,3)=0;
%R2C(202:302,1)=R2C(201,1);
%R2C(202:302,2)=R2C(201,2);
M2=-cross(R2C,FC2);

%CINEMATICA BRAZO 1 
F21=-F12
F01=F12
R12=[Le(1)*cosd(teta(:,1)) Le(1)*sind(teta(:,1))];
R12(:,3)=0;
M1 =M2-cross(R12,F21);

P1=[omega(:,1).*M1(:,3)];
P2=[omega(:,2).*M2(:,3)];
W2=[omega(:,2)-omega(:,1)];
P21=[W2.*M2(:,3)];

F12nb=[-F2C(:,2).*sind(teta(:,2)) F2C(:,2).*cosd(teta(:,2))];
F2Cnb=[F2C(:,2).*sind(teta(:,2)) -F2C(:,2).*cosd(teta(:,2))];

F21nb=[-F2C(:,2).*sind(teta(:,1)) -F2C(:,2).*cosd(teta(:,1))];
F01nb=[F2C(:,2).*sind(teta(:,1)) F2C(:,2).*cosd(teta(:,1))];





M1_nbt(:,1)=M1(:,1).*cosd(teta(:,1))-M1(:,2).*sind(teta(:,1));
M1_nbt(:,2)=M1(:,2).*cosd(teta(:,1))+M1(:,1).*sind(teta(:,1));
M1_nbt(:,3)=M1(:,3);

M2_nbt(:,1)=M2(:,1).*cosd(teta(:,2))-M2(:,2).*sind(teta(:,2));
M2_nbt(:,2)=M2(:,2).*cosd(teta(:,2))+M2(:,1).*sind(teta(:,2));
M2_nbt(:,3)=M2(:,3);

%max(M2_nbt)
%min(M2_nbt)
