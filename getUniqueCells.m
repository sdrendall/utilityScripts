function uniqueCells = getUniqueCells(cells)
% uniqueCells = getUniqueCells(cells)
%
% searches input 'cells' for cells containing unique values (strings only
% at the moment) and returns a new cell array containing only one of each
% of those values

% Initialize
nCells = length(cells);
uniqueCells = cells(1);

% Find Unique Cells
if nCells > 1
    for iCell = 2:nCells
        if ~strcmp(cells{iCell}, uniqueCells)
            uniqueCells(end+1) = cells(iCell);
        end
    end
end