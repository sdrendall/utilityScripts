function dims = calculateSubplotDims(nPlots, orientation)
% dims = calculateSubplotDims(nPlots, orientation)
%
% Calculates the x and y dimensions for a subplot containin nPlots plots
%
% Orientation can be hor (horizontal) or ver (vertical)

if ~exist(orientation)
    orientation = 'hor';
end

switch lower(orientation)
    case {'ver','vertical'}
        if nPlots <= 5
            dims = [nPlots, 1];
        elseif nPlots == 6
            dims = [3, 2];
        elseif nPlots <= 8
            dims = [4, 2];
        else
            dims = [4, 3];
            dimProd = 12;
            while dimProd <= nPlots
                dims = dims + [2 , 1];
                dimProd = dims(1)*dims(2);
            end
        end
        
        
        
        
    case {'hor', 'horizontal'}
        if nPlots >= 1 && nPlots < 6
            dims = [1, nPlots];
        elseif nPlots <= 6
            dims = [2, 3];
        elseif nPlots <= 8
            dims = [2, 4];
        else
            dims = [3, 4];
            dimProd = 12;
            while dimProd <= nPlots
                dims = dims + [1 , 2];
                dimProd = dims(1)*dims(2);
            end
        end
end
end