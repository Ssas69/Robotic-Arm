function [R_caja,V_caja,a_caja]=cinematica_brazo(teta,omega,alfa,L)


R_caja=[sum(L.*cosd(teta),2) sum(L.*sind(teta),2) ];
V_caja=[sum(-L.*sind(teta).*omega,2) sum(L.*cosd(teta).*omega,2)];
a_caja=[sum(-L.*sind(teta).*alfa -L.*cosd(teta).*omega.^2,2)   sum( L.*cosd(teta).*alfa -L.*sind(teta).*omega.^2,2)];


R_caja(end,3)=0;
V_caja(end,3)=0;
a_caja(end,3)=0;