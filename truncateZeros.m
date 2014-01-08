function [y, ny] = truncateZeros(x, nx)
% [y, ny] = truncateZeros(x, nx)
% returns a vector y which consists of the values from vector x begining
% with the first non-zero value and ending with the last non-zero value
%
% For Example:
% x = [0 0 0 3 0 5 4 2 0 0 0]
% y = truncateZeros(x)
% y = 3 0 5 4 2
%
% If a vector nx containing a list of discrete indicies for the values of x is specified, a vector 
% ny is returned containing the corresponding set of indicies for y

if exist('nx', 'var')
    ny = nx(find(x,1,'first'):find(x,1,'last'));
end

y = x(find(x,1,'first'):find(x,1,'last'));