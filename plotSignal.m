function h = plotSignal(n, y, titleName)
% h = plotSignal(n, y, titleName)
%
% plots signal y with index n as a line plot.
% attempts to label axes and adds a title if specified
% returns figure handle h

if ~exist('y', 'var')
    y = n;
    n = 1:length(y);
    
    indName = '';
    sigName = inputname(1);
else
    indName = inputname(1);
    sigName = inputname(2);
end
   
h = gcf;
plot(n, y), xlabel(indName), ylabel(sigName)

if exist('titleName', 'var')
    title(titleName)
end