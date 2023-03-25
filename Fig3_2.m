function a2zero_zero2a

rand('state',1);

k1 = 0.1;
k2 = 1; 

Ainitial = 0;
n_realizations = 5;


for i=1:n_realizations
    
    A=Ainitial;
    t = 0;
    k=1;
    A_array = [Ainitial];
    n_steps = 1;

    while (k<1000)
        rr=rand(2,1);
        total_prob = k1*A+k2;
        t=t+(1/total_prob)*log(1/rr(1));
        
        if (rr(2)*total_prob<k1*A)
            A=A-1;

            else
                A=A+1;
            end 

        k=k+1;
        Aplot(k,i)=A;
        timeplot(k,i)=t;
        
        end   
end

tdet=zeros(501,1);
Adet=zeros(501,1);
tdet=[0:0.2:100];
Adet(:)=(Ainitial-k2/k1)*exp(-k1*tdet(:))+k2/k1;

figure(1);
set(gca,'Fontsize',18);
plot(tdet,Adet,'--k','Linewidth',4);
hold on
h=stairs(timeplot(:,1),Aplot(:,1));
set(h,'Color','m','Linewidth',1);
h=stairs(timeplot(:,2),Aplot(:,2));
set(h,'Color','r','Linewidth',1);
h=stairs(timeplot(:,3),Aplot(:,3));
set(h,'Color','g','Linewidth',1);
h=stairs(timeplot(:,4),Aplot(:,4));
set(h,'Color','b','Linewidth',1);
h=stairs(timeplot(:,5),Aplot(:,5));
set(h,'Color','c','Linewidth',1);
plot(tdet,Adet,'--k','Linewidth',4);
xlabel('time [sec]','interpreter','latex');
ylabel('number of molecules','interpreter','latex');
axis([0 100 0 20]);
set(gca,'Fontsize',18);






