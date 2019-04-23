> require("data.table")
Zorunlu paket yükleniyor: data.table
data.table 1.12.0  Latest news: r-datatable.com
> matches<-readRDS("matches.rds")
> matches
       matchId            home              away score       date HomeGoal
   1: KjF6FiA6       tottenham   manchester city   0:0 1281789900        0
   2: ILVbJgQm     aston villa          west ham   3:0 1281798000        3
   3: SGIEDVvJ          wolves             stoke   2:1 1281798000        2
   4: YwL5xFHJ          bolton            fulham   0:0 1281798000        0
   5: lQJAEBPC           wigan         blackpool   0:4 1281798000        0
  ---                                                                     
3325: vZsc2D5f     southampton            fulham  <NA> 1551296700       NA
3326: IJgl4Zzr         chelsea         tottenham  <NA> 1551297600       NA
3327: x6wdMmFG  crystal palace manchester united  <NA> 1551297600       NA
3328: nao50iz7 manchester city          west ham  <NA> 1551297600       NA
3329: hxn11XK0       liverpool           watford  <NA> 1551297600       NA
      AwayGoal MatchResult           timestamp date_of_match
   1:        0        draw 2010-08-14 15:45:00    2010-08-14
   2:        0        home 2010-08-14 18:00:00    2010-08-14
   3:        1        home 2010-08-14 18:00:00    2010-08-14
   4:        0        draw 2010-08-14 18:00:00    2010-08-14
   5:        4        away 2010-08-14 18:00:00    2010-08-14
  ---                                                       
3325:       NA        <NA> 2019-02-27 22:45:00    2019-02-27
3326:       NA        <NA> 2019-02-27 23:00:00    2019-02-27
3327:       NA        <NA> 2019-02-27 23:00:00    2019-02-27
3328:       NA        <NA> 2019-02-27 23:00:00    2019-02-27
3329:       NA        <NA> 2019-02-27 23:00:00    2019-02-27
> intervals<-(0:10)
> intervals
 [1]  0  1  2  3  4  5  6  7  8  9 10
> intervals<-intervals*86400*365.25
> intervals
 [1]         0  31557600  63115200  94672800 126230400 157788000 189345600
 [8] 220903200 252460800 284018400 315576000
> intervals<-intervals+1246406400
> intervals
 [1] 1246406400 1277964000 1309521600 1341079200 1372636800 1404194400
 [7] 1435752000 1467309600 1498867200 1530424800 15619824004
> seasons<-cut(matches$date,breaks=intervals,labels=2010:2019)
> matches[,season:=seasons]
> matches[,Difference:=(HomeGoal-AwayGoal)]
> means<-rep(0,9)
> means
[1] 0 0 0 0 0 0 0 0 0
> vars<-rep(0,9)
> vars
[1] 0 0 0 0 0 0 0 0 0
> for(i in 2011:2019){
+ Diffs<-matches[season==i]$Difference
+ means[i-2010]<-mean(Diffs)
+ vars[i-2010]<-var(Diffs)}
> means
[1] 0.4500000 0.3736842 0.3184211 0.3789474 0.3815789 0.2842105 0.3947368
[8] 0.3842105        NA
> vars
[1] 2.934169 3.601416 2.951111 3.681878 2.822351 2.963866 3.637967 3.593418
[9]       NA
> #we dont care NAs because it is a sufficient reason to exclude 2019 season as it is not finished yet
> #we'd better find N's as well as they may prove helpful
> N<-rep(0,10)
> for(i in 1:8){
+ N[i]<-sum(matches$season==i+2010)}
> N
 [1] 380 380 380 380 380 380 380 380   0   0
> #gives an idea :)
> #now we do a t test
> ?pt
> #we should find the critical value that we reject hypothesis
> qt(0.9,379)
[1] 1.283789
> #this is the # of std devs to the critical value
> #let us now normalize our observed deviations
> devs<-sqrt(vars/379)
> normdevs<-means/devs
> normdevs
[1] 5.114340 3.833431 3.608516 3.844712 4.421794 3.213886 4.029006 3.945800
[9]       NA
> #which are much much higher than our critical value of 1.28
> #now let us find the type 2 errors
> pt(-normdevs+1.283789,379)
[1] 0.0000747980 0.0055881453 0.0103070928 0.0054129632 0.0009170699
[6] 0.0271703548 0.0031675167 0.0040491070           NA
> #which are sufficiently low for most applications
> 
> save.image(file="task1.RData")
> q()


