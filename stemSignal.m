function h = stemSignal(n, y, titleName)
% h = stemSignal(n, y, 'title')
%
% plots signal y indexed by n as a stem plot.  Labels axis and title,
% returns figure handle
if ~exist('y', 'var')
    y = n;
    n = 1:length(y);
    sigName = inputname(1);
    indName = '';
else
    sigName = inputname(2);
    indName = inputname(1);
end


h = gcf;
stem(n, y, 'fill'), xlabel(indName), ylabel(sigName)

if exist('titleName', 'var')
    title(titleName)
end
