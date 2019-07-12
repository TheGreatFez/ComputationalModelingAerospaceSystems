function [Cd, Cl] = AeroCalcs(Alpha)
  Cd = 0.04 + (Alpha/30).^2; 
  Cl = Alpha*(0.19/15);
endfunction
