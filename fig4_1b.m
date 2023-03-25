function Steadystates2

rand('state',15);

k1=0.00025;
k2=0.18;
k3=37.5;
k4=2200;

X=0;
t=0;
ssat=0;
count=0;

while (t<200)
   ssatprev=ssat; 
   ssatpost=500;
   count=count+1;
   while (ssat<ssatprev+ssatpost)
      r=rand(2,1);
      ssat=ssat+1;
      a0=k1*X*(X-1)*(X-2)+k2*X*(X-1)+k3*X+k4;
      tau=(1/a0)*log(1/r(1));
      if (r(2)*a0<(k2*X*(X-1)+k4))
          X=X+1;
      else
          X=X-1;
      end
      t=t+tau;
   end;     
XX(count)=X;
tt(count)=t;
end

figure(1);
set(gca,'Fontsize',18);
hold on;
h=plot(tt,XX);
set(h,'Color','b','Linewidth',1);
yline(100,'-',"LineWidth",2);
yline(400,'-',"LineWidth",2);
yline(220,'--','LineWidth',2);
xlabel('time [min]','interpreter','latex');
ylabel('number of $A$ molecules','interpreter','latex');
axis([0 200 0 500]);