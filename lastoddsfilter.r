> require(data.table)
> podds<-readRDS("podds.rds")> sort(unique(podds$bookmaker))
 [1] "10Bet"            "12BET"            "188BET"           "1xBet"           
 [5] "888sport"         "bet365"           "bet-at-home"      "Betclic"         
 [9] "Betfair"          "Betfair Exchange" "Betsafe"          "Betsson"         
[13] "BetVictor"        "Betway"           "bwin"             "ComeOn"          
[17] "Expekt"           "Interwetten"      "mybet"            "Paddy Power"     
[21] "Pinnacle"         "SBOBET"           "Sportingbet"      "Tipico"          
[25] "Unibet"           "William Hill"     "youwin"
> pinmatches<-sort(unique(podds[bookmaker=="Pinnacle"]$matchId))
> b365matches<-sort(unique(podds[bookmaker=="bet365"]$matchId))
> bfmatches<-sort(unique(podds[bookmaker=="Betfair"]$matchId))
> bfxmatches<-sort(unique(podds[bookmaker=="Betfair Exchange"]$matchId))
> 
> pin1<-rep(0,length(pinmatches))
> pin2<-rep(0,length(pinmatches))
> pinx<-rep(0,length(pinmatches))
> 
> b3651<-rep(0,length(b365matches))
> b3652<-rep(0,length(b365matches))
> b365x<-rep(0,length(b365matches))
> 
> bf1<-rep(0,length(bfmatches))
> bf2<-rep(0,length(bfmatches))
> bfx<-rep(0,length(bfmatches))
> 
> bfx1<-rep(0,length(bfxmatches))
> bfx2<-rep(0,length(bfxmatches))
> bfxx<-rep(0,length(bfxmatches))
> 
> for(i in 1:length(pinmatches)){
+ pin1[i]<-last(podds[matchId==pinmatches[i] &  bookmaker=="Pinnacle"  &  oddtype=="odd1"]$odd)
+ pin2[i]<-last(podds[matchId==pinmatches[i] &  bookmaker=="Pinnacle"  &  oddtype=="odd2"]$odd)
+ pinx[i]<-last(podds[matchId==pinmatches[i] &  bookmaker=="Pinnacle"  &  oddtype=="oddX"]$odd)}
> for(i in 1:length(b365matches)){
+ b3651[i]<-last(podds[matchId==b365matches[i] &  bookmaker=="bet365"  &  oddtype=="odd1"]$odd)
+ b3652[i]<-last(podds[matchId==b365matches[i] &  bookmaker=="bet365"  &  oddtype=="odd2"]$odd)
+ b365x[i]<-last(podds[matchId==b365matches[i] &  bookmaker=="bet365"  &  oddtype=="oddX"]$odd)}
> for(i in 1:length(bfmatches)){
+ bf1[i]<-last(podds[matchId==bfmatches[i] &  bookmaker=="Betfair"  &  oddtype=="odd1"]$odd)
+ bf2[i]<-last(podds[matchId==bfmatches[i] &  bookmaker=="Betfair"  &  oddtype=="odd2"]$odd)
+ bfx[i]<-last(podds[matchId==bfmatches[i] &  bookmaker=="Betfair"  &  oddtype=="oddX"]$odd)}
> for(i in 1:length(bfxmatches)){
+ bfx1[i]<-last(podds[matchId==bfxmatches[i] &  bookmaker=="Betfair Exchange"  &  oddtype=="odd1"]$odd)
+ bfx2[i]<-last(podds[matchId==bfxmatches[i] &  bookmaker=="Betfair Exchange"  &  oddtype=="odd2"]$odd)
+ bfxx[i]<-last(podds[matchId==bfxmatches[i] &  bookmaker=="Betfair Exchange"  &  oddtype=="oddX"]$odd)}
> 
> pinnacleodds<-data.table(matchId=pinmatches,odd1=pin1,odd2=pin2,oddx=pinx)
> bet365odds<-data.table(matchId=b365matches,odd1=b3651,odd2=b3652,oddx=b365x)
> betfairodds<-data.table(matchId=bfmatches, odd1=bf1,odd2=bf2,oddx=bfx)
> betfairxodds<-data.table(matchId=bfxmatches, odd1=bfx1,odd2=bfx2,oddx=bfxx)
> 
> pinnacleodds
       matchId odd1  odd2 oddx
   1: 004f4ING 1.67  5.95 3.95
   2: 02oVDuv1 1.83  5.00 3.63
   3: 04PCiQzK 1.47  8.50 4.40
   4: 04vrPwsg 2.06  4.18 3.38
   5: 04zko0D5 1.15 22.00 8.40
  ---                         
3298: zXtioUye 2.89  2.67 3.33
3299: zXweIXVE 2.65  3.12 3.10
3300: zy3x0uCs 1.23 18.30 6.70
3301: zylytbNg 2.21  3.45 3.59
3302: zZ6f59Ue 1.79  4.56 3.99
> bet365odds
       matchId odd1  odd2 oddx
   1: 004f4ING 1.67  6.00 3.90
   2: 02oVDuv1 1.85  4.75 3.60
   3: 04PCiQzK 1.50  7.00 4.00
   4: 04vrPwsg 2.05  4.10 3.40
   5: 04zko0D5 1.16 21.00 8.50
  ---                         
3299: zXtioUye 2.75  2.63 3.25
3300: zXweIXVE 2.63  3.10 3.10
3301: zy3x0uCs 1.22 15.00 6.00
3302: zylytbNg 2.14  3.50 3.60
3303: zZ6f59Ue 1.80  4.00 3.75
> betfairodds
       matchId odd1  odd2 oddx
   1: 02oVDuv1 1.87  4.75 3.70
   2: 04zko0D5 1.15 26.00 8.50
   3: 069WnDBn 3.80  2.15 3.40
   4: 06H610QA 2.50  2.90 3.50
   5: 08lLzk5P 3.00  2.62 3.25
  ---                         
1375: zXDmLx4H 2.45  3.50 3.00
1376: zXmHZnXA 2.75  2.87 3.20
1377: zXweIXVE 2.60  3.10 3.10
1378: zylytbNg 2.15  3.50 3.75
1379: zZ6f59Ue 1.75  4.00 3.50
> betfairxodds
       matchId odd1  odd2 oddx
   1: 04PCiQzK 1.50  7.83 4.14
   2: 04zko0D5 1.17 25.00 9.20
   3: 061xSktd 2.21  3.23 3.61
   4: 069WnDBn 3.76  2.12 3.28
   5: 06AqtiDs 1.47  7.65 4.61
  ---                         
2610: zXmHZnXA 2.71  2.82 3.19
2611: zXtioUye 2.88  2.58 3.28
2612: zXweIXVE 2.60  3.04 3.04
2613: zy3x0uCs 1.23 18.10 6.70
2614: zZ6f59Ue 1.27  1.60 1.65
> 
> saveRDS(pinnacleodds,"pinnacleodds.rds")
> saveRDS(bet365odds,"bet365odds.rds")
> saveRDS(betfairodds,"betfairodds.rds")
> saveRDS(betfairxodds,"betfairxodds.rds")
