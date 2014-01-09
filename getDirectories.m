function dirPaths = getDirectories(path, includeDot)
% dirPaths = getDirectories(path, includeDot)
%
% Returns paths to directories contained within 'path'
% Entries begining with dot are ommited by default


if ~exist('includeDot', 'dir')
    includeDot = false;
end

% Add a / if there isn't one
if path(end) ~= '/'
    path = [path, '/'];
end

output = dir(path);
output = output([output.isdir]);

if ~includeDot
    output(strncmp({output.name}, '.', 1)) = [];
end

for i = 1:length(output)
    dirPaths{i} = [path, output(i).name];
end