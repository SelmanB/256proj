> require(data.table)
> pin<-readRDS("Pinnacleoubucket.rds")
> b3<-readRDS("Bet365oubucket.rds")
> bf<-readRDS("Betfairoubucket.rds")
> bfx<-readRDS("Betfairxoubucket.rds")
> 
> sort(unique(pin$bucket))
[1] 12 13 14 15 16 17 18 19 20
30 Levels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ... 30
> sort(unique(b3$bucket))
[1] 13 14 15 16 17 18 19 20
30 Levels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ... 30
> sort(unique(bf$bucket))
[1] 12 13 14 15 16 17 18 19 20
30 Levels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ... 30
> sort(unique(bfx$bucket))
 [1] 12 13 14 15 16 17 18 19 20 21
30 Levels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ... 30
> 
> pinover<-rep(0,9)
> b3over<-rep(0,8)
> bfover<-rep(0,9)
> bfxover<-rep(0,10)
> 
> for(i in 12:20)
+ pinover[i-11]<-sum(pin[bucket==i]$isover==TRUE,na.rm=TRUE)
> 
> for(i in 13:20)
+ b3over[i-12]<-sum(b3[bucket==i]$isover==TRUE,na.rm=TRUE)
> 
> for(i in 12:20)
+ bfover[i-11]<-sum(bf[bucket==i]$isover==TRUE,na.rm=TRUE)
> 
> for(i in 12:21)
+ bfxover[i-11]<-sum(bfx[bucket==i]$isover==TRUE,na.rm=TRUE)
> 
> pinover
[1]  50 103 206 268 271 225 177 111  94
> b3over
[1]  99 205 380 313 247 193  85 102
> bfover
[1] 29 86 77 99 78 91 82 64 83
> bfxover
 [1]  29  73 143 209 263 179 162  91  73  60
> 
> pintot<-rep(0,9)
> b3tot<-rep(0,8)
> bftot<-rep(0,9)
> bfxtot<-rep(0,10)
> 
> for(i in 12:20)
+ pintot[i-11]<-sum(!is.na(pin[bucket==i]$isover))
> 
> for(i in 13:20)
+ b3tot[i-12]<-sum(!is.na(b3[bucket==i]$isover))
> 
> for(i in 12:20)
+ bftot[i-11]<-sum(!is.na(bf[bucket==i]$isover))
> 
> for(i in 12:21)
+ bfxtot[i-11]<-sum(!is.na(bfx[bucket==i]$isover))
> 
> pintot
[1] 156 272 426 520 477 400 320 184 140
> b3tot
[1] 257 458 715 578 450 316 142 146
> bftot
[1]  95 192 169 176 138 163 138 101 117
> bfxtot
 [1]  91 186 305 383 464 317 288 142 117  81
> 
> 
> pinp<-pinover/pintot
> b3p<-b3over/b3tot
> bfp<-bfover/bftot
> bfxp<-bfxover/bfxtot
> 
> pinp
[1] 0.3205128 0.3786765 0.4835681 0.5153846 0.5681342 0.5625000 0.5531250
[8] 0.6032609 0.6714286
> 
> b3p
[1] 0.3852140 0.4475983 0.5314685 0.5415225 0.5488889 0.6107595 0.5985915
[8] 0.6986301
> 
> bfp
[1] 0.3052632 0.4479167 0.4556213 0.5625000 0.5652174 0.5582822 0.5942029
[8] 0.6336634 0.7094017
> 
> bfxp
 [1] 0.3186813 0.3924731 0.4688525 0.5456919 0.5668103 0.5646688 0.5625000
 [8] 0.6408451 0.6239316 0.7407407
> 
> 
> 
> 
> pinx<-rep(0,9)
> b3x<-rep(0,8)
> bfx<-rep(0,9)
> bfxx<-rep(0,10)
> 
> for(i in 12:20)
+ pinx[i-11]<-mean(pin[bucket==i]$overp)
> pinx
[1] 0.3887691 0.4303061 0.4630080 0.4944953 0.5286860 0.5621897 0.5989713
[8] 0.6369369 0.6701228
> 
> for(i in 13:20)
+ b3x[i-12]<-mean(b3[bucket==i]$overp)
> 
> for(i in 12:20)
+ bfx[i-11]<-mean(bf[bucket==i]$overp)
>
> bfxdata<-readRDS("Betfairxoubucket.rds")
> for(i in 12:21)
+ bfxx[i-11]<-mean(bfxdata[bucket==i]$overp)

> 
> pinpoints<-data.table(x=pinx,y=pinp)
> b3points<-data.table(x=b3x,y=b3p)
> bfpoints<-data.table(x=bfx,y=bfp)
> bfxpoints<-data.table(x=bfxx,y=bfxp)
> 
> pinpoints
           x         y
1: 0.3887691 0.3205128
2: 0.4303061 0.3786765
3: 0.4630080 0.4835681
4: 0.4944953 0.5153846
5: 0.5286860 0.5681342
6: 0.5621897 0.5625000
7: 0.5989713 0.5531250
8: 0.6369369 0.6032609
9: 0.6701228 0.6714286
> b3points
           x         y
1: 0.4373638 0.3852140
2: 0.4792173 0.4475983
3: 0.5089463 0.5314685
4: 0.5499208 0.5415225
5: 0.5836246 0.5488889
6: 0.6186969 0.6107595
7: 0.6568861 0.5985915
8: 0.7083830 0.6986301
> bfpoints
           x         y
1: 0.3918274 0.3052632
2: 0.4356194 0.4479167
3: 0.4682174 0.4556213
4: 0.5046809 0.5625000
5: 0.5396633 0.5652174
6: 0.5684844 0.5582822
7: 0.6044083 0.5942029
8: 0.6402934 0.6336634
9: 0.7099323 0.7094017
> bfxpoints
            x         y
 1: 0.3966194 0.3186813
 2: 0.4315930 0.3924731
 3: 0.4683233 0.4688525
 4: 0.5029766 0.5456919
 5: 0.5815855 0.5668103
 6: 0.5984617 0.5646688
 7: 0.6371957 0.5625000
 8: 0.6363294 0.6408451
 9: 0.6710599 0.6239316
10: 0.7347597 0.7407407
> saveRDS(pinpoints,"Pinnacleouprob.rds")
> saveRDS(b3points,"Bet365ouprob.rds")
> saveRDS(bfpoints,"Betfairouprob.rds")
> saveRDS(bfxpoints,"Betfairxouprob.rds")
> q()





