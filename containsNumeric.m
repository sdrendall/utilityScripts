function TF = containsNumeric(cellArray)
% TF = containsNumeric(cellArray)
%
% Checks each cell in a given cell array contains a numeric object and
% returns a logical array TF of size(cellArray)

if ~iscell(cellArray)
    warning(['containsNumeric:: ' inputname(1), ' is not a cell array.'])
    return
else
    
    TF = false(size(cellArray));
    for iCell = 1:length(cellArray)
        TF(iCell) = isnumeric(cellArray{iCell});
    end
end