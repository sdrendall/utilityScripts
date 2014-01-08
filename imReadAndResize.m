function im = imReadAndResize(path, scale)
% image = imReadAndResize(path, scale)
% 
% Default size is .5

if ~exist('scale', 'var')
    scale = .5
end

incoming = imread(path);
im = imresize(incoming, scale);