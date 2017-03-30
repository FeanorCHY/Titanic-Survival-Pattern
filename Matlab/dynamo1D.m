function ptseq = dynamo1D(alpha,initial,step,niter)
 ptseq=[0 initial] ;
 curr = initial ;
 for i=1:niter
    curr=curr+step*alpha*curr ;
    ptseq=[ptseq;[i curr]] ;
 end
 figure;
plot(ptseq(:,1),ptseq(:,2)) ;
end
