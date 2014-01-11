function fieldNamesMatch = compareFieldNames(struct1, struct2)
% fieldNamesMatch = compareFieldNames(struct1, struct2)
%
% Checks if struct1 and struct2 have the same fields 

names1 = fieldnames(orderfields(struct1));
names2 = fieldnames(orderfields(struct2));

fieldNamesMatch = strcmp([names1{:}], [names2{:}]);