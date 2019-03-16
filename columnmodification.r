> require(data.table)
> matches<-readRDS("matches.rds")
> matches
                                  leagueId  matchId            home
   1: df9b1196-e3cf-4cc7-9159-f236fe738215 KjF6FiA6       tottenham
   2: df9b1196-e3cf-4cc7-9159-f236fe738215 ILVbJgQm     aston villa
   3: df9b1196-e3cf-4cc7-9159-f236fe738215 SGIEDVvJ          wolves
   4: df9b1196-e3cf-4cc7-9159-f236fe738215 YwL5xFHJ          bolton
   5: df9b1196-e3cf-4cc7-9159-f236fe738215 lQJAEBPC           wigan
  ---                                                              
3325: df9b1196-e3cf-4cc7-9159-f236fe738215 vZsc2D5f     southampton
3326: df9b1196-e3cf-4cc7-9159-f236fe738215 IJgl4Zzr         chelsea
3327: df9b1196-e3cf-4cc7-9159-f236fe738215 x6wdMmFG  crystal palace
3328: df9b1196-e3cf-4cc7-9159-f236fe738215 nao50iz7 manchester city
3329: df9b1196-e3cf-4cc7-9159-f236fe738215 hxn11XK0       liverpool
                   away score       date   type
   1:   manchester city   0:0 1281789900 soccer
   2:          west ham   3:0 1281798000 soccer
   3:             stoke   2:1 1281798000 soccer
   4:            fulham   0:0 1281798000 soccer
   5:         blackpool   0:4 1281798000 soccer
  ---                                          
3325:            fulham  <NA> 1551296700 soccer
3326:         tottenham  <NA> 1551297600 soccer
3327: manchester united  <NA> 1551297600 soccer
3328:          west ham  <NA> 1551297600 soccer
3329:           watford  <NA> 1551297600 soccer
> matches[,c('HomeGoal','AwayGoal'):=tstrsplit(score,':')]
> matches[,HomeGoal:=as.numeric(HomeGoal)]
Warning message:
In eval(expr, envir, enclos) : Zorlamadan dolayı ortaya çıkan NAs
> matches[,AwayGoal:=as.numeric(AwayGoal)]
> matches$leagueId=NULL
> matches$type=NULL
> matches[,MatchResult:=ifelse(HomeGoal>AwayGoal,'home',ifelse(HomeGoal==AwayGoal,'draw','away'))]
> require(lubridate)
> matches[,timestamp:=as_datetime(date,tz='Turkey')]
> matches[,date_of_match:=date(timestamp)]
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
> saveRDS(matches,"matches.rds")

