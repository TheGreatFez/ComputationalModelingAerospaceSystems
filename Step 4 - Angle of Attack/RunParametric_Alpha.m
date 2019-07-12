
Object.Name     = "Simple Ball";
Object.Mass     = 0.0045; % kg, Roughly one sheet of paper
Object.RefArea  = 0.0625; % m^2, Standards size of A4 paper
Object.Alpha    = 0;    % Degrees, Angle of Attack

Alphas = linspace(0,15);

for i=1:length(Alphas)
  Object.Alpha = Alphas(i);
  [Cd(i),Cl(i)] = AeroCalcs(Alphas(i));
  Results = Sim_Func(Object); 
  Final_Dist(i) = Results.X(end);  
endfor

plot(Alphas,Final_Dist)
grid on

figure(2)
plot(Alphas,Cl,Alphas,Cd)
grid on

figure(3)
plot(Alphas,Cl./Cd)
grid on