function finalnet=bp3(net0,patstr,niter,eta,nlev)
netk=net0;

% 
% act10k=forw3(netk,patstr);
% kolor=zeros(178,3);
% kolor(find(patstr.tmat==0),1)=1;
% kolor(find(patstr.tmat==0.5),2)=1;
% kolor(find(patstr.tmat==1),3)=1;
% % kolor=[patstr.tmat,[0 0 0 0 0 0 0 0]',1-patstr.tmat];
% p=scatter3(act10k.hid(:,1),act10k.hid(:,2),act10k.hid(:,3),100,kolor,'filled');
% axis([-1 1 -1 1 -1 1]);


for i=1:niter
    netk=cyc3(netk,patstr,eta,nlev) ;
    
%     act10k=forw3(netk,patstr);
%     set(p,'XData',act10k.hid(:,1),'YData',act10k.hid(:,2),'ZData',act10k.hid(:,3))
%     pause(0.0001);
    
    
end
finalnet=netk;