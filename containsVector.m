function TF = containsVector(cellArray)
% TF = containsVector(cellArray)
%
% Checks each cell in a given cell array contains a vector (i.e. not a matrix) and returns a logical array TF
% stating whether or not the cell at a given index contains a vector

if ~iscell(cellArray)
    warning(['containsVector:: ' inputname(1), ' is not a cell array.'])
    return
else
    
    TF = false(size(cellArray));
    for iCell = 1:length(cellArray)
        TF(iCell) = isvector(cellArray{iCell});
    end
end