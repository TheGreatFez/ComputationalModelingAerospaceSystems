function StateVector = RK4_Integration(StateVector,h)
  
  k1 = h*Derivatives(StateVector);
  k2 = h*Derivatives(StateVector + k1/2);
  k3 = h*Derivatives(StateVector + k2/2);
  k4 = h*Derivatives(StateVector + k3);
  
  StateVector = StateVector + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
  
endfunction
