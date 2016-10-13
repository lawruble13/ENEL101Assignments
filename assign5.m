function [solutions,info]=assign5(factor)

info.FirstName='Liam';
info.LastName='Wrubleski';
info.UCID='10168579';%without your correct UCID here you cannot get a mark



n0=5;
solutions(1).ans=question1(n0*factor);
n0=30;
solutions(2).ans=question2(n0*factor);
X0=0.5;
s0(1).operation='invert';
s0(2).operation='root2';
s0(3).operation='none'; 
solutions(3).ans=question3(X0*factor,s0);
solutions(4).ans=question4();
V0=0.1; R0=600; L0=0.14;
solutions(5).ans=question5(V0*factor,R0,L0);
x0=1.1*2*pi;
solutions(6).ans=question6(x0*factor)
P0=5;
solutions(7).ans=question7(P0*factor)
f= @(x) x^2*exp(x);
x0=0.25;
solutions(8).ans=question8(f,x0*factor)

    function [answer]=question1(n)
        t=zeros(3,n);
        for i=1:3
            for j=1:n
                t(i,j)=(i^j)/(i+j);
            end
        end
        answer=t;
    end

    function [answer]=question2(n)
        f=ones(1,n);
        for i=3:n
            f(i)=f(i-1)+f(i-2);
        end
        t=ones(1,n);
        for j=1:n
            t(j)=sum(1./f(1,1:j));
        end
        answer=t;
    end

    

    function [answer]=question3(x,s) 
        r=zeros(1,length(s));
        for i=1:length(s)
           switch s(i).operation
               case 'invert'
                   r(i)=1/x;
               case 'root2'
                   r(i)=sqrt(x);
               otherwise
                   r(i)=0;
           end
        end
        answer=r;
    end

    function [answer]=question4()
      n=20;
      t=[];
      for a=1:n
          for b=1:n
              c=sqrt(a*a+b*b);
              if((mod(c,1)==0) && (c<n))
                  t=[t;[a b c]];
              end
          end
      end
      answer=t;
    end

    function [answer]=question5(Vratio,R,L)
        w=(sqrt((1/abs(Vratio))^2 - 1)*R/L);
        answer=w;
    end
    
    function [answer]=question6(x)
      while(x < -2*pi)
          x=x+2*pi;
      end
      while(x > 2*pi)
          x=x-2*pi;
      end
      e=1;
      n=0;
      Sp=0;
      a=0;
      S=0;
      while e >= 0.000001
          Sp=S;
          a=((-1)^n)*x^(2*n)/(factorial(2*n));
          S=S+a;
          e=abs(a/Sp);
          n=n+1;
      end
      answer=[S n-1];
    end

    function [answer]=question7(P)
      e=1;
      n=0;
      x=P;
      while e >= 0.000001
          xp=x;
          a=-(x^5-P)/(5*x^4)
          x=x+a;
          e=abs(a/xp);
          n=n+1;
      end
      answer=[x n];
    end
     
    function [answer]=question8(f,x)
      h=x/10;
      n=f(x-2*h)-f(x-h)+f(x+h)-f(x+2*h);
      d=12*h;
      answer=[n d n/d];
    end
end
