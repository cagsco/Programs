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
  F1=@(y)0.211304E-1.*((-0.148661E0)+(-0.264272E0).*y(1)+(-0.117093E1).*y( ...
  1).^2+0.749896E0.*y(1).^3+(-0.168046E1).*y(1).^4+0.16463E1.*y(1) ...
  .^5+(-0.658196E0).*y(1).^6+0.632136E0.*y(1).^7+0.367864E0.*y(2)+ ...
  0.115257E1.*y(1).*y(2)+0.184729E1.*y(1).^2.*y(2)+(-0.303712E0).*y( ...
  1).^3.*y(2)+(-0.128683E1).*y(1).^4.*y(2)+(-0.277267E1).*y(1).^5.* ...
  y(2)+(-0.276626E1).*y(1).^6.*y(2)+(-0.131639E1).*y(1).^7.*y(2)+( ...
  -0.364069E0).*y(2).^2+(-0.116866E1).*y(1).*y(2).^2+0.360955E1.*y( ...
  1).^2.*y(2).^2+0.103652E2.*y(1).^3.*y(2).^2+0.508018E1.*y(1).^4.* ...
  y(2).^2+0.10664E2.*y(1).^5.*y(2).^2+0.110656E1.*y(1).^6.*y(2).^2+( ...
  -0.869853E0).*y(1).^7.*y(2).^2+0.202834E1.*y(2).^3+(-0.145628E1).* ...
  y(1).*y(2).^3+(-0.378036E0).*y(1).^2.*y(2).^3+(-0.606618E-1).*y(1) ...
  .^3.*y(2).^3+0.608501E1.*y(1).^4.*y(2).^3+(-0.606618E-1).*y(1) ...
  .^5.*y(2).^3+0.849138E1.*y(1).^6.*y(2).^3+(-0.145628E1).*y(1).^7.* ...
  y(2).^3+0.364069E0.*y(2).^4+0.307704E1.*y(1).*y(2).^4+0.256284E1.* ...
  y(1).^2.*y(2).^4+0.371317E1.*y(1).^3.*y(2).^4+0.72646E1.*y(1).^4.* ...
  y(2).^4+0.401197E1.*y(1).^5.*y(2).^4+0.506583E1.*y(1).^6.*y(2).^4+ ...
  0.337584E1.*y(1).^7.*y(2).^4+0.367864E0.*y(2).^5+(-0.131639E1).*y( ...
  1).*y(2).^5+0.423772E1.*y(1).^2.*y(2).^5+(-0.277267E1).*y(1).^3.* ...
  y(2).^5+0.349401E1.*y(1).^4.*y(2).^5+(-0.303712E0).*y(1).^5.*y(2) ...
  .^5+(-0.375839E0).*y(1).^6.*y(2).^5+0.115257E1.*y(1).^7.*y(2).^5+ ...
  0.148661E0.*y(2).^6+0.103591E0.*y(1).*y(2).^6+(-0.635527E-1).*y(1) ...
  .^2.*y(2).^6+0.31461E1.*y(1).^3.*y(2).^6+(-0.788496E0).*y(1).^4.* ...
  y(2).^6+0.404251E1.*y(1).^5.*y(2).^6+(-0.576283E0).*y(1).^6.*y(2) ...
  .^6+0.1E1.*y(1).^7.*y(2).^6);

  F2=@(y)0.211304E-1.*((-0.148661E0)+0.367864E0.*y(1)+(-0.364069E0).*y(1) ...
  .^2+0.202834E1.*y(1).^3+0.364069E0.*y(1).^4+0.367864E0.*y(1).^5+ ...
  0.148661E0.*y(1).^6+(-0.264272E0).*y(2)+0.115257E1.*y(1).*y(2)+( ...
  -0.116866E1).*y(1).^2.*y(2)+(-0.145628E1).*y(1).^3.*y(2)+ ...
  0.307704E1.*y(1).^4.*y(2)+(-0.131639E1).*y(1).^5.*y(2)+ ...
  0.103591E0.*y(1).^6.*y(2)+(-0.117093E1).*y(2).^2+0.184729E1.*y(1) ...
  .*y(2).^2+0.360955E1.*y(1).^2.*y(2).^2+(-0.378036E0).*y(1).^3.*y( ...
  2).^2+0.256284E1.*y(1).^4.*y(2).^2+0.423772E1.*y(1).^5.*y(2).^2+( ...
  -0.635527E-1).*y(1).^6.*y(2).^2+0.749896E0.*y(2).^3+(-0.303712E0) ...
  .*y(1).*y(2).^3+0.103652E2.*y(1).^2.*y(2).^3+(-0.606618E-1).*y(1) ...
  .^3.*y(2).^3+0.371317E1.*y(1).^4.*y(2).^3+(-0.277267E1).*y(1).^5.* ...
  y(2).^3+0.31461E1.*y(1).^6.*y(2).^3+(-0.168046E1).*y(2).^4+( ...
  -0.128683E1).*y(1).*y(2).^4+0.508018E1.*y(1).^2.*y(2).^4+ ...
  0.608501E1.*y(1).^3.*y(2).^4+0.72646E1.*y(1).^4.*y(2).^4+ ...
  0.349401E1.*y(1).^5.*y(2).^4+(-0.788496E0).*y(1).^6.*y(2).^4+ ...
  0.16463E1.*y(2).^5+(-0.277267E1).*y(1).*y(2).^5+0.10664E2.*y(1) ...
  .^2.*y(2).^5+(-0.606618E-1).*y(1).^3.*y(2).^5+0.401197E1.*y(1) ...
  .^4.*y(2).^5+(-0.303712E0).*y(1).^5.*y(2).^5+0.404251E1.*y(1).^6.* ...
  y(2).^5+(-0.658196E0).*y(2).^6+(-0.276626E1).*y(1).*y(2).^6+ ...
  0.110656E1.*y(1).^2.*y(2).^6+0.849138E1.*y(1).^3.*y(2).^6+ ...
  0.506583E1.*y(1).^4.*y(2).^6+(-0.375839E0).*y(1).^5.*y(2).^6+( ...
  -0.576283E0).*y(1).^6.*y(2).^6+0.632136E0.*y(2).^7+(-0.131639E1).* ...
  y(1).*y(2).^7+(-0.869853E0).*y(1).^2.*y(2).^7+(-0.145628E1).*y(1) ...
  .^3.*y(2).^7+0.337584E1.*y(1).^4.*y(2).^7+0.115257E1.*y(1).^5.*y( ...
  2).^7+0.1E1.*y(1).^6.*y(2).^7+0.10262E-16.*y(2).^8+0.410481E-16.* ...
  y(1).*y(2).^8+0.820961E-16.*y(1).^2.*y(2).^8+0.246288E-15.*y(1) ...
  .^3.*y(2).^8+(-0.820961E-16).*y(1).^4.*y(2).^8+0.410481E-16.*y(1) ...
  .^5.*y(2).^8);

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