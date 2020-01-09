function Error=Error_cine_caja(REF,ang,L)

tet_z=ang(1,:);
omg_z=ang(2,:);
alf_z=ang(3,:);




[Rc,Vc,ac]=cine_caja(L,tet_z,omg_z,alf_z);

Error=REF-[Rc;Vc;ac];
