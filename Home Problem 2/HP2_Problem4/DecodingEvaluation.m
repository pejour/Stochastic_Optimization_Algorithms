function dataResult = DecodingEvaluation(chromosome, functionData, A, R)
    dataResult = [];
    for k = 1:length(functionData)
        xk = functionData(k,1);
        R = [xk 0 0];
        A(1:length(R)) = R;

        for i=1:length(chromosome)/4
            indexStart = (i-1)*4+1;

            %destRegister = R(chromosome(indexStart+1));
            operand1 = A(chromosome(indexStart+2));
            operand2 = A(chromosome(indexStart+3));
            
            if chromosome(indexStart+1)==1
                if chromosome(indexStart) == 1
                    R(1) = operand1 + operand2;
                elseif chromosome(indexStart) == 2
                    R(1) = operand1 - operand2;
                elseif chromosome(indexStart) == 3
                    R(1) = operand1 * operand2;
                elseif operand2 ~= 0
                    R(1) = operand1 / operand2;
                end
                
            elseif chromosome(indexStart+1)==2
                if chromosome(indexStart) == 1
                    R(2) = operand1 + operand2;
                elseif chromosome(indexStart) == 2
                    R(2) = operand1 - operand2;
                elseif chromosome(indexStart) == 3
                    R(2) = operand1 * operand2;
                elseif operand2 ~= 0
                    R(2) = operand1 / operand2;
                end
                
            else
                if chromosome(indexStart) == 1
                    R(3) = operand1 + operand2;
                elseif chromosome(indexStart) == 2
                    R(3) = operand1 - operand2;
                elseif chromosome(indexStart) == 3
                    R(3) = operand1 * operand2;
                elseif operand2 ~= 0
                    R(3) = operand1 / operand2;
                end
            end
            
            %R(chromosome(indexStart+1)) = destRegister;
            A(1:length(R)) = R;
        
        end
        yk = R(1);
        dataResult = [dataResult ; [xk yk]];
    end
end

