function [imagePaths, filenames] = getImagePath(path, filetypes)
% [imagePaths, filenames] = getImagePath(path, filetype);
%
% prompts user for image containing directory if none specified
% 
% loads files ending in .(jpg, tif, gif, jpeg, png, and tiff) unless
% another filetype is specified
%
% Returns cell arrays of image paths and image filenames
% 


% prompt for image path
if ~exist('path', 'var')
    path = uigetdir('~/Pictures/hcccTimelapsesForJin/', 'Specify Image Containing Directory');
end

% prompt for filetype
if ~exist('filetype', 'var')
    filetypes = {'jpg','tif' ,'gif','jpeg','png','tiff','JPG','TIF','GIF','JPEG','PNG','TIFF'};
end

% remove '.'from filetype
filetypes = strrep(filetypes, '.', '');

% read files, return names
files = dir(strcat(path, '/*.', filetypes{1})); % create files array
for iFiletype = 2:length(filetypes)
    files = [files, dir(strcat(path, '/*.', filetypes{iFiletype}))];  % read file info
end

% check for files
if min(size(files)) == 0
    errordlg('No images of supported filetypes found in specified directory');
    return
end
  
% return names
for i = 1:length(files)
    filenames{i} = files(i).name;
    imagePaths{i} = [path, '/', files(i).name];  % return paths
end