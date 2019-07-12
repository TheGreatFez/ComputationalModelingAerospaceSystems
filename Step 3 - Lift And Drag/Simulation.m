%% Simulation of Aerospace Systems - Step 3: Paper Airplane with Lift and Drag

% Integration method: 4th Order Runge-Kutta (RK4)

% Assumptions:
% 1. Gravity is constant and uniform
% 2. Ground is flat and located at 0m
% 3. Atmosphere is uniform
% 4. 2-D plane with Y axis as vertical and X axis as horizontal
% 5. Object flys at a constant Angle of Attack referenced to the air velocity

% Object Model: Simple Ball (Sphere)

Object.Name     = "Simple Ball";
Object.Mass     = 0.0045; % kg, Roughly one sheet of paper
Object.RefArea  = 0.0625; % m^2, Standards size of A4 paper
Object.Cd       = 0.03; % Coefficient of Drag
Object.Cl       = 0.19; % Coefficient of Lift

% Object State Vector Initializaiton

P0 = [0,2]; % [Initial X position, Initial Y position]
V0 = [1,0]; % [Initial X velocity, Initial Y velocity]

StateVector = [P0 V0];

% Results is used for plotting

Results.X    = StateVector(1);
Results.Y    = StateVector(2);
Results.Vx   = StateVector(3);
Results.Vy   = StateVector(4);
Results.Time = 0;

% Simulation Variables

dt = 0.05; % sec, time between each tick
ground_height = 0; % m, altitude where object will hit the ground

for i=2:1000 
  % Integrate Next Step
  StateVector = RK4_Integration(StateVector,Object,dt);
  
  % Save Results
  Results.X(i)    = StateVector(1);
  Results.Y(i)    = StateVector(2);
  Results.Vx(i)   = StateVector(3);
  Results.Vy(i)   = StateVector(4);
  Results.Time(i) = dt*(i-1);
  
  % Check if object has hit the ground
  if StateVector(2) < ground_height
    break;
  endif
  
endfor

% Plot Results

plot(Results.X,Results.Y)
grid on
hold on
