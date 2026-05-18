function body = generateTableHtml(T)
    nomiRigheT = T.Properties.RowNames;
    nomiColonneT = T.Properties.VariableNames;
    T = table2array(T);
    body = "<table class='table-format'>";
    body = body + newline + "<tr>";
    for i = 1:numel(nomiColonneT)+1
        if(i>1)
            prova = sprintf(body + newline + "<th>"+nomiColonneT(i-1)+"</th>");
            body = prova;
        else
            body = body + newline + "<th></th>";
        end
    end
    body = body + newline + "</tr>";
    for i = 1:numel(nomiRigheT)
        body = body + newline + "<tr>";
        for j = 1:numel(nomiColonneT)+1
            if(j > 1)
                body = body + newline + "<td>"+T(i,j-1)+"</td>";
            else
                body = body + newline + "<th>"+nomiRigheT(i)+"</th>";
            end
        end
        body = body + newline + "</tr>";
    end
    body = body + newline + "</table>";
end
