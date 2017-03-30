function [rLabel]=reformatMultiClass(label,classNum)
    [m,n] = size(label);
    rLabel = rand(m,n);
    for i = 1:m
        temp = label(i,1);
        if temp==classNum
            rLabel(i,1)=1;
        else
            rLabel(i,1)=0;
        end
    end
end
    