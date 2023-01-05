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
  F1=@(y)(-0.748231E-3).*(0.131801E1+0.564291E0.*y(1)+0.406932E1.*y(1).^2+ ...
  0.143836E1.*y(1).^3+0.418095E1.*y(1).^4+0.109192E1.*y(1).^5+ ...
  0.142964E1.*y(1).^6+0.217855E0.*y(1).^7+0.782145E0.*y(2)+ ...
  0.240542E1.*y(1).*y(2)+0.308411E1.*y(1).^2.*y(2)+0.769214E1.*y(1) ...
  .^3.*y(2)+0.327027E1.*y(1).^4.*y(2)+0.814599E1.*y(1).^5.*y(2)+ ...
  0.968298E0.*y(1).^6.*y(2)+0.285927E1.*y(1).^7.*y(2)+0.132168E1.*y( ...
  2).^2+0.173734E1.*y(1).*y(2).^2+0.337019E1.*y(1).^2.*y(2).^2+ ...
  0.702688E1.*y(1).^3.*y(2).^2+0.283041E1.*y(1).^4.*y(2).^2+ ...
  0.69114E1.*y(1).^5.*y(2).^2+0.7819E0.*y(1).^6.*y(2).^2+ ...
  0.162186E1.*y(1).^7.*y(2).^2+0.174813E1.*y(2).^3+0.528672E1.*y(1) ...
  .*y(2).^3+0.432519E1.*y(1).^2.*y(2).^3+0.157867E2.*y(1).^3.*y(2) ...
  .^3+0.52444E1.*y(1).^4.*y(2).^3+0.157867E2.*y(1).^5.*y(2).^3+ ...
  0.266734E1.*y(1).^6.*y(2).^3+0.528672E1.*y(1).^7.*y(2).^3+( ...
  -0.132168E1).*y(2).^4+0.307101E1.*y(1).*y(2).^4+(-0.450482E1).*y( ...
  1).^2.*y(2).^4+0.827027E1.*y(1).^3.*y(2).^4+(-0.509966E1).*y(1) ...
  .^4.*y(2).^4+0.815479E1.*y(1).^5.*y(2).^4+(-0.191652E1).*y(1).^6.* ...
  y(2).^4+0.295553E1.*y(1).^7.*y(2).^4+0.782145E0.*y(2).^5+ ...
  0.285927E1.*y(1).*y(2).^5+0.216028E1.*y(1).^2.*y(2).^5+ ...
  0.814599E1.*y(1).^3.*y(2).^5+0.142261E1.*y(1).^4.*y(2).^5+ ...
  0.769214E1.*y(1).^5.*y(2).^5+0.44468E-1.*y(1).^6.*y(2).^5+ ...
  0.240542E1.*y(1).^7.*y(2).^5+(-0.131801E1).*y(2).^6+0.134644E1.*y( ...
  1).*y(2).^6+(-0.38424E1).*y(1).^2.*y(2).^6+0.396864E1.*y(1).^3.*y( ...
  2).^6+(-0.37271E1).*y(1).^4.*y(2).^6+0.36222E1.*y(1).^5.*y(2).^6+( ...
  -0.120271E1).*y(1).^6.*y(2).^6+0.1E1.*y(1).^7.*y(2).^6);

  F2=@(y)(-0.748231E-3).*(0.131801E1+0.782145E0.*y(1)+0.132168E1.*y(1).^2+ ...
  0.174813E1.*y(1).^3+(-0.132168E1).*y(1).^4+0.782145E0.*y(1).^5+( ...
  -0.131801E1).*y(1).^6+0.564291E0.*y(2)+0.240542E1.*y(1).*y(2)+ ...
  0.173734E1.*y(1).^2.*y(2)+0.528672E1.*y(1).^3.*y(2)+0.307101E1.*y( ...
  1).^4.*y(2)+0.285927E1.*y(1).^5.*y(2)+0.134644E1.*y(1).^6.*y(2)+ ...
  0.406932E1.*y(2).^2+0.308411E1.*y(1).*y(2).^2+0.337019E1.*y(1) ...
  .^2.*y(2).^2+0.432519E1.*y(1).^3.*y(2).^2+(-0.450482E1).*y(1).^4.* ...
  y(2).^2+0.216028E1.*y(1).^5.*y(2).^2+(-0.38424E1).*y(1).^6.*y(2) ...
  .^2+0.143836E1.*y(2).^3+0.769214E1.*y(1).*y(2).^3+0.702688E1.*y(1) ...
  .^2.*y(2).^3+0.157867E2.*y(1).^3.*y(2).^3+0.827027E1.*y(1).^4.*y( ...
  2).^3+0.814599E1.*y(1).^5.*y(2).^3+0.396864E1.*y(1).^6.*y(2).^3+ ...
  0.418095E1.*y(2).^4+0.327027E1.*y(1).*y(2).^4+0.283041E1.*y(1) ...
  .^2.*y(2).^4+0.52444E1.*y(1).^3.*y(2).^4+(-0.509966E1).*y(1).^4.* ...
  y(2).^4+0.142261E1.*y(1).^5.*y(2).^4+(-0.37271E1).*y(1).^6.*y(2) ...
  .^4+0.109192E1.*y(2).^5+0.814599E1.*y(1).*y(2).^5+0.69114E1.*y(1) ...
  .^2.*y(2).^5+0.157867E2.*y(1).^3.*y(2).^5+0.815479E1.*y(1).^4.*y( ...
  2).^5+0.769214E1.*y(1).^5.*y(2).^5+0.36222E1.*y(1).^6.*y(2).^5+ ...
  0.142964E1.*y(2).^6+0.968298E0.*y(1).*y(2).^6+0.7819E0.*y(1).^2.* ...
  y(2).^6+0.266734E1.*y(1).^3.*y(2).^6+(-0.191652E1).*y(1).^4.*y(2) ...
  .^6+0.44468E-1.*y(1).^5.*y(2).^6+(-0.120271E1).*y(1).^6.*y(2).^6+ ...
  0.217855E0.*y(2).^7+0.285927E1.*y(1).*y(2).^7+0.162186E1.*y(1) ...
  .^2.*y(2).^7+0.528672E1.*y(1).^3.*y(2).^7+0.295553E1.*y(1).^4.*y( ...
  2).^7+0.240542E1.*y(1).^5.*y(2).^7+0.1E1.*y(1).^6.*y(2).^7+ ...
  0.724511E-16.*y(1).*y(2).^8+0.724511E-16.*y(1).^5.*y(2).^8);

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
           