load('models.mat')
out=[];
for i=1:418
    out(i)=mode([BAY(i),DT(i),SVM(i), NN(i), BADNN(i)]);
%     out(i)=mode(predict(i));
end
out=out';
% sum(abs(out-out803))
% noise=[243,289,322,405];
% out(99)=0;
% out(200)=0;
% out(243)=1;
% out(289)=1;
% out(322)=1;
% out(405)=1;
all=[BAY, DT, Log, NN, SVM,BADNN,RF];

% find(all(noise)==1);
