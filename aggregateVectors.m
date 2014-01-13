function M = aggregateVectors(varargin)
% M = aggregateVectors(vector1, vector2, ..., vectorn, {'modifiers'})
%
% Takes an arbitrary number of input vectors and aggregates them into a
% single matrix.  Handles vectors of disparate lengths by inserting NaN 
%
% Vertically orients vectors before horizontal concatenation by default

vectors = varargin(containsVector(varargin));
vectors = vectors(containsNumeric(vectors));

if isempty(vectors)
    warning('aggregateVectors:: No numeric vectors found in input')
    return
end

% Allocate memory
nVectors = length(vectors);
vectorLength = zeros(1, nVectors);

% Orient vectors and find longest vector
for iVect = 1:nVectors
    if isrow(vectors{iVect})
        vectors{iVect} = vectors{iVect}';
    end
    vectorLength(iVect) = length(vectors{iVect});
end

maxVectorLength = max(vectorLength);

% Allocate memory
M = zeros(maxVectorLength, nVectors);

% Resize vectors shorter than the longest
% Then, unpack vectors
for iVect = 1:nVectors
    % Resize
    if vectorLength(iVect) < maxVectorLength
        vectors{iVect}(end + 1:maxVectorLength) = NaN;
    end
    
    % Unpack
    M(:,iVect) = vectors{iVect};
end
    