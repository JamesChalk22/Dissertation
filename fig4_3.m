function Figure4_3

rand('state',15);

k1=100;
k2=1000;    
k3=0.01;  
k4=9900;   

for i=1:5

  A=10;
  B=100;
  C=0;
  time=0;
    
  for kk=1:2100
      while (time<kk*1)
           if (time>600) 
               A=5;
           end   
           r=rand(2,1);
           a0=k1+k2*C+k3*B+k4*A*C;
           tau=(1/a0)*log(1/r(1));
           ss=k1;     
           if (ss>r(2)*a0)
              C=C+1;
           else
              ss=ss+k2*C;
              if (ss>r(2)*a0)
                 C=C-1;
                 B=B+1;
              else
                 ss=ss+k3*B;
                 if (ss>r(2)*a0)
                    B=B-1;
                 else
                    ss=ss+k4*A*C;
                    if (ss>r(2)*a0)
                       C=C-1;
                    end
                 end
              end
           end
           time=time+tau;
      end
      bend(kk,i)=B;
      tend(kk,i)=time/60;
  end
end

[t,z] = ode15s(@myode,[0 2100],[100; 0]);

t=t/60;

figure(2);
set(gca,'Fontsize',18);
plot(t,z(:,1),'k','Linewidth',4);
hold on;
plot(tend(:,1),bend(:,1),'b');
plot(tend(:,1),bend(:,2),'r');
plot(tend(:,1),bend(:,3),'g');
plot(tend(:,1),bend(:,4),'m');
plot(tend(:,1),bend(:,5),'c');
plot(t,z(:,1),'k','Linewidth',4);
xlabel('time [min]','interpreter','latex');
ylabel('number of $B$ molecules','interpreter','latex');
axis([0 35 50 300]);
set(gca,'Fontsize',18);

function dydt = myode(t,z)
k1=100;
k2=1000;
k3=0.01;
k4=9900;
A=10;
if (t>600)
   A=5;
end
dydt =[k2*z(2)-k3*z(1); k1-k2*z(2)-k4*A*z(2)];

