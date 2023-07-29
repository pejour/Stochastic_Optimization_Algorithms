function [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax)
    
    wIH = zeros(nHidden,nIn+1);
    i = 1;
    for k = 1:nHidden*(nIn+1)
        j = mod(k,nIn+1);
        if j == 0
            j = nIn+1;
            wIH(i,j) = floor((chromosome(k)*2*wMax) - wMax);
            i = i+1;
        else
            wIH(i,j) = floor((chromosome(k)*2*wMax) - wMax);
        end
    end
    
    wHO = zeros(nOut,nHidden+1);
    i = 1;
    for k = 1:nOut*(nHidden+1)
        j = mod(k,nHidden+1);
        if j == 0
            j = nHidden+1;
            wHO(i,j) = floor((chromosome(k + nHidden*(nIn+1))*2*wMax) - wMax);
            i = i+1;
        else
            wHO(i,j) = floor((chromosome(k + nHidden*(nIn+1))*2*wMax) - wMax);
        end
    end
end
