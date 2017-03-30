clc,clear
xor.smat=[[0 0];[0 1];[1 0];[1 1]];
xor.tmat=[[0 1 1 0]',xor.smat(:,1),xor.smat(:,2)];
n0=initnet3(2,2,1,4,4);
nf=bp3(n0,xor,10000,.1,0);
act10k=forw3(nf,xor);
act10k.out
kolor=[xor.tmat,[0 0 0 0]',1-xor.tmat];
scatter(act10k.hid(:,1),act10k.hid(:,2),300,kolor,'filled')