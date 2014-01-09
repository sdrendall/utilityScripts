function output = dirNoDot(path, infoType)
% output = dirNoDot(path, infoType)
%
% Returns values of the 'dir' function with entries begining with '.'
% removed
%
% infoType is a string denoting the type of information that 
% will be returned

if ~exist('infoType', 'var')
    infoType = [];
end

output = dir(path);
output(strncmp({output.name}, '.', 1)) = [];

% Filters out unwanted info
switch lower(infoType)
    case {'d', 'dir', 'dirs', 'directory', 'directories'}
        output = output([output.isdir]);
    case {'f', 'file', 'files'}
        output = output(~[output.isdir]);
    otherwise
        return
end