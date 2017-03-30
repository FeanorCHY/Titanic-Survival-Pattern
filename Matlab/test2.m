clc,clear
load('all.mat')
Age(find(Parch==0))=[];
Cabin(find(Parch==0))=[];
Fare(find(Parch==0))=[];
LastName(find(Parch==0))=[];
PassengerId(find(Parch==0))=[];
Pclass(find(Parch==0))=[];
prediction(find(Parch==0))=[];
Sex(find(Parch==0))=[];
SibSp(find(Parch==0))=[];
Survived(find(Parch==0))=[];
Ticket(find(Parch==0))=[];
Title(find(Parch==0))=[];
Parch(find(Parch==0))=[];

lonely=[];
for i=1:307
    if length(find(strcmp(LastName(i),LastName)))==1
        lonely=[lonely,i];
    end
end

Age(lonely)=[];
Cabin(lonely)=[];
Fare(lonely)=[];
LastName(lonely)=[];
PassengerId(lonely)=[];
Pclass(lonely)=[];
prediction(lonely)=[];
Sex(lonely)=[];
SibSp(lonely)=[];
Survived(lonely)=[];
Ticket(lonely)=[];
Title(lonely)=[];
Parch(lonely)=[];

for i=1:289
    if length(find(strcmp(LastName(i),LastName)))==1
        lonely=[lonely,i];
    end
end
familyName=unique(LastName);
family=[];
todel=[];
lenoffamily=length(familyName);
for i=1:length(familyName)
    members=find(strcmp(LastName,familyName(i)));
    if isnan(Ticket(members(1)))||length(unique(Ticket(members)))==1 
        family(i).Age=Age(members);
        family(i).Cabin=Cabin(members);
        family(i).Fare=Fare(members);
        family(i).LastName=LastName(members);
        family(i).PassengerId=PassengerId(members);
        family(i).Pclass=Pclass(members);
        family(i).prediction=prediction(members);
        family(i).Sex=Sex(members);
        family(i).SibSp=SibSp(members);
        family(i).Survived=Survived(members);
        family(i).Ticket=Ticket(members);
        family(i).Title=Title(members);
        family(i).Parch=Parch(members);
    else
        tem=unique(Ticket(members));
        for j=1:length(tem)
            seperate=find(Ticket==tem(j));
            todel=[todel,i];
            if length(seperate)>1
                family(1+lenoffamily).Age=Age(seperate);
                family(1+lenoffamily).Cabin=Cabin(seperate);
                family(1+lenoffamily).Fare=Fare(seperate);
                family(1+lenoffamily).LastName=LastName(seperate);
                family(1+lenoffamily).PassengerId=PassengerId(seperate);
                family(1+lenoffamily).Pclass=Pclass(seperate);
                family(1+lenoffamily).prediction=prediction(seperate);
                family(1+lenoffamily).Sex=Sex(seperate);
                family(1+lenoffamily).SibSp=SibSp(seperate);
                family(1+lenoffamily).Survived=Survived(seperate);
                family(1+lenoffamily).Ticket=Ticket(seperate);
                family(1+lenoffamily).Title=Title(seperate);
                family(1+lenoffamily).Parch=Parch(seperate);
                lenoffamily=lenoffamily+1;
            end
        end
    end
end
family(unique(todel))=[];
clear lenoffamily
clear tem
clear todel


for i=1:length(family)
    maxage=max(family(i).Age);
    for j=1:length(family(i).Age)
        if (maxage-family(i).Age(j))>17
            family(i).child(j)=1;
        else
            family(i).child(j)=0;
        end
    end
end

deadchild=[];
for i=1:length(family)
    for j=1:length(family(i).Age)
        if family(i).child(j)==1&&family(i).Survived(j)==0
            deadchild=[deadchild,i];
        end
    end
end
deadchild=unique(deadchild);
survivedparent=[];
for i=1:length(deadchild)
    for j=1:length(family(deadchild(i)).Age)
        if family(deadchild(i)).child(j)==0&&family(deadchild(i)).prediction(j)==1
            survivedparent=[survivedparent,deadchild(i)];
        end
    end
end
length(unique(deadchild))
length(unique(survivedparent))


Surpar=[];
for i=1:length(family)
    for j=1:length(family(i).Age)
        if family(i).child(j)==0&&family(i).Survived(j)==1
            Surpar=[Surpar,i];
        end
    end
end
Surpar=unique(Surpar);
DeadChild=[];
for i=1:length(Surpar)
    for j=1:length(family(Surpar(i)).Age)
        if family(Surpar(i)).child(j)==1&&family(Surpar(i)).Survived(j)==1
            DeadChild=[DeadChild,Surpar(i)];
        end
    end
end
length(unique(DeadChild))
length(unique(Surpar))


% alltrain=[];
% for i=1:length(family)
%     if sum(isnan(family(i).Survived))==0
%         alltrain=[alltrain,i];
%     end
% end
% family(alltrain)=[];
% clear alltrain
