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
  F1=@(y)(-0.972956E-3).*(0.297779E0+0.1328E1.*y(1)+0.225747E1.*y(1).^2+( ...
  -0.196393E1).*y(1).^3+0.347201E1.*y(1).^4+(-0.345593E1).*y(1).^5+ ...
  0.151232E1.*y(1).^6+(-0.163999E0).*y(1).^7+0.1164E1.*y(2)+( ...
  -0.213271E1).*y(1).*y(2)+(-0.788646E1).*y(1).^2.*y(2)+( ...
  -0.343222E0).*y(1).^3.*y(2)+0.747065E1.*y(1).^4.*y(2)+0.481412E1.* ...
  y(1).^5.*y(2)+0.165211E2.*y(1).^6.*y(2)+0.302464E1.*y(1).^7.*y(2)+ ...
  0.447372E0.*y(2).^2+0.165264E2.*y(1).*y(2).^2+(-0.622652E1).*y(1) ...
  .^2.*y(2).^2+(-0.444925E2).*y(1).^3.*y(2).^2+(-0.115512E2).*y(1) ...
  .^4.*y(2).^2+(-0.449898E2).*y(1).^5.*y(2).^2+(-0.487736E1).*y(1) ...
  .^6.*y(2).^2+0.160291E2.*y(1).^7.*y(2).^2+(-0.658386E1).*y(2).^3+ ...
  0.178949E1.*y(1).*y(2).^3+0.248077E2.*y(1).^2.*y(2).^3+0.23766E1.* ...
  y(1).^3.*y(2).^3+(-0.197516E2).*y(1).^4.*y(2).^3+0.23766E1.*y(1) ...
  .^5.*y(2).^3+(-0.511431E2).*y(1).^6.*y(2).^3+0.178949E1.*y(1).^7.* ...
  y(2).^3+(-0.447372E0).*y(2).^4+(-0.904512E1).*y(1).*y(2).^4+( ...
  -0.666685E1).*y(1).^2.*y(2).^4+0.124707E2.*y(1).^3.*y(2).^4+( ...
  -0.142355E2).*y(1).^4.*y(2).^4+0.119733E2.*y(1).^5.*y(2).^4+( ...
  -0.8016E1).*y(1).^6.*y(2).^4+(-0.954245E1).*y(1).^7.*y(2).^4+ ...
  0.1164E1.*y(2).^5+0.302464E1.*y(1).*y(2).^5+(-0.118651E2).*y(1) ...
  .^2.*y(2).^5+0.481412E1.*y(1).^3.*y(2).^5+(-0.486659E0).*y(1).^4.* ...
  y(2).^5+(-0.343222E0).*y(1).^5.*y(2).^5+0.125425E2.*y(1).^6.*y(2) ...
  .^5+(-0.213271E1).*y(1).^7.*y(2).^5+(-0.297779E0).*y(2).^6+ ...
  0.2492E1.*y(1).*y(2).^6+0.321204E0.*y(1).^2.*y(2).^6+(-0.738379E1) ...
  .*y(1).^3.*y(2).^6+0.168534E1.*y(1).^4.*y(2).^6+(-0.887579E1).*y( ...
  1).^5.*y(2).^6+0.106635E1.*y(1).^6.*y(2).^6+0.1E1.*y(1).^7.*y(2) ...
  .^6);

  F2=@(y)(-0.289725E-3)+(-0.113252E-2).*y(1)+(-0.435273E-3).*y(1).^2+ ...
  0.64058E-2.*y(1).^3+0.435273E-3.*y(1).^4+(-0.113252E-2).*y(1).^5+ ...
  0.289725E-3.*y(1).^6+(-0.129208E-2).*y(2)+0.207503E-2.*y(1).*y(2)+ ...
  (-0.160795E-1).*y(1).^2.*y(2)+(-0.174109E-2).*y(1).^3.*y(2)+ ...
  0.880051E-2.*y(1).^4.*y(2)+(-0.294284E-2).*y(1).^5.*y(2)+( ...
  -0.24246E-2).*y(1).^6.*y(2)+(-0.219642E-2).*y(2).^2+0.767318E-2.* ...
  y(1).*y(2).^2+0.605813E-2.*y(1).^2.*y(2).^2+(-0.241368E-1).*y(1) ...
  .^3.*y(2).^2+0.648655E-2.*y(1).^4.*y(2).^2+0.115442E-1.*y(1).^5.* ...
  y(2).^2+(-0.312518E-3).*y(1).^6.*y(2).^2+0.191082E-2.*y(2).^3+ ...
  0.33394E-3.*y(1).*y(2).^3+0.432892E-1.*y(1).^2.*y(2).^3+( ...
  -0.231232E-2).*y(1).^3.*y(2).^3+(-0.121334E-1).*y(1).^4.*y(2).^3+( ...
  -0.468393E-2).*y(1).^5.*y(2).^3+0.71841E-2.*y(1).^6.*y(2).^3+( ...
  -0.337811E-2).*y(2).^4+(-0.726862E-2).*y(1).*y(2).^4+0.112389E-1.* ...
  y(1).^2.*y(2).^4+0.192174E-1.*y(1).^3.*y(2).^4+0.138505E-1.*y(1) ...
  .^4.*y(2).^4+0.473498E-3.*y(1).^5.*y(2).^4+(-0.163976E-2).*y(1) ...
  .^6.*y(2).^4+0.336247E-2.*y(2).^5+(-0.468393E-2).*y(1).*y(2).^5+ ...
  0.437731E-1.*y(1).^2.*y(2).^5+(-0.231232E-2).*y(1).^3.*y(2).^5+( ...
  -0.116495E-1).*y(1).^4.*y(2).^5+0.33394E-3.*y(1).^5.*y(2).^5+ ...
  0.863575E-2.*y(1).^6.*y(2).^5+(-0.147142E-2).*y(2).^6+( ...
  -0.160743E-1).*y(1).*y(2).^6+0.474546E-2.*y(1).^2.*y(2).^6+ ...
  0.4976E-1.*y(1).^3.*y(2).^6+0.779922E-2.*y(1).^4.*y(2).^6+( ...
  -0.122033E-1).*y(1).^5.*y(2).^6+(-0.103752E-2).*y(1).^6.*y(2).^6+ ...
  0.159563E-3.*y(2).^7+(-0.294284E-2).*y(1).*y(2).^7+(-0.155956E-1) ...
  .*y(1).^2.*y(2).^7+(-0.174109E-2).*y(1).^3.*y(2).^7+0.928439E-2.* ...
  y(1).^4.*y(2).^7+0.207503E-2.*y(1).^5.*y(2).^7+(-0.972956E-3).*y( ...
  1).^6.*y(2).^7+(-0.271051E-19).*y(2).^8+(-0.10842E-18).*y(1).^2.* ...
  y(2).^8+(-0.10842E-18).*y(1).^4.*y(2).^8+(-0.271051E-19).*y(1) ...
  .^6.*y(2).^8;

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
           