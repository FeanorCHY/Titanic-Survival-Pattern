clear,clc
load('train.mat')
lengthofall=length(PassengerId);
Sex=char(Sex);
Sex2=ones(lengthofall,1);
Sex2(find(Sex=='f'))=0;
Sex=Sex2;
clear Sex2

Cabin=char(Cabin);
Cabin=Cabin(:,1);
Cabin2=zeros(lengthofall,3);
Cabin2(find(Cabin=='B'),1)=1;
Cabin2(find(Cabin=='C'),2)=1;
Cabin2(find(Cabin=='D'),3)=1;
Cabin2(find(Cabin=='E'),[1,2])=1;
Cabin2(find(Cabin=='F'),[1,3])=1;
Cabin2(find(Cabin=='G'),[2,3])=1;
Cabin2(find(Cabin=='H'),:)=1;
temC=Cabin;
Cabin=Cabin2;
Cabin2=temC;
clear temC



Embarked=char(Embarked);
Embarked2=zeros(lengthofall,2);
Embarked2(find(Embarked=='C'),1)=1;
Embarked2(find(Embarked=='Q'),2)=1;
Embarked=Embarked2;
clear Embarked2

Pclass2=zeros(lengthofall,3);
Pclass2(find(Pclass==1),1)=1;
Pclass2(find(Pclass==2),2)=1;
Pclass2(find(Pclass==3),3)=1;
Pclass=Pclass2;
clear Pclass2

SibSp2=zeros(lengthofall,2);
SibSp2(find(SibSp<=2),1)=1;
SibSp2(find(SibSp==0),2)=1;
SibSp2(find(SibSp>=4),2)=1;
SibSp=SibSp2;
clear SibSp2;

Parch2=zeros(lengthofall,2);
Parch2(find(Parch<=3),1)=1;
Parch2(find(Parch==0),1)=0;
Parch2(find(Parch==0),2)=1;
Parch=Parch2;
clear Parch2;

HasCabin=find(Cabin2~=' ');
HasAge=find(~isnan(Age));
NoCabin=find(Cabin2==' ');
NoAge=find(isnan(Age));
Age(HasAge)=zscore(Age(HasAge));
Fare=zscore(Fare);
stimulusall=[Pclass,Age,Sex,SibSp,Parch,Fare,Embarked,Cabin];
% stimulusall=[Pclass,Age,Sex];
HAset=intersect(HasCabin,HasAge);
HNset=intersect(HasCabin,NoAge);
NAset=intersect(NoCabin,HasAge);
NNset=intersect(NoCabin,NoAge);

titanicHA.smat=stimulusall(HAset,:);
titanicHA.tmat=Survived(HAset);
n0HA=initnet3(size(titanicHA.smat,2),size(titanicHA.smat,2),1,6,6);
nfHA=bp3(n0HA,titanicHA,10000,.1,0);
act10kHA=forw3(nfHA,titanicHA);
sum(abs(round(act10kHA.out)-titanicHA.tmat))/length(act10kHA.out)

titanicHN.smat=stimulusall(HNset,:);
titanicHN.smat(:,4)=[];
titanicHN.tmat=Survived(HNset);
n0HN=initnet3(size(titanicHN.smat,2),size(titanicHN.smat,2),1,6,6);
nfHN=bp3(n0HN,titanicHN,10000,.1,0);
act10kHN=forw3(nfHN,titanicHN);
sum(abs(round(act10kHN.out)-titanicHN.tmat))/length(act10kHN.out)

titanicNA.smat=stimulusall(NAset,:);
titanicNA.smat(:,[13,14,15])=[];
titanicNA.tmat=Survived(NAset);
n0NA=initnet3(size(titanicNA.smat,2),size(titanicNA.smat,2),1,6,6);
nfNA=bp3(n0NA,titanicNA,10000,.1,0);
act10kNA=forw3(nfNA,titanicNA);
sum(abs(round(act10kNA.out)-titanicNA.tmat))/length(act10kNA.out)

titanicNN.smat=stimulusall(NNset,:);
titanicNN.smat(:,[13,14,15])=[];
titanicNN.smat(:,4)=[];
titanicNN.tmat=Survived(NNset);
n0NN=initnet3(size(titanicNN.smat,2),size(titanicNN.smat,2),1,6,6);
nfNN=bp3(n0NN,titanicNN,10000,.1,0);
act10kNN=forw3(nfNN,titanicNN);
sum(abs(round(act10kNN.out)-titanicNN.tmat))/length(act10kNN.out)
% fortest
% predict2=predict(2:size(predict,1),2);
% load('predict.mat')
% predict=[predict,predict2]
% save predict predict
accuracy=(sum(abs(round(act10kNN.out)-titanicNN.tmat))+sum(abs(round(act10kNA.out)...
-titanicNA.tmat))+sum(abs(round(act10kHA.out)-titanicHA.tmat))+sum(abs(round...
(act10kHN.out)-titanicHN.tmat)))/length(PassengerId)


% SurvivedNA=Survived(find(isnan(Age)));
% Survived(find(isnan(Age)))=[];
% PclassNA=Pclass(find(isnan(Age)),:);
% Pclass(find(isnan(Age)),:)=[];
% SexNA=Sex(find(isnan(Age)));
% Sex(find(isnan(Age)))=[];
% SibSpNA=SibSp(find(isnan(Age)),:);
% SibSp(find(isnan(Age)),:)=[];
% ParchNA=Parch(find(isnan(Age)),:);
% Parch(find(isnan(Age)),:)=[];
% Fare=zscore(Fare);
% FareNA=Fare(find(isnan(Age)));
% Fare(find(isnan(Age)))=[];
% EmbarkedNA=Embarked(find(isnan(Age)),:);
% Embarked(find(isnan(Age)),:)=[];
% Age(isnan(Age))=[];
% Age=zscore(Age);

% titanic.smat=[Pclass,Age,Sex,SibSp,Parch,Fare,Embarked];
% titanic.tmat=Survived;
% n0=initnet3(12,12,1,6,6);
% nf=bp3(n0,titanic,10000,.1,0);
% act10k=forw3(nf,titanic);
% sum(abs(round(act10k.out)-titanic.tmat))/length(act10k.out)
% 
% titanicNA.smat=[PclassNA,SexNA,SibSpNA,ParchNA,FareNA,EmbarkedNA];
% titanicNA.tmat=SurvivedNA;
% n0NA=initnet3(11,11,1,5,5);
% nfNA=bp3(n0NA,titanicNA,10000,.1,0);
% act10kNA=forw3(nfNA,titanicNA);
% sum(abs(round(act10kNA.out)-titanicNA.tmat))/length(act10kNA.out)



