function flipAndScale(basePath, imageFormat, varargin)
% flipAndScale(pathToImages, imageFormat, {modifiers})
%
% flips and scales images in pathToImages based on user input

% Check input
if ~exist('basePath', 'var') || (exist('basePath', 'var') && isempty(basePath))
    basePath = uigetdir('~', 'Specify Image Containing Directory');
end
checkPathSlash(basePath);

if ~exist('imageFormat', 'var')
    imageFormat = 'tif';
end

% Propmpt for scale
scale = input('Enter scale factor (as percentage, omit % symbol)> ')/100;

% Get image paths
images = searchForImages(basePath, imageFormat);

% Create output directories
images = createOutputDirectories(images, basePath);

% Loop in parallel so this goes a bit faster
parfor iIm = 1:length(images)
    % Load image
    currIm = imread(images(iIm).path);
    
    % Resize image
    currIm = imresize(currIm, scale);
    
    % Flip image
    currIm = currIm(end:-1:1, :, :);
    
    % Save image
    imwrite(currIm, [images(iIm).outputPath, images(iIm).name, '_resized-', num2str(scale), '.jpg'])
end



%----------------------------Internal Functions---------------------------%
function images = createOutputDirectories(images, basePath)
% Create a main output directory
outputPath = uigetdir(basePath, 'Specify output directory');
outputPath = checkPathSlash(outputPath);
mkdir(outputPath)
% Create an output directory for each unique input directory
uniqueParentDirectories = getUniqueCells({images(:).originalDirName});
images = addOutputDirectories(images, uniqueParentDirectories, outputPath);
for iDir = 1:length(uniqueParentDirectories)
    currOutputPath = checkPathSlash([outputPath, uniqueParentDirectories{iDir}]);
    mkdir(currOutputPath)
end

function images = addOutputDirectories(images, parentDirectoryNames, baseOutputPath)
% Add an outputPath field to images
images = appendFields(images, 'outputPath');
for iIm = 1:length(images)
    nNames = length(parentDirectoryNames);
    currParDirName = [];
    for iName = 1:nNames
        % Find correct output name
        if strcmp(images(iIm).originalDir(end-length(parentDirectoryNames{iName}):end-1), parentDirectoryNames(iName))
            currParDirName = parentDirectoryNames{iName};
        end
    end
    % Throw warning if a name wasn't chosen
    if isempty(currParDirName)
        warning(['Something went wrong... iIm: ', num2str(iIm)])
    end
    % Add name
    images(iIm).outputPath = checkPathSlash([baseOutputPath, currParDirName]);
end


