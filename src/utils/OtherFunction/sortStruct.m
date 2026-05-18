function struct = sortStruct(struct, field, direction)
%SORTSTRUCT Sort struct by a field name
%   A = SORTROWS(struct,field,DIRECTION). 
%   STRUCT is the structure that we want sort. 
%   FIELD is the field that sorting is affect.
%   DIRECTION must be:
%       'ascend'  - Sorts in ascending order.
%       'descend' - Sorts in descending order
   r = [];
   c = [];
   fn = fieldnames(struct);
   for row=1:numel(fn)
       [r(row),c(row)] = size(struct.(fn{row}));
       if r(row) > c(row)
           struct.(fn{row}) = transpose(struct.(fn{row}));
       end
   end
   
   for row = 1:numel(fn)
       if strcmp(field,fn{row})
           break;
       end
   end
   mat = transpose(cell2mat(struct2cell(struct)));
   mat = transpose(sortrows(mat,row,direction));
   
   for k=1:numel(fn)
       struct.(fn{k}) = mat(k,:);
       if r(k) > c(k)
           struct.(fn{k}) = transpose(struct.(fn{k}));
       end

   end
    
end