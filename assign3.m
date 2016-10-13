function [solutions,info]=assign3(factor)

info.FirstName='Liam';
info.LastName='Wrubleski';
info.UCID='10168579';%without your correct UCID here you cannot get a mark



X10 = [-200:10:20];
solutions(1).ans=question1(X10*factor);
X20 = [-200:10:20];
solutions(2).ans=question2(X20*factor);
X30 = [0:100];
Y30 = [10:110];
solutions(3).ans=question3(X30*factor,Y30);
A0 = [[-4 3 1];[5 6 -2];[2 -5 4.5]];
Y40 = [-18.2;-48.8;92.5];
solutions(4).ans=question4(A0*factor,Y40);
solutions(5).ans=question5();
M0=10000;
solutions(6).ans=question6(M0*factor); 
solutions(7).ans=question7();
N0=10;
solutions(8).ans=question8(N0*factor);
M0=11;
solutions(9).ans=question9(M0*factor);
K0=12;
solutions(10).ans=question10(K0*factor);


    function [answer]=question1(X1)
       t=sum(X1);
       answer=1/t;
    end

    function [answer]=question2(X2)
       Y=10.*X2+10;
        answer = sum(cos(X2).*sin(Y));
    end

    function [answer]=question3(X3,Y3)
       Z=cos((pi/180).*X3.*Y3)+sin((pi/180)^2.*X3);
        
        answer = Z;
    end

    function [answer]=question4(A,Y4) 
      answer=A\Y4;
    end
    
    function [answer]=question5()
        load('Q5h.mat','h');
        load('Q5theta.mat','theta');
        D=2.*h.*cos((pi/180).*theta)./(1-cos((pi/180).*theta));
        
        answer =mean(D);
    end
    
    function [answer]=question6(M)
      X=rand(M,1);
      u=mean(X);
      s=sum((X-u).^2);
        answer = sqrt(s/M);
    end

    function [answer]=question7()
      load('Q7xy.mat','Mdata');
      X=Mdata(:,1);
      Y=Mdata(:,2);
      t=Y./X;
      Z=atan(t);
        answer = Z'*(180/pi);
    end

    function [answer]=question8(N)
      t=0;
      for n=7:N
          for m=-2:n
              t=t+cos(n*m/5);
          end
      end
      answer=t;
    end

    function [answer]=question9(M)
       t=0;
       for m=0:M
           for n=7:17
               for k=n+1:20
                   t=t+(m+2*n+k);
               end
           end
       end
        answer=t;
    end

    function [answer]=question10(K)
        t0=0;
        for k=7:K
            t1=0;
            for m=6:k
                t2=0;
                for n=-2:m
                    t2=t2+sin(n+m);
                end
                t1=t1+m*t2;
            end
            t0=t0+k*t1;
        end
        answer=t0;
    end

    
end
