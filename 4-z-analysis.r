> require(data.table)
> matches<-readRDS("matches_w_parameters.rds")
#first let's calculate the probabilites for over
> matches[,pover0.5:=(1/matches$"0.5")/((1/matches$"0.5")+(1/matches$u0.5))]
> matches[,pover1.5:=(1/matches$"1.5")/((1/matches$"1.5")+(1/matches$u1.5))]
> matches[,pover2.5:=(1/matches$"2.5")/((1/matches$"2.5")+(1/matches$u2.5))]
> matches[,pover3.5:=(1/matches$"3.5")/((1/matches$"3.5")+(1/matches$u3.5))]
> matches[,pover4.5:=(1/matches$"4.5")/((1/matches$"4.5")+(1/matches$u4.5))]
> matches[,pover5.5:=(1/matches$"5.5")/((1/matches$"5.5")+(1/matches$u5.5))]
> matches
#...
      pover0.5  pover1.5  pover2.5  pover3.5  pover4.5   pover5.5
  ---                                                             
3306: 0.8695301 0.7117005 0.4961940 0.2916137 0.1571934 0.07804790
3307: 0.8594137 0.6472046 0.4056212 0.2161573 0.1095407 0.05764136
3308: 0.9130375 0.7562260 0.5289082 0.3210430 0.1729753 0.09272844
3309: 0.9236288 0.7930715 0.5863207 0.3709742 0.2107489 0.11927903
3310: 0.8814648 0.6767605 0.4279161 0.2327240 0.1127042 0.06053930
  ---
#looks quite reasonable
> #now the z-values
> matches[,z0.5:=qnorm(pover0.5)]
> matches[,z1.5:=qnorm(pover1.5)]
> matches[,z2.5:=qnorm(pover2.5)]
> matches[,z3.5:=qnorm(pover3.5)]
> matches[,z4.5:=qnorm(pover4.5)]
> matches[,z5.5:=qnorm(pover5.5)]
> matches
#---
       pover0.5  pover1.5  pover2.5  pover3.5  pover4.5   pover5.5     z0.5
  ---                                                                      
3306: 0.8695301 0.7117005 0.4961940 0.2916137 0.1571934 0.07804790 1.124173
3307: 0.8594137 0.6472046 0.4056212 0.2161573 0.1095407 0.05764136 1.077689
3308: 0.9130375 0.7562260 0.5289082 0.3210430 0.1729753 0.09272844 1.359699
3309: 0.9236288 0.7930715 0.5863207 0.3709742 0.2107489 0.11927903 1.429912
3310: 0.8814648 0.6767605 0.4279161 0.2327240 0.1127042 0.06053930 1.182341
           z1.5         z2.5       z3.5       z4.5      z5.5
  ---                                                       
3306: 0.5583595 -0.009540301 -0.5486765 -1.0060596 -1.418325
3307: 0.3777842 -0.238823577 -0.7852370 -1.2289745 -1.574886
3308: 0.6942139  0.072525717 -0.4647843 -0.9424728 -1.324139
3309: 0.8171250  0.218090382 -0.3292743 -0.8038253 -1.178599
3310: 0.4586590 -0.181682141 -0.7299053 -1.2122719 -1.550262
> #it seems the std-deviation of predicted outcome is about 2 goals as 
> #the differences between z's of two handicaps are all around 0.5
#this is great news for our model, let us see if it is correct:
> mean(matches$z1.5-matches$z0.5,na.rm=TRUE)
[1] -0.6739575
> mean(matches$z2.5-matches$z1.5,na.rm=TRUE)
[1] -0.6201251
> mean(matches$z3.5-matches$z2.5,na.rm=TRUE)
[1] -0.5368174
> mean(matches$z4.5-matches$z3.5,na.rm=TRUE)
[1] -0.4711941
> mean(matches$z5.5-matches$z4.5,na.rm=TRUE)
[1] -0.3903073
> var(matches$z1.5-matches$z0.5,na.rm=TRUE)
[1] 0.00174144
#this is very low! so difference is almost same for all matches! 
#let us take sqrt to avoid being so low.
> sqrt(var(matches$z1.5-matches$z0.5,na.rm=TRUE))
[1] 0.04173057
> sqrt(var(matches$z2.5-matches$z1.5,na.rm=TRUE))
[1] 0.01990081
> sqrt(var(matches$z3.5-matches$z2.5,na.rm=TRUE))
[1] 0.01051019
> sqrt(var(matches$z4.5-matches$z3.5,na.rm=TRUE))
[1] 0.01427243
> sqrt(var(matches$z5.5-matches$z4.5,na.rm=TRUE))
[1] 0.02874618
> #WWOOOOWWWW
> #the std deviation for predicted # of goals is about the same for all matches
> #so even the linear model will work well
> #let us finally save our data table
> saveRDS(matches,"matches_everything.rds")
#there are so many colums not to be used in model so we also save a "neat" table
> matches[,"0.5":=NULL]
> matches[,"1.5":=NULL]
> matches[,"2.5":=NULL]
> matches[,"3.5":=NULL]
> matches[,"4.5":=NULL]
> matches[,"5.5":=NULL]
> matches[,u5.5:=NULL]
> matches[,u4.5:=NULL]
> matches[,u3.5:=NULL]
> matches[,u2.5:=NULL]
> matches[,u1.5:=NULL]
> matches[,u0.5:=NULL]
> matches[,pover0.5:=NULL]
> matches[,pover1.5:=NULL]
> matches[,pover2.5:=NULL]
> matches[,pover3.5:=NULL]
> matches[,pover4.5:=NULL]
> matches[,pover5.5:=NULL]
> matches[,home:=NULL]
> matches[,away:=NULL]
> matches[,HomeGoal:=NULL]
> matches[,AwayGoal:=NULL]
#now a typical row looks like:
> matches[440]
    matchId       date goals homehomeavg homehomevar homeawayavg homeawayvar
1: GCLWxiRp 1317473100     2    1.733333     1.63311         1.1   0.9899329
   awayhomeavg awayhomevar awayawayavg awayawayvar     z0.5      z1.5
1:    1.973333    2.079821    1.688742    2.162472 1.229517 0.4993028
         z2.5       z3.5      z4.5      z5.5
1: -0.1252292 -0.6482193 -1.068497 -1.444138
> saveRDS(matches,"matches_neat.rds")

