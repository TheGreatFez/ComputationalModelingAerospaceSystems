function StateVector_Dot = Derivatives(StateVector,Object)
  Velocity = StateVector(3:4);
  Speed = norm(Velocity);
  P_dot = Velocity; % The derivative of position is velocity
  
  Gravity = [0 -9.81]; % Acceleration due to gravity
  
  Density = 1.225; % kg/m3, Density of Standard Air
  Q       = 0.5*Density*Speed^2; % Dynamic Pressure
  Drag    = Object.RefArea*Object.Cd*Q; % Drag Force
  
  Velocity_norm = Velocity/Speed; % Drag acts against velocity
  
  V_dot   = Gravity - Velocity_norm*Drag/Object.Mass; 
  
  StateVector_Dot = [P_dot V_dot];
  
endfunction
