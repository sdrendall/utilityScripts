function r = rpar(rin)
    %% r = rpar(rin)
    %
    % Accepts a vector of resistance values, and returns the equivalent resistance
    % of the set of resistances in parellel

    r = 1/sum(rin.^-1);
    