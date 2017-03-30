load('test.mat')
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
Fare(find(isnan(Fare)))=mean(Fare(find(~isnan(Fare))));
Fare=zscore(Fare);
stimulusall=[Pclass,Age,Sex,SibSp,Parch,Fare,Embarked,Cabin];
% stimulusall=[Pclass,Age,Sex];
HAset=intersect(HasCabin,HasAge);
HNset=intersect(HasCabin,NoAge);
NAset=intersect(NoCabin,HasAge);
NNset=intersect(NoCabin,NoAge);

predict=zeros(length(PassengerId),1);

testHA.smat=stimulusall(HAset,:);
testHA.tmat=Survived(HAset);
act10kHA=forw3(nfHA,testHA);
predict(HAset)=round(act10kHA.out);

testHN.smat=stimulusall(HNset,:);
testHN.smat(:,4)=[];
testHN.tmat=Survived(HNset);
act10kHN=forw3(nfHN,testHN);
predict(HNset)=round(act10kHN.out);

% testNA.smat=stimulusall(NAset,:);
% testNA.smat(:,[13,14,15])=[];
% testNA.tmat=Survived(NAset);
% act10kNA=forw3(nfNA,testNA);
% predict(NAset)=round(act10kNA.out);
% 
% testNN.smat=stimulusall(NNset,:);
% testNN.smat(:,[13,14,15])=[];
% testNN.smat(:,4)=[];
% testNN.tmat=Survived(NNset);
% act10kNN=forw3(nfNN,testNN);
% predict(NNset)=round(act10kNN.out);

predict=[PassengerId,predict];
predict=[[0,0];predict];

% test.smat=[Pclass,Age,Sex,SibSp,Parch,Fare,Embarked];
% test.tmat=titanic.tmat;
% act10k=forw3(nf,test);
% predict=zeros(length(PassengerId),1);
% predict(Agefull)=round(act10k.out);


% testNA.smat=[PclassNA,SexNA,SibSpNA,ParchNA,FareNA,EmbarkedNA];
% testNA.tmat=titanicNA.tmat;
% act10kNA=forw3(nfNA,testNA);
% predict(Agenull)=round(act10kNA.out);
% predict=[PassengerId,predict];

csvwrite('H:\Ñ§Ï°×ÊÁÏ\Pittburgh\data analysis\final project\predict.csv',predict)