
function F=error_brazo(x,REF,L)

teta=x(1,:);
    omega=x(2,:);
    alfa=x(3,:);
    R_ref=REF(1,:);
    V_ref=REF(2,:);
    a_ref=REF(3,:);

[R,V,a]=cinematica_brazo(teta,omega,alfa,L);

F(1,:)=R-R_ref;

F(2,:)=V-V_ref;

F(3,:)=a-a_ref;

 