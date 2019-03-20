> require(data.table)
> matches<-readRDS("matches.rds")
> pin<-readRDS("Pinnacleou.rds")
> b3<-readRDS("Bet365ou.rds")
> bf<-readRDS("Betfairou.rds")
> bfx<-readRDS("Betfairoxu.rds")
> matches[,total:=HomeGoal+AwayGoal]
> matches[,over:=total>2.5]
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
      AwayGoal MatchResult           timestamp date_of_match total  over
   1:        0        draw 2010-08-14 15:45:00    2010-08-14     0 FALSE
   2:        0        home 2010-08-14 18:00:00    2010-08-14     3  TRUE
   3:        1        home 2010-08-14 18:00:00    2010-08-14     3  TRUE
   4:        0        draw 2010-08-14 18:00:00    2010-08-14     0 FALSE
   5:        4        away 2010-08-14 18:00:00    2010-08-14     4  TRUE
  ---                                                                   
3325:       NA        <NA> 2019-02-27 22:45:00    2019-02-27    NA    NA
3326:       NA        <NA> 2019-02-27 23:00:00    2019-02-27    NA    NA
3327:       NA        <NA> 2019-02-27 23:00:00    2019-02-27    NA    NA
3328:       NA        <NA> 2019-02-27 23:00:00    2019-02-27    NA    NA
3329:       NA        <NA> 2019-02-27 23:00:00    2019-02-27    NA    NA
> b3[,isover:=matches[match(b3$matchId,matches$matchId)]$over]
> bf[,isover:=matches[match(bf$matchId,matches$matchId)]$over]
> bfx[,isover:=matches[match(bfx$matchId,matches$matchId)]$over]
> pin[,isover:=matches[match(pin$matchId,matches$matchId)]$over]
> 
> pin
       matchId overodd underodd     overp    underp   totalp    overpn
   1: 004f4ING    2.14     1.80 0.4672897 0.5555556 1.022845 0.4568528
   2: 02oVDuv1    2.06     1.86 0.4854369 0.5376344 1.023071 0.4744898
   3: 04PCiQzK    1.88     2.04 0.5319149 0.4901961 1.022111 0.5204082
   4: 04vrPwsg    2.35     1.66 0.4255319 0.6024096 1.027942 0.4139651
   5: 04zko0D5    1.52     2.66 0.6578947 0.3759398 1.033835 0.6363636
  ---                                                                 
2924: zXRqAtdp    1.76     2.19 0.5681818 0.4566210 1.024803 0.5544304
2925: zXtioUye    1.95     1.97 0.5128205 0.5076142 1.020435 0.5025510
2926: zXweIXVE    2.63     1.53 0.3802281 0.6535948 1.033823 0.3677885
2927: zylytbNg    1.73     2.23 0.5780347 0.4484305 1.026465 0.5631313
2928: zZ6f59Ue    1.66     2.35 0.6024096 0.4255319 1.027942 0.5860349
        underpn isover
   1: 0.5431472  FALSE
   2: 0.5255102  FALSE
   3: 0.4795918   TRUE
   4: 0.5860349  FALSE
   5: 0.3636364   TRUE
  ---                 
2924: 0.4455696  FALSE
2925: 0.4974490  FALSE
2926: 0.6322115  FALSE
2927: 0.4368687  FALSE
2928: 0.4139651     NA
> saveRDS(pin,"Pinnacleouwres.rds")
> saveRDS(b3,"Bet365ouwres.rds")
> saveRDS(bf,"Betfairouwres.rds")
> saveRDS(bfx,"Betfairxouwres.rds")
> q()

