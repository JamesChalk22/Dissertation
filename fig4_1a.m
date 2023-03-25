function Steadystates1

rand('state',15);

k1=0.00025;
k2=0.18;
k3=37.5;
k4=2200;

X=0;
t=0;
ssat=0;
count=0;

while (t<2)
   ssatprev=ssat; 
   ssatpost=1;
   count=count+1;
   while (ssat<ssatprev+ssatpost)
      rr=rand(2,1);
      ssat=ssat+1;
      a0=k1*X*(X-1)*(X-2)+k2*X*(X-1)+k3*X+k4;
      tau=(1/a0)*log(1/rr(1));
      if (rr(2)*a0<(k2*X*(X-1)+k4))
          X=X+1;
      else
          X=X-1;
      end
      t=t+tau;
   end;     
XX(count)=X;
tt(count)=t;
end

[t,z] = ode45(@myode,[0 2],[0]);

figure(2);
set(gca,'Fontsize',18);
hold on;
h=stairs(tt,XX);
set(h,'Color','b','Linewidth',1);
plot(t,z,'black--','Linewidth',3);
xlabel('time [min]','interpreter','latex');
ylabel('number of $A$ molecules','interpreter','latex');
axis([0 2 0 200]);
set(gca,'Fontsize',18);

function dydt = myode(t,z)
k1=0.00025;
k2=0.18;
k3=37.5;
k4=2200;
dydt = [-k1*z(1)*z(1)*z(1)+k2*z(1)*z(1)-k3*z(1)+k4];
