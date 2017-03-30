function lout=nlayersigpn(x,w,b,noise)
lsz=size(x);
% lll=b'*ones(lsz(1),1)'+w*x'
lll=b'+w*x';
lout=sigpn(lll)'+noise*(rand(lsz(1),1)-0.5);