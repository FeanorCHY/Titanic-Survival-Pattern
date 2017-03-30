outcome=[result,T_test'];
Roc(outcome);
figure
CalCurve(outcome,10);
hold on
plot([0,1],[0,1],'r')