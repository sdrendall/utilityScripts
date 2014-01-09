function path = checkPathSlash(path)
% pathWithTrailingBackslash = checkPathSlash(path)
%
% checks if a string (typically a path) has a trailing backslash, if it doesn't, adds one

if path(end) ~= '/'
    path = [path, '/'];
end   