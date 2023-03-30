function Figure4_2a

close all;
rand('state',15);

[t,z] = ode15s(@myode,[0 2100],[10; 100; 0]);

t=t/60;

figure(1);
set(gca,'Fontsize',18);
plot(t,z(:,1),'k','Linewidth',4);
xlabel('time [min]','interpreter','latex');
ylabel('number of $A$ molecules','interpreter','latex');
hh=legend('solution of ODEs');
set(hh,'interpreter','latex','location','northeast','Fontsize',18);
axis([0 35 0 22]);
set(gca,'Fontsize',18);

function dydt = myode(t,z)
k1=100;
k2=1000;
k3=0.01;
k4=k2*99/10;
k5=1000;
k6=100;
if (t>600)
   k5=500;
end;   
dydt =[k5-k6*z(1); k2*z(3)-k3*z(2); k1-k2*z(3)-k4*z(1)*z(3)];

