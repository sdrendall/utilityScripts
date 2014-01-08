function croppedImage = cropImage(image, cropWindow)
% croppedImage = cropImage(A, cropWindow)
%
% Crops image (A) to coordinates specified in the array cropWindow
% cropWindow format: [firstRow lastRow firstColumn lastColumn]

croppedImage = image(cropWindow(1):cropWindow(2), cropWindow(3):cropWindow(4),:);