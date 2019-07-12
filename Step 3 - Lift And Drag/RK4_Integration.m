function StateVector = RK4_Integration(StateVector,Object,h)
  
  k1 = h*Derivatives(StateVector,Object);
  k2 = h*Derivatives(StateVector + k1/2,Object);
  k3 = h*Derivatives(StateVector + k2/2,Object);
  k4 = h*Derivatives(StateVector + k3,Object);
  
  StateVector = StateVector + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
  
endfunction
