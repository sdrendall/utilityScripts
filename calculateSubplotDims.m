function dims = calculateSubplotDims(nPlots)
% dims = calculateSubplotDims(nPlots)
%
% Calculates the x and y dimensions for a subplot containin nPlots plots

if nPlots == 1
    dims = [1, 1];
elseif nPlots == 2
    dims = [1, 2];
elseif nPlots <= 6
    dims = [2, 3];
elseif nPlots <= 8
    dims = [2, 4];
else
    dims = [3, 4];
    dimProd = 12;
    while dimProd < nPlots
        dims = dims + [1 , 2];
        dimProd = dims(1)*dims(2);
    end
end