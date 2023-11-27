%The following code creates a separate class with all the equations for the Laventrovich (2008) model

classdef ModelSystem 
    properties
        params
    end
    
    methods
        function obj = ModelSystem(params)
            if nargin > 0
            obj.params = params;
            end
     end
     function deriv = computeDeriv(obj, apl, t) %apl is the different states but MATLAB is STUPID
            Ca = apl(1);
            Ca_ER = apl(2);
            IP3 = apl(3);
            modelPar = obj.params;
            
            % Intermediate variables 
            v_SERCA = modelPar.v_M2 * Ca^2 / (Ca^2 + modelPar.k_2^2);
            v_PLC = modelPar.v_p * Ca^2 / (Ca^2 + modelPar.k_p^2);
            v_CICR = 4 * modelPar.v_M3 * modelPar.k_CaA^modelPar.n * Ca^modelPar.n ...
                / ( (Ca^modelPar.n + modelPar.k_CaA^modelPar.n) ...
                * (Ca^modelPar.n + modelPar.k_CaI^modelPar.n) ) ...
                * IP3^modelPar.m ...
                / ( (IP3^modelPar.m + modelPar.k_IP3^modelPar.m) ) ...
                * (Ca_ER - Ca);
                
            % dx/dt 
            dCa_per_dt = modelPar.v_in - modelPar.k_out * Ca + v_CICR - v_SERCA ...
                + modelPar.k_f * (Ca_ER - Ca);
            dCa_ER_per_dt = v_SERCA - v_CICR - modelPar.k_f * (Ca_ER - Ca);
            dIP3_per_dt = v_PLC - modelPar.k_deg * IP3;
            
            deriv = [dCa_per_dt; dCa_ER_per_dt; dIP3_per_dt]; %returns column vector
        end
    end
end
