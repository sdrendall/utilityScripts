function [paths, filenames] = getPathsRecursive(path, rec, ft, depth)
% [paths, filenames] = getPathsRecursive(path, recursive?, filetype, searchDepth)
% 
% Recursively searches for files of the specified type (images by default)
% starting from the specified directory.  Returns paths and filenames


if ~exist('path', 'var')
    path = uigetdir('~', 'Specify Start Directory');
end

if ~exist('rec', 'var')
    rec = 1;
end

if ~exist('ft', 'var')
    ft = {'jpg','tif' ,'gif','jpeg','png','tiff','JPG','TIF','GIF','JPEG','PNG','TIFF'};
end

if ~exist('depth')
    depth = 0;
end

function paths = searchDirectory(path, rec, ft, depth)
% Main search function
output = dir(path);
