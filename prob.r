> require(data.table)
> pin<-readRDS("pinnaclehist.rds")
> b3<-readRDS("bet365hist.rds")
> bf<-readRDS("betfairhist.rds")
> bfx<-readRDS("betfairxhist.rds")
> 
> pindraws<-1:10
> for(i in 1:10)
+ pindraws[i]<-sum(pin[bucket==i]$result=="draw",na.rm=TRUE)
> pindraws
 [1]   0   7  45  76 120 233 177  91  60   3
> b3draws<-1:10
> bfdraws<-1:10
> bfxdraws<-1:10
> for(i in 1:10)
+ b3draws[i]<-sum(b3[bucket==i]$result=="draw",na.rm=TRUE)
> 
> for(i in 1:10)
+ bfdraws[i]<-sum(bf[bucket==i]$result=="draw",na.rm=TRUE)
> 
> for(i in 1:10)
+ bfxdraws[i]<-sum(bfx[bucket==i]$result=="draw",na.rm=TRUE)
> 
> pinsum<-1:10
> b3sum<-1:10
> bfsum<-1:10
> bfxsum<-1:10
> for(i in 1:10)
+ pinsum[i]<-sum(!is.na(pin[bucket==i]$result))
> 
> for(i in 1:10)
+ b3sum[i]<-sum(!is.na(b3[bucket==i]$result))
> 
> for(i in 1:10)
+ bfsum[i]<-sum(!is.na(bf[bucket==i]$result))
> 
> 
> for(i in 1:10)
+ bfxsum[i]<-sum(!is.na(bfx[bucket==i]$result))
>
>
> pinp<-pindraws/pinsum
> b3p<-b3draws/b3sum
> bfp<-bfdraws/bfsum
> bfxp<-bfxdraws/bfxsum
> pinp
 [1] 0.00000000 0.13207547 0.16791045 0.26027397 0.29925187 0.31874145
 [7] 0.28050713 0.21513002 0.14598540 0.06976744
> b3p
 [1] 0.00000000 0.13207547 0.15234375 0.27574751 0.28780488 0.32345013
 [7] 0.26989080 0.24069479 0.13075061 0.06060606
> bfp
 [1] 0.0000000 0.1111111 0.1565217 0.2131148 0.2654321 0.3433333 0.2600000
 [8] 0.2534247 0.1802326 0.0000000
> bfxp
 [1] 0.00000000 0.11320755 0.18981481 0.26484018 0.29096045 0.30604982
 [7] 0.27593361 0.22929936 0.15337423 0.02631579
>
>
> prob<-data.table(pin=pinp,b365=b3p,bf=bfp,bfx=bfxp)
> saveRDS(prob,"probability.rds")
> prob
           pin       b365        bf        bfx
 1: 0.00000000 0.00000000 0.0000000 0.00000000
 2: 0.13207547 0.13207547 0.1111111 0.11320755
 3: 0.16791045 0.15234375 0.1565217 0.18981481
 4: 0.26027397 0.27574751 0.2131148 0.26484018
 5: 0.29925187 0.28780488 0.2654321 0.29096045
 6: 0.31874145 0.32345013 0.3433333 0.30604982
 7: 0.28050713 0.26989080 0.2600000 0.27593361
 8: 0.21513002 0.24069479 0.2534247 0.22929936
 9: 0.14598540 0.13075061 0.1802326 0.15337423
10: 0.06976744 0.06060606 0.0000000 0.02631579
> q()
