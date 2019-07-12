function Results = Sim_Func(Object)
  
  P0 = [0,10]; % [Initial X position, Initial Y position]
  V0 = [10,0]; % [Initial X velocity, Initial Y velocity]
  
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
endfunction
