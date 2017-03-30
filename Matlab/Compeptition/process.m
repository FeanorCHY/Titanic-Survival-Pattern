function data=process(init)
    n=size(init,2);
    %?????????
    min1=min(init);
    max1=max(init);
    for i=1:n
        init(:,i)=(init(:,i)-min1(1,i))/(max1(1,i)-min1(1,i));
    end
    data=init;
end