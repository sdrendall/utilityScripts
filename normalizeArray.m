function N = normalizeArray(A, expand)
% N = normalizeArray(A, expand)
%
% Normalizes the elements in array A from 0 to 1
% Sets the lowest value of N to 0 if expand is true

if exist('expand', 'var') && expand
    A = A - min(A(:));
end

N = A/max(A(:));