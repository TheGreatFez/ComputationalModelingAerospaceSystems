function StateVector_Dot = Derivatives(StateVector,Object)
  Velocity = StateVector(3:4);
  
  R_DtoL   = [ 0 -1;
               1  0]; % Rotation Matrix from Drag vector to Lift vector
  Speed = norm(Velocity);
  P_dot = Velocity; % The derivative of position is velocity
  
  Gravity = [0 -9.81]; % Acceleration due to gravity
  
  Density = 1.225; % kg/m3, Density of Standard Air
  Q       = 0.5*Density*Speed^2; % Dynamic Pressure
  [Cd,Cl] = AeroCalcs(Object.Alpha);
  Drag    = Object.RefArea*Cd*Q; % Drag Force
  Lift    = Object.RefArea*Cl*Q; % Lift Force
  
  Drag_vec_norm = -Velocity/Speed; % Drag acts against velocity
  Lift_vec_norm = Drag_vec_norm*R_DtoL; % Lift acts perpendicular to velocity
  
  V_dot   = Gravity + Drag_vec_norm*Drag/Object.Mass + Lift_vec_norm*Lift/Object.Mass;
  
  
  StateVector_Dot = [P_dot V_dot];
  
endfunction
