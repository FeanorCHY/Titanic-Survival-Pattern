clear,clc
load('all.mat')
Sib0=sum(Survived(find(SibSp==0)))/length(Survived(find(SibSp==0)))
Sib1=sum(Survived(find(SibSp==1)))/length(Survived(find(SibSp==1)))
Sib2=sum(Survived(find(SibSp==2)))/length(Survived(find(SibSp==2)))
Sib3=sum(Survived(find(SibSp==3)))/length(Survived(find(SibSp==3)))
Sib4=sum(Survived(find(SibSp==4)))/length(Survived(find(SibSp==4)))
Sib5=sum(Survived(find(SibSp==5)))/length(Survived(find(SibSp==5)))
Sib6=sum(Survived(find(SibSp==6)))/length(Survived(find(SibSp==6)))
Sib7=sum(Survived(find(SibSp==7)))/length(Survived(find(SibSp==7)))
Sib8=sum(Survived(find(SibSp==8)))/length(Survived(find(SibSp==8)))
Sib9=sum(Survived(find(SibSp==9)))/length(Survived(find(SibSp==9)))




Par0=sum(Survived(find(Parch==0)))/length(Survived(find(Parch==0)))
Par1=sum(Survived(find(Parch==1)))/length(Survived(find(Parch==1)))
Par2=sum(Survived(find(Parch==2)))/length(Survived(find(Parch==2)))
Par3=sum(Survived(find(Parch==3)))/length(Survived(find(Parch==3)))
Par4=sum(Survived(find(Parch==4)))/length(Survived(find(Parch==4)))
Par5=sum(Survived(find(Parch==5)))/length(Survived(find(Parch==5)))
Par6=sum(Survived(find(Parch==6)))/length(Survived(find(Parch==6)))