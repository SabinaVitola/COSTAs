%The following code stores COSTAs' parameters in a separate class to be called on by the App when it is run.
%Please see *COSTAs variables report* for more information on where the values come from.

classdef ModelParameters
  properties (Access = public ) %giving app access to the properties  
        k_2 = 0.1     % uM -- Hill equation hmr for Vserca
        k_CaA = 0.15  % uM AG --Vplc Remove until figure out oscillatory b--try overdamping with some Sines
        k_CaI = 0.15  % uM  AG --Vplc Remove ^
        k_deg = 0.08  % 1/s -- deg of IP3 
        k_f = 0.5     % 1/s -- Leak flux from ER to C ADD
        k_IP3 = 0.1   % uM -- -- Hill equation hmr2 for Vcicr
        k_out = 0.5   % 1/s AG ADD 
        k_p = 0.3     % uM NG Remove^-- Hill equation hmr for Vplc
        m = 2.2
        n = 2.02      %AG
        v_in = 0.05   % uM/s AG -- C
        v_M2 = 15     % uM/s AG -- Max for Vserca 
        v_M3 = 40     % 1/s AG --Max for Vcicr
        v_p = 0.05    % uM/s --Max for Vplc
    end
end

