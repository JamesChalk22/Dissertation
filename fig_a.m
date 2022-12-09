function fig_a

rand('state', 10)

%first we set our initial variables, k = rate of decay, A = number of
%molecules, delta t is is our time-step, noruns = number of times to run
%the simulation
k1=0.1;
Ainitial=50;
deltat=0.001;
noruns=1;

%I will then create a for loop which will run norun times from time=0 until
%time=time+dt (this example has only 1 run, but I am building this now to be able to quickly change the number of
%real*isations in future figures)

for i=noruns

    A=Ainitial;
    k=1; %k is our iteration counter variable
    time=0;
    Aplot(1,i)=A;
    timeplot(1,i)=0;
    %these variables create 1:i matrices which store the current values of
    %A and delta t. They will be used to store the results of our loop inside

    while (k<Ainitial+1) %A while loop continuously runs a command as long as the initial conditions
                         %remains true, in this example that is while k<Ainitial+1 or k<51

        random=rand(1,1); %creates a 1 by 1 matrix of random numbers

        time = time+deltat; %increases my timestep by 0.001 each iteration

        if (random<k1*A*deltat) %if my random number from line 31 < my probability then,
            A=A-1; %decay has occured, remove 1 A from the system
            k=k+1; %add 1 to the count
            Aplot(k,i)=A; %increase the size of our matrix matrix and add our new A value
            timeplot(k,i)=time;
        end %if random number > my probability, end the loop, do not add 1 to the count
    end %once k>Ainitial+1, we have run out of molecules and the while loop can end
    Aplot(k+1,i)=A; 
    timeplot(k+1,1)=time;  
end

figure('name','Single Realistation');
set(gca,'Fontsize',18);
h=stairs(timeplot,Aplot); %create a stairstep graph with the elements in Aplot at the positions in 
                                    %timeplot so we will have a new data point at each decay and it will be 
                                    %plotted against each timestep.

hold on; %this keeps all lines present in the graph

mean=[0:0.1:80]; %creates a vector from 0 to 80 with a step of 0.1. These are our X co-ordinates
Adet(:)=Ainitial*exp(-k1*mean(:)); %vector of positions (mean) with Aintial as the y intercept, k1=0.1. 
                                   %This is my ODE, solved using the Poisson Distribution

plot(mean,Adet,'k--','Linewidth',4); %plots my ODE

set(h,'Color','b','Linewidth',2);
xlabel('time [sec]','interpreter','latex');
ylabel('number of molecules [A]','interpreter','latex');
leg=legend('simulation realization', 'mean');
set(leg,'interpreter','latex','Fontsize',18);
axis([0 time+5 0 (Ainitial+1)]);
set(gca,'Fontsize',18); %53-61 is setting beautification of the plot