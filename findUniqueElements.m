function [list1, list2] = findUniqueElements(list1, list2)
% [unique1, unique1] = findUniqueElements(list1, list2)
%
% Given two cell arrays of strings, list1 and list2, returns unique1 and
% unique2, which are lists containin the unique elements of list1 and list2
% respectively

for iEle = length(list1):-1:1
    struct2HasName = strcmp(list1{iEle}, list2);
    if max(struct2HasName)
        list1(iEle) = [];
        list2(struct2HasName) = [];
    end 
end