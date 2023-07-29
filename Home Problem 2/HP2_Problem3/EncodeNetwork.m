function chromosome = EncodeNetwork(wIH, wHO, wMax)
    
    [nHidden, nIn] = size(wIH);
    [nOut, nHiddenbis] = size(wHO);
    % the weights in both matrices are in the range [-wMax, wMax]
    chromosome = [];
    % the genes of the chromosome should take values in the range [0,1]
    for i=1:nHidden
        for j=1:nIn
            chromosome = [chromosome (wIH(i,j)+wMax)/(2*wMax)];
        end
    end
    for i=1:nOut
        for j=1:nHiddenbis
            chromosome = [chromosome (wHO(i,j)+wMax)/(2*wMax)];
        end
    end
    

end