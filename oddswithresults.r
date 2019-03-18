> require(data.table)
> matches<-readRDS("matches.rds")
> pin<-readRDS("pinnacleoddswp.rds")
> b3<-readRDS("bet365oddswp.rds")
> bf<-readRDS("betfairoddswp.rds")
> bfx<-readRDS("betfairxodds.rds")
>
> pinres<-matches[match(pin$matchId,matches$matchId)]$MatchResult
> pinres
   [1] "away" "away" "home" "away" "home" "away" "draw" "away" "draw" "away"
  [11] "draw" "away" "home" "draw" "draw" "away" "away" "home" "home" "home"
  [21] "home" "draw" "away" "away" "home" "draw" "draw" "away" "home" "draw"
  [31] "home" "home" "away" "home" "home" "away" "home" "home" "home" "draw"
  [41] "draw" "home" "home" "home" "away" "draw" "home" "home" "away" "home"
  [51] "draw" "home" "home" "away" "away" "away" "away" "draw" NA     "home"
  [61] "home" "draw" "draw" "home" "home" "home" "home" "away" "away" "home"
  [71] "home" "draw" "draw" "draw" "away" "draw" "away" "away" "home" "home"
  [81] "draw" "away" "draw" "home" "home" "draw" "draw" "away" "home" "home"
  [91] "home" "home" "draw" "away" "home" "draw" "home" "draw" "home" "home"
 [101] "home" "home" "away" "home" "home" "draw" "home" "home" "draw" "away"
 [111] "away" "home" "away" "draw" "home" "home" "away" "draw" "home" "away"
 [121] "home" "home" "draw" "home" "home" "home" "home" "home" "draw" "home"
 [131] "away" "draw" "home" "draw" "home" "home" "away" "away" "home" "away"
 [141] "away" "away" "home" "draw" "home" "away" "home" "draw" "away" "home"
 [151] "home" "away" "home" "draw" "away" "home" "away" NA     "draw" "home"
#...
> pin[,result:=pinres]
> b3[,result:=matches[match(b3$matchId,matches$matchId)]$MatchResult]
> bf[,result:=matches[match(bf$matchId,matches$matchId)]$MatchResult]
> bfx[,result:=matches[match(bfx$matchId,matches$matchId)]$MatchResult]
> bfx
       matchId odd1  odd2 oddx result
   1: 04PCiQzK 1.50  7.83 4.14   home
   2: 04zko0D5 1.17 25.00 9.20   home
   3: 061xSktd 2.21  3.23 3.61   away
   4: 069WnDBn 3.76  2.12 3.28   draw
   5: 06AqtiDs 1.47  7.65 4.61   away
  ---                                
2610: zXmHZnXA 2.71  2.82 3.19   away
2611: zXtioUye 2.88  2.58 3.28   draw
2612: zXweIXVE 2.60  3.04 3.04   draw
2613: zy3x0uCs 1.23 18.10 6.70   home
2614: zZ6f59Ue 1.27  1.60 1.65   <NA>
> saveRDS(bfx,"betfairwres.rds")
> saveRDS(bf,"betfairwres.rds")
> saveRDS(bfx,"betfairxwres.rds")
> saveRDS(pin,"pinnaclewres.rds")
> saveRDS(b3,"bet365wres.rds")
> 

