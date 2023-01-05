clear; % clear CommandWindow and workspace
 sayac=0;
 AGS=zeros(3,1);
 eps=1e-8;% for sedumi
 bigeps=eps;% for sedumi
 maxiter=400;% for sedumi
 degrees=1:20;
 timescale=1;
 tolerance=0;
 


 n=2;%the dimension of the state space
 hold on
         G = @(y)(0.1E1+y(1).^2).^3.*(0.1E1+y(2).^2).^3;
  F1=@(y)(-0.161988E-1).*((-0.162677E0)+(-0.429539E0).*y(1)+(-0.141334E1).* ...
  y(1).^2+0.860471E0.*y(1).^3+(-0.193286E1).*y(1).^4+0.200478E1.*y( ...
  1).^5+(-0.68219E0).*y(1).^6+0.714769E0.*y(1).^7+0.285231E0.*y(2)+ ...
  0.152527E1.*y(1).*y(2)+0.234429E1.*y(1).^2.*y(2)+(-0.748641E0).*y( ...
  1).^3.*y(2)+(-0.21958E1).*y(1).^4.*y(2)+(-0.363829E1).*y(1).^5.*y( ...
  2)+(-0.425485E1).*y(1).^6.*y(2)+(-0.136438E1).*y(1).^7.*y(2)+( ...
  -0.568478E0).*y(2).^2+(-0.249198E1).*y(1).*y(2).^2+0.495014E1.*y( ...
  1).^2.*y(2).^2+0.140059E2.*y(1).^3.*y(2).^2+0.551869E1.*y(1).^4.* ...
  y(2).^2+0.143873E2.*y(1).^5.*y(2).^2+0.78394E-4.*y(1).^6.*y(2).^2+ ...
  (-0.211054E1).*y(1).^7.*y(2).^2+0.258002E1.*y(2).^3+(-0.227391E1) ...
  .*y(1).*y(2).^3+(-0.230773E1).*y(1).^2.*y(2).^3+0.129428E1.*y(1) ...
  .^3.*y(2).^3+0.774006E1.*y(1).^4.*y(2).^3+0.129428E1.*y(1).^5.*y( ...
  2).^3+0.126278E2.*y(1).^6.*y(2).^3+(-0.227391E1).*y(1).^7.*y(2) ...
  .^3+0.568478E0.*y(2).^4+0.382193E1.*y(1).*y(2).^4+0.227399E1.*y(1) ...
  .^2.*y(2).^4+0.28042E1.*y(1).^3.*y(2).^4+0.892956E1.*y(1).^4.*y(2) ...
  .^4+0.318564E1.*y(1).^5.*y(2).^4+0.722405E1.*y(1).^6.*y(2).^4+ ...
  0.420336E1.*y(1).^7.*y(2).^4+0.285231E0.*y(2).^5+(-0.136438E1).*y( ...
  1).*y(2).^5+0.539577E1.*y(1).^2.*y(2).^5+(-0.363829E1).*y(1).^3.* ...
  y(2).^5+0.390718E1.*y(1).^4.*y(2).^5+(-0.748641E0).*y(1).^5.*y(2) ...
  .^5+(-0.120336E1).*y(1).^6.*y(2).^5+0.152527E1.*y(1).^7.*y(2).^5+ ...
  0.162677E0.*y(2).^6+(-0.144308E0).*y(1).*y(2).^6+(-0.314806E-1).* ...
  y(1).^2.*y(2).^6+0.372572E1.*y(1).^3.*y(2).^6+(-0.956794E0).*y(1) ...
  .^4.*y(2).^6+0.487003E1.*y(1).^5.*y(2).^6+(-0.762636E0).*y(1).^6.* ...
  y(2).^6+0.1E1.*y(1).^7.*y(2).^6);

  F2=@(y)(-0.161988E-1).*((-0.162677E0)+0.285231E0.*y(1)+(-0.568478E0).*y( ...
  1).^2+0.258002E1.*y(1).^3+0.568478E0.*y(1).^4+0.285231E0.*y(1).^5+ ...
  0.162677E0.*y(1).^6+(-0.429539E0).*y(2)+0.152527E1.*y(1).*y(2)+( ...
  -0.249198E1).*y(1).^2.*y(2)+(-0.227391E1).*y(1).^3.*y(2)+ ...
  0.382193E1.*y(1).^4.*y(2)+(-0.136438E1).*y(1).^5.*y(2)+( ...
  -0.144308E0).*y(1).^6.*y(2)+(-0.141334E1).*y(2).^2+0.234429E1.*y( ...
  1).*y(2).^2+0.495014E1.*y(1).^2.*y(2).^2+(-0.230773E1).*y(1).^3.* ...
  y(2).^2+0.227399E1.*y(1).^4.*y(2).^2+0.539577E1.*y(1).^5.*y(2).^2+ ...
  (-0.314806E-1).*y(1).^6.*y(2).^2+0.860471E0.*y(2).^3+(-0.748641E0) ...
  .*y(1).*y(2).^3+0.140059E2.*y(1).^2.*y(2).^3+0.129428E1.*y(1).^3.* ...
  y(2).^3+0.28042E1.*y(1).^4.*y(2).^3+(-0.363829E1).*y(1).^5.*y(2) ...
  .^3+0.372572E1.*y(1).^6.*y(2).^3+(-0.193286E1).*y(2).^4+( ...
  -0.21958E1).*y(1).*y(2).^4+0.551869E1.*y(1).^2.*y(2).^4+ ...
  0.774006E1.*y(1).^3.*y(2).^4+0.892956E1.*y(1).^4.*y(2).^4+ ...
  0.390718E1.*y(1).^5.*y(2).^4+(-0.956794E0).*y(1).^6.*y(2).^4+ ...
  0.200478E1.*y(2).^5+(-0.363829E1).*y(1).*y(2).^5+0.143873E2.*y(1) ...
  .^2.*y(2).^5+0.129428E1.*y(1).^3.*y(2).^5+0.318564E1.*y(1).^4.*y( ...
  2).^5+(-0.748641E0).*y(1).^5.*y(2).^5+0.487003E1.*y(1).^6.*y(2) ...
  .^5+(-0.68219E0).*y(2).^6+(-0.425485E1).*y(1).*y(2).^6+ ...
  0.78394E-4.*y(1).^2.*y(2).^6+0.126278E2.*y(1).^3.*y(2).^6+ ...
  0.722405E1.*y(1).^4.*y(2).^6+(-0.120336E1).*y(1).^5.*y(2).^6+( ...
  -0.762636E0).*y(1).^6.*y(2).^6+0.714769E0.*y(2).^7+(-0.136438E1).* ...
  y(1).*y(2).^7+(-0.211054E1).*y(1).^2.*y(2).^7+(-0.227391E1).*y(1) ...
  .^3.*y(2).^7+0.420336E1.*y(1).^4.*y(2).^7+0.152527E1.*y(1).^5.*y( ...
  2).^7+0.1E1.*y(1).^6.*y(2).^7+0.535447E-16.*y(1).*y(2).^8+ ...
  0.214179E-15.*y(1).^2.*y(2).^8+(-0.107089E-15).*y(1).^3.*y(2).^8+ ...
  0.535447E-16.*y(1).^5.*y(2).^8);

        for degree=degrees%this is actually the half of the degree
            degreeInt=1;
            x=sdpvar(n,1);
            y=sdpvar(n-1,1);
            degree*2;
            [rho,wrho] = polynomial(x,2*degree);
           
            f1 = F1(x);
            f2 = F2(x);
            g = G(x);
            div = jacobian( f1, x(1) )+...
                jacobian( f2, x(2) );
            fun = (g*rho*div+jacobian(rho,x)*[f1;f2]*g-rho*jacobian(g,x)*[f1;f2]);
            
            constr = [sos(fun),sos(rho-tolerance)];
           
            params = [wrho];
%             constr =
%             [sos(fun),sos(rho),sum(wrho)>=tolerance,wrho(1)>=tolerance];
%             params = [wrho];
%             constr = [sos(funRed),sos(rhoRed),sum(wrhoRed)>=toleranceRed];
%            params = [ wrhoRed];
            %options = sdpsettings('solver','sdpa');
            %options = sdpsettings('solver','sdpt3');
            options = sdpsettings('solver','sedumi','verbose',0,'sedumi.eps',eps,'sedumi.bigeps', ...
                bigeps,'sedumi.maxiter',maxiter);
            %options = sdpsettings('solver','mosek');
            [sol,~,~,~]=solvesos(constr,1,options,params);
            if sol.problem==0
                
                               
              
                break
            end
          
        end
 
display(double(wrho));


realparamB=double(wrho)
        x = sdpvar(1,1);y = sdpvar(1,1);
        vv = monolist([x; y],degree*2);
      
        Bpoly = sdisplay(round(realparamB,2)'*vv)
         B=eval(['@(x,y)' Bpoly{1}])
           