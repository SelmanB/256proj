> require(data.table)
> pin<-readRDS("Pinnacleouwres.rds")
> matches<-readRDS("matches.rds")
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
> matches[,year:=date/31556926+1970]
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
      AwayGoal MatchResult           timestamp date_of_match     year
   1:        0        draw 2010-08-14 15:45:00    2010-08-14 2010.618
   2:        0        home 2010-08-14 18:00:00    2010-08-14 2010.619
   3:        1        home 2010-08-14 18:00:00    2010-08-14 2010.619
   4:        0        draw 2010-08-14 18:00:00    2010-08-14 2010.619
   5:        4        away 2010-08-14 18:00:00    2010-08-14 2010.619
  ---                                                                
3325:       NA        <NA> 2019-02-27 22:45:00    2019-02-27 2019.159
3326:       NA        <NA> 2019-02-27 23:00:00    2019-02-27 2019.159
3327:       NA        <NA> 2019-02-27 23:00:00    2019-02-27 2019.159
3328:       NA        <NA> 2019-02-27 23:00:00    2019-02-27 2019.159
3329:       NA        <NA> 2019-02-27 23:00:00    2019-02-27 2019.159
> pin[,date:=NA]
> pin[,innerpr:=as.integer(isover)*overpn+(1-as.integer(isover))*underpn]
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
        underpn isover date   innerpr
   1: 0.5431472  FALSE   NA 0.5431472
   2: 0.5255102  FALSE   NA 0.5255102
   3: 0.4795918   TRUE   NA 0.5204082
   4: 0.5860349  FALSE   NA 0.5860349
   5: 0.3636364   TRUE   NA 0.6363636
  ---                                
2924: 0.4455696  FALSE   NA 0.4455696
2925: 0.4974490  FALSE   NA 0.4974490
2926: 0.6322115  FALSE   NA 0.6322115
2927: 0.4368687  FALSE   NA 0.4368687
2928: 0.4139651     NA   NA        NA
> install.packages("smoother")
> require(smoother)
> pi<-pin[!is.na(innerpr)]
> dates<-pi$date
> for(i in 1:length(dates))
+ dates[i]<-first(matches[matchId==pi[i]$matchId]$year)
> pi$date<-dates
> pi<-pi[order(date)]
> pi$sinnerp<-smth.gaussian(pi$innerpr)
> pi
       matchId overodd underodd     overp    underp   totalp    overpn
   1: 4IR5xqh0    1.93     2.00 0.5181347 0.5000000 1.018135 0.5089059
   2: AazDcpUP    1.98     1.94 0.5050505 0.5154639 1.020514 0.4948980
   3: ERVrhOim    2.15     1.80 0.4651163 0.5555556 1.020672 0.4556962
   4: ILV9y376    2.12     1.83 0.4716981 0.5464481 1.018146 0.4632911
   5: vyKIZtxJ    2.02     1.91 0.4950495 0.5235602 1.018610 0.4860051
  ---                                                                 
2891: zJAnjne2    1.75     2.20 0.5714286 0.4545455 1.025974 0.5569620
2892: l28zglBq    2.35     1.65 0.4255319 0.6060606 1.031593 0.4125000
2893: Q7ZzcITE    1.83     2.11 0.5464481 0.4739336 1.020382 0.5355330
2894: IszXcbE8    1.68     2.31 0.5952381 0.4329004 1.028139 0.5789474
2895: nNNqedbR    2.30     1.68 0.4347826 0.5952381 1.030021 0.4221106
        underpn isover     date   innerpr   sinnerp    dates
   1: 0.4910941   TRUE 2011.002 0.5089059        NA 2011.002
   2: 0.5051020  FALSE 2011.002 0.5051020        NA 2011.002
   3: 0.5443038  FALSE 2011.002 0.5443038        NA 2011.002
   4: 0.5367089   TRUE 2011.002 0.4632911        NA 2011.002
   5: 0.5139949   TRUE 2011.002 0.4860051        NA 2011.002
  ---                                                               
2891: 0.4430380   TRUE 2019.109 0.5569620        NA 2019.109
2892: 0.5875000   TRUE 2019.109 0.4125000        NA 2019.109
2893: 0.4644670   TRUE 2019.111 0.5355330        NA 2019.111
2894: 0.4210526   TRUE 2019.112 0.5789474        NA 2019.112
2895: 0.5778894  FALSE 2019.115 0.5778894        NA 2019.115
> yl<-"Gaussian Moving Average of Inner Product of P and Result"
> ml<-"Prediction Index for Pinnacle"
> pdf("Wonder.pdf")
> plot(pi$date,pi$sinnerp,type="o",col="brown",main=ml,ylab=yl,xlab="Year")
> dev.off()
X11cairo 
       2 
> 
>q()







