function [struct1, struct2] = reconcileStructureFields(struct1, struct2)
% [struct1, struct2] = reconcileStructureFields(struct1, struct2)
% 
% Given two structures, adds empty fields to each structure such that
% struct1 and struct2 are returned with the same fields

% Check if structures have the same fields
if compareFieldNames(struct1, struct2)
    return
else
    [unique1, unique2] = findUniqueElements(fieldnames(struct1), fieldnames(struct2));
    struct1 = orderfields(appendFields(struct1, unique2));
    struct2 = orderfields(appendFields(struct2, unique1));
end