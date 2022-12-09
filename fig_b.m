function fig_a

close all;
rand('state', 10)

%first we set our initial variables, k = rate of decay, A = number of
%molecules, delta t is is our time-step, noruns = number of times to run
%the simulation
k1=0.1;
Ainitial=20;
noruns=10;

%I will then create a for loop which will run norun times from time=0 until
%time=time+dt (this example has only 1 run, but I am building this now to be able to quickly change the number of
%real*isations in future figures)

for i=1:noruns

    A=Ainitial;
    time=0;
    k=1; %k is our iteration counter variable
    Aplot(1,i)=A;
    timeplot(1,i)=0;
    %these variables create 1:i matrices which store the current values of
    %A and delta t. They will be used to store the results of our loop inside

    while (k<Ainitial+1) %A while loop continuously runs a command as long as the initial conditions
                         %remains true, in this example that is while k<Ainitial+1 or k<51
        rr=rand(2,1);
        a0=k1*A;
        time=time+(1/a0)*log(1/rr(1));
        A=A-1;
        k=k+1;
        Aplot(k,i)=A;
        timeplot(k,i)=time;
    end %once k>Ainitial+1, we have run out of molecules and the while loop can end
    Aplot(k+1,i)=A; 
    timeplot(k+1,i)=time;  
end

tdet=zeros(301,1);
Adet=zeros(301,1);
tdet=[0:0.1:30]; %creates a vector from 0 to 80 with a step of 0.1. These are our X co-ordinates
Adet(:)=Ainitial*exp(-k1*tdet(:)); %vector of positions (mean) with Aintial as the y intercept, k1=0.1 

figure(1);
set(gca,'Fontsize',18);
plot(tdet,Adet,'k--','Linewidth',4);
hold on
h=stairs(timeplot(:,5),Aplot(:,5));
set(h,'Color','c','Linewidth',1);
h=stairs(timeplot(:,7),Aplot(:,7));
set(h,'Color','k','Linewidth',1);
h=stairs(timeplot(:,8),Aplot(:,8));
set(h,'Color','g','Linewidth',1);
h=stairs(timeplot(:,9),Aplot(:,9));
set(h,'Color','r','Linewidth',1);
h=stairs(timeplot(:,10),Aplot(:,10));
set(h,'Color','b','Linewidth',1);
plot(tdet,Adet,'k--','LineWidth',4);
xlabel('time [sec]','interpreter','latex');
ylabel('number of molecules','interpreter','latex');
hh=legend('mean');
set(hh,'interpreter','latex','Fontsize',18);
axis([0 55 0 (Ainitial+1)]);
set(gca,'Fontsize',18);
