outcome=[[act10kHA.out,titanicHA.tmat];[act10kHN.out,titanicHN.tmat];...
    [act10kNA.out,titanicNA.tmat];[act10kNN.out,titanicNN.tmat]];
Roc(outcome);
figure
CalCurve(outcome,10);
hold on
plot([0,1],[0,1],'r')