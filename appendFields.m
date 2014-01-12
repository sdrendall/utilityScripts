function struct = appendFields(struct, unique)
% struct = appendFields(struct, unique)
%
% Adds empty fields with names specified by string or cell array of strings unique to structure struct

% unpack cells
if iscell(unique)
    for iField = 1:length(unique)
        struct = appendFields(struct, unique{iField});
    end
% add strings
elseif ischar(unique)
    struct = setfield([struct(:)], {1}, unique, []);
else
    warning('"appendFields" does not accept inputs of class: ', class(unique));
end