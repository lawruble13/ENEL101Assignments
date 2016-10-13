function [graphs,info]=assign4(factor)

info.FirstName='Liam';
info.LastName='Wrubleski';
info.UCID='10168579';%without your correct UCID here you cannot get a mark




for i=1:8
    graphs(i).z=0;
end;
N0=1;
[graphs(1).graph,graphs(1).x,graphs(1).y]=question1(N0*factor);
N0=5;
[graphs(2).graph,graphs(2).x,graphs(2).y]=question2(N0*factor);
N0=1;
[graphs(3).graph,graphs(3).theta,graphs(3).r]=question3(N0*factor);
N0=3;
[graphs(4).graph,graphs(4).x,graphs(4).y]=question4(N0*factor);
N0=3;
[graphs(5).graph,graphs(5).t,graphs(5).u,graphs(5).v]=question5(N0*factor);
vs0=12; rs0=2.5;
[graphs(6).graph,graphs(6).x,graphs(6).y]=question6(vs0*factor,rs0);
L0=0.001; C0=3.33e-6;
[graphs(7).graph,graphs(7).x,graphs(7).y,graphs(7).z]=question7(L0*factor,C0);
a0=1; b0=1; h0=1; n0=5;
[graphs(8).graph,graphs(8).x,graphs(8).y,graphs(8).z]=question8(a0*factor,b0,h0,n0);

    function [graph,x,y]=question1(N)
        x=linspace(0,10,100);
        y=N*sin(x);
        %you must use double quotes instead of single quotes within the
        %string
        graph='plot(x,y);grid on;xlabel(''x'');ylabel(''y'')';
    end


    function [graph,x,y]=question2(N) 
      x=linspace(-10,5,2000);
      y=N.*cos(x)./(x+exp(-0.8*x)) - (2/5).*x;
      graph='plot(x,y);grid on;xlabel(''x'');ylabel(''y'');'; 
    end

    function [graph,theta,r]=question3(N)
      theta=linspace(0,2*pi,500);
      r=cos(2*N*theta).*sin(2*N*theta);
      graph='polar(theta,r)';
    end

    function [graph,x,y]=question4(N)
      
      x=linspace(-4,4,30);
      y=(x.^2+N.*x+6)./(1.8.*(x+1));
      graph='scatter(x,y,10,''ro'',''filled'');grid on;xlabel(''x'');ylabel(''y'');ylim([-12,70]);hold on;scatter(x(30),y(30),100,''k*'');';
    end

    function [graph,t,u,v]=question5(N) 
       t   = linspace(0,15,200)';
       u   = (N.*t.^3)./(1+t.^4);
       v   = (N.*t.^2)./(1+t.^3);

       graph = 'subplot(2,1,1);plot(t,u,''-'');grid on;hold on; plot(t,v,''--'');legend(''u'',''v'');title(''Question 5'');subplot(2,1,2);plot(u,v);grid on;xlabel(''u'');ylabel(''v'');';
    end
    
    function [graph,x,y]=question6(vs,rs)
      
      x=linspace(0.01,100,20000);
      y=(vs^2.*x)./((x+rs).^2);
      graph='semilogx(x,y);grid on;xlabel(''R_L'');ylabel(''P'');'; 
    end
    
    function [graph,x,y,z]=question7(L,C)
        %use x=R,  y=wd,  and z=I
       [R,wd] = meshgrid(linspace(0.5,20,200),linspace(0.1/sqrt(L*C),2/sqrt(L*C),200));
       x=R;
       y=wd;
       z=1./(sqrt(R.^2+(wd.*L - 1./(wd*C)).^2));
       graph='mesh(x,y,z);xlabel(''R(\Omega)'');ylabel(''\omega_d(rad/s)'');zlabel(''I (A)'');';
       
    end

    function [graph,x,y,z]=question8(a,b,h,n)
       t = linspace(0,2*pi*n,100);
       r=exp(-0.1*t).*(a*b)./(sqrt(b^2.*(cos(t)).^2+a^2.*(sin(t)).^2));
       x = r.*cos(t);
       y = r.*sin(t);
       z = (h.*t)./(2*pi*n);
       graph='plot3(x,y,z)';
    end
    
end
