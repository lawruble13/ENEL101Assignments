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
      answer=zeros(3,n);
    end

    function [answer]=question2(n)
      answer=zeros(1,n);
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
      answer=0;
    end
    
    function [answer]=question6(x)
      answer=[0 0];
    end

    function [answer]=question7(P)
      answer=0;
    end
     
    function [answer]=question8(f,x)
      answer=0;
    end
end
