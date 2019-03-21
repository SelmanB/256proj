> #do the same as we did for finding final odds for initial odds
> require(data.table)
> odds<-readRDS("odds.rds")
>
> pin<-odds[betType=="ou"& bookmaker=="Pinnacle"& totalhandicap==2.5]
> b3<-odds[betType=="ou"& bookmaker=="bet365"& totalhandicap==2.5]
> bf<-odds[betType=="ou"& bookmaker=="Betfair"& totalhandicap==2.5]
> bfx<-odds[betType=="ou"& bookmaker=="Betfair Exchange"& totalhandicap==2.5]
>
> pinmatches<-sort(unique(pin$matchId))
> b3matches<-sort(unique(b3$matchId))
> bfmatches<-sort(unique(bf$matchId))
> bfxmatches<-sort(unique(bfx$matchId))
>
> pinl<-data.table(matchId=pinmatches,overodd=0,underodd=0)
> b3l<-data.table(matchId=b3matches,overodd=0,underodd=0)
> bfl<-data.table(matchId=bfmatches,overodd=0,underodd=0)
> bfxl<-data.table(matchId=bfxmatches,overodd=0,underodd=0)
>
> for(i in 1:length(bfxl$matchId)){
+ bfxl[i]$overodd<-last(bfx[matchId==bfxl[i]$matchId & oddtype=="over"]$odd)
+ bfxl[i]$underodd<-last(bfx[matchId==bfxl[i]$matchId & oddtype=="under"]$odd)}
>
> for(i in 1:length(bfl$matchId)){
+ bfl[i]$overodd<-last(bf[matchId==bfl[i]$matchId & oddtype=="over"]$odd)
+ bfl[i]$underodd<-last(bf[matchId==bfl[i]$matchId & oddtype=="under"]$odd)}
> 
> for(i in 1:length(b3l$matchId)){
+ b3l[i]$overodd<-last(b3[matchId==b3l[i]$matchId & oddtype=="over"]$odd)
+ b3l[i]$underodd<-last(b3[matchId==b3l[i]$matchId & oddtype=="under"]$odd)}
>
> for(i in 1:length(pinl$matchId)){
+ pinl[i]$overodd<-last(pin[matchId==pinl[i]$matchId & oddtype=="over"]$odd)
+ pinl[i]$underodd<-last(pin[matchId==pinl[i]$matchId & oddtype=="under"]$odd)}
> 
> pinl
       matchId overodd underodd
   1: 004f4ING    2.20     1.75
   2: 02oVDuv1    2.02     1.88
   3: 04PCiQzK    2.02     1.88
   4: 04vrPwsg    2.49     1.59
   5: 04zko0D5    1.50     2.87
  ---                          
2924: zXRqAtdp    1.82     2.11
2925: zXtioUye    1.85     2.08
2926: zXweIXVE    2.48     1.60
2927: zylytbNg    1.76     2.16
2928: zZ6f59Ue    1.72     2.22
> 
> 
> pinl[,overp:=1/overodd]
> pinl[,underp:=1/underodd]
> pinl[,totalp:=overodd+underodd]
> pinl[,overpn:=overp/totalp]
> pinl[,underpn:=underp/totalp]
> 
> b3l[,overp:=1/overodd]
> b3l[,underp:=1/underodd]
> b3l[,totalp:=overodd+underodd]
> b3l[,overpn:=overp/totalp]
> b3l[,underpn:=underp/totalp]
> 
> bfl[,overp:=1/overodd]
> bfl[,underp:=1/underodd]
> bfl[,totalp:=overodd+underodd]
> bfl[,overpn:=overp/totalp]
> bfl[,underpn:=underp/totalp]
> 
> bfxl[,overp:=1/overodd]
> bfxl[,underp:=1/underodd]
> bfxl[,totalp:=overodd+underodd]
> bfxl[,overpn:=overp/totalp]
> bfxl[,underpn:=underp/totalp]
> 
> pinl
       matchId overodd underodd     overp    underp totalp     overpn
   1: 004f4ING    2.20     1.75 0.4545455 0.5714286   3.95 0.11507480
   2: 02oVDuv1    2.02     1.88 0.4950495 0.5319149   3.90 0.12693577
   3: 04PCiQzK    2.02     1.88 0.4950495 0.5319149   3.90 0.12693577
   4: 04vrPwsg    2.49     1.59 0.4016064 0.6289308   4.08 0.09843295
   5: 04zko0D5    1.50     2.87 0.6666667 0.3484321   4.37 0.15255530
  ---                                                                
2924: zXRqAtdp    1.82     2.11 0.5494505 0.4739336   3.93 0.13980930
2925: zXtioUye    1.85     2.08 0.5405405 0.4807692   3.93 0.13754212
2926: zXweIXVE    2.48     1.60 0.4032258 0.6250000   4.08 0.09882985
2927: zylytbNg    1.76     2.16 0.5681818 0.4629630   3.92 0.14494434
2928: zZ6f59Ue    1.72     2.22 0.5813953 0.4504505   3.94 0.14756227
         underpn
   1: 0.14466546
   2: 0.13638843
   3: 0.13638843
   4: 0.15414971
   5: 0.07973274
  ---           
2924: 0.12059380
2925: 0.12233314
2926: 0.15318627
2927: 0.11810280
2928: 0.11432753
> saveRDS(pinl,"Pinnacleinitou.rds")
> saveRDS(b3l,"Bet365initou.rds")
> saveRDS(bfl,"Betfairinitou.rds")
> saveRDS(bfxl,"Betfairxinitou.rds")
> 
> q()

