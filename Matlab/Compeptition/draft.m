clear,clc
load('data.mat')
%process data to fill the ages in the blank
gender=ones(size(Sex,1),1);
for i=1:length(gender)
    if(strcmp(Sex(i,1),'male'))
        gender(i,:)=1;
    else 
        gender(i,:)=2;
    end
end

%process Embarked to bark(numeric)  C-1 Q-2 S-3
bark=ones(size(Embarked,1),1);
for i=1:length(bark)
    if(strcmp(Embarked(i,1),'C'))
        bark(i,:)=1;
    else if(strcmp(Embarked(i,1),'Q'))
            bark(i,:)=2;
        else 
            bark(i,:)=3;
        end
    end
end

%process Embarked to bark(numeric)  C-1 Q-2 S-3
name=ones(size(RName,1),1);
for i=1:length(name)
    if(strcmp(RName(i,1),'Mr'))
        name(i,:)=1;
    else if(strcmp(RName(i,1),'Mrs'))
            name(i,:)=2;
        else if(strcmp(RName(i,1),'Miss'))
            name(i,:)=3;
            else 
               name(i,:)=4;
            end
        end
    end
end

% nbark=process(bark);
nPclass=process(Pclass);
ngender=process(gender);
nAge=process(Age);
nFare=process(Fare);
nSibSp=process(SibSp);
nParch=process(Parch);
nbark=process(bark);
nname=process(name);

%so the useful infomation is Survived;Pclass,Age,gender,SibSp,Parch,bark,Fare
T=Survived';
%  P=[nPclass'; nAge'; ngender'; nSibSp'; nParch'; nbark'; nFare';nname'];
P=[nPclass';ngender'; nSibSp'; nParch'; nbark'; nFare';nname'];
samp=randsample(size(P,2),ceil(size(P,2)/10));
test=P(:,samp);
P=P(:,setdiff(1:size(P,2),samp));
T_test=T(samp);
T=T(setdiff(1:length(T),samp));
 
 
net=feedforwardnet;
net=train(net,P,T);
e=T-round(sim(net,P));
t=mae(e);

tpnet=net;
tpt=t;
for i=1:100
    net=train(net,P,T);
    e=T-round(sim(net,P));
    t=mae(e);
    if(t<tpt)
        tpt=t;
        tpnet=net;
    else 
        net=tpnet;
        t=tpt;
end
fprintf('%d:%f\n',i,t);
if(mae(e)<=0.1)
    break;
end
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gender1=ones(size(Sex1,1),1);
for i=1:length(gender1)
    if(strcmp(Sex1(i,1),'male'))
        gender1(i,:)=1;
    else 
        gender1(i,:)=2;
    end
end

%process Embarked to bark(numeric)  C-1 Q-2 S-3
bark1=ones(size(Embarked1,1),1);
for i=1:length(bark1)
    if(strcmp(Embarked1(i,1),'C'))
        bark1(i,:)=1;
    else if(strcmp(Embarked1(i,1),'Q'))
            bark1(i,:)=2;
        else 
            bark1(i,:)=3;
        end
    end
end

name1=ones(size(RName1,1),1);
for i=1:length(name1)
    if(strcmp(RName1(i,1),'Mr'))
        name1(i,:)=1;
    else if(strcmp(RName1(i,1),'Mrs'))
            name1(i,:)=2;
        else if(strcmp(RName1(i,1),'Miss'))
            name1(i,:)=3;
            else 
               name1(i,:)=4;
            end
        end
    end
end

nPclass1=process(Pclass1);
ngender1=process(gender1);
nAge1=process(Age1);
nFare1=process(Fare1);
nSibSp1=process(SibSp1);
nParch1=process(Parch1);
nbark1=process(bark1);
nname1=process(name1);

%so the useful infomation is Survived;Pclass,Age,gender,SibSp,Parch,bark,Fare
% test=[nPclass1'; nAge1'; ngender1'; nSibSp1'; nParch1'; nbark1'; nFare1';nname1'];

% test=[nPclass1'; ngender1'; nSibSp1'; nParch1'; nbark1'; nFare1';nname1'];

result=sim(net,test);
result=result';

confuMatrix=confusion([result,T_test'],0.5)
Accuracy=(confuMatrix(1,1)+confuMatrix(2,2))/(sum(sum(confuMatrix)))
RunRoc
CalSenSpe([result,T_test'],0.5)

result(find(result<0))=0;
result(find(result>1))=1;



% predict=[PassengerId1,result];
% predict=[[0,0];predict];
% csvwrite('H:\Ñ§Ï°×ÊÁÏ\Pittburgh\data analysis\final project\predict.csv',predict)
