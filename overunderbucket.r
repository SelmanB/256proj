> require(data.table)
> pin<-readRDS("Pinnacleouwres.rds")
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
> b3<-readRDS("Bet365ouwres.rds")
> bf<-readRDS("Betfairouwres.rds")
> bfx<-readRDS("Betfairxouwres.rds")
> br<-(0:30)/30
> bucketpin<-cut(pin$overpn,breaks=br,labels=1:30)
> bucketb3<-cut(b3$overpn,breaks=br,labels=1:30)
> bucketbf<-cut(bf$overpn,breaks=br,labels=1:30)
> bucketbfx<-cut(bfx$overpn,breaks=br,labels=1:30)
> 
> pin[,bucket:=bucketpin]
> b3[,bucket:=bucketb3]
> bf[,bucket:=bucketbf]
> bfx[,bucket:=bucketbfx]
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
        underpn isover bucket
   1: 0.5431472  FALSE     14
   2: 0.5255102  FALSE     15
   3: 0.4795918   TRUE     16
   4: 0.5860349  FALSE     13
   5: 0.3636364   TRUE     20
  ---                        
2924: 0.4455696  FALSE     17
2925: 0.4974490  FALSE     16
2926: 0.6322115  FALSE     12
2927: 0.4368687  FALSE     17
2928: 0.4139651     NA     18
> pinbsize<-rep(0,30)
> for(i in 1:30)
+ pinbsize[i]<-sum(pin$bucket==i)
> pinbsize
 [1]   0   0   0   0   0   0   0   0   0   6  32 122 279 431 524 481 402 322 186
[20] 133  10   0   0   0   0   0   0   0   0   0
> #we should merge buckets 10-11-12 and 20-21
> pinrange<-12:20
> pin[bucket==10 | bucket== 11]$bucket<-12
Warning message:
In `[<-.data.table`(x, j = name, value = value) :
  Coerced 'double' RHS to 'integer' to match the factor column's underlying type. Character columns are now recommended (can be in keys), or coerce RHS to integer or character first.
> pin[bucket==10 | bucket== 11]$bucket<-as.integer(12)
> pin[bucket== 21]$bucket<-as.integer(20)
> 
> 
> for(i in 1:30)
+ pinbsize[i]<-sum(pin$bucket==i)
> pinbsize
 [1]   0   0   0   0   0   0   0   0   0   0   0 160 279 431 524 481 402 322 186
[20] 143   0   0   0   0   0   0   0   0   0   0
> #it looks fine!
> b3bsize<-rep(0,30)
> for(i in 1:30)
+ b3bsize[i]<-sum(b3$bucket==i)
> b3bsize
 [1]   0   0   0   0   0   0   0   0   0   1   3  34 224 468 723 580 452 319 143
[20]  79  48  19   3   2   0   0   0   0   0   0
> b3range<-13:20
> 
> b3[bucket==10|bucket==11|bucket==12]$bucket<-as.integer(13)
> b3[bucket==21|bucket==22|bucket==23|bucket==24]$bucket<-as.integer(20)
> 
> bfbsize<-rep(0,30)
> for(i in 1:30)
+ bfbsize[i]<-sum(bf$bucket==i)
> bfbsize
 [1]   0   0   0   0   0   0   0   0   0   1  22  76 199 174 182 140 165 139 104
[20]  60  35  17   9   2   0   0   0   0   0   0
> #merge 10-11-12 and 20-21-22-23-24
> 
> bf[bucket==10 |bucket== 11]$bucket<-as.integer(12)
> bf[bucket==21 |bucket== 22|bucket==23|bucket==24]$bucket<-as.integer(20)
> bfrange<-12:20
> 
> 
> 
> 
> bfxbsize<-rep(0,30)
> for(i in 1:30)
+ bfxbsize[i]<-sum(bfx$bucket==i)
> bfxbsize
 [1]   0   0   0   0   0   0   0   0   0   2  22  71 189 312 388 468 321 289 144
[20] 119  37  35  12   1   0   0   0   0   0   0
> bfxrange<-12:21
> 
> bfx[bucket==10|bucket==11]$bucket<-as.integer(12)
> bfx[bucket==22|bucket==23|bucket==24]$bucket<-as.integer(21)
>
> 
> saveRDS(pin,"Pinnacleoubucket.rds")
> saveRDS(b3,"Bet365oubucket.rds")
> saveRDS(bf,"Betfairoubucket.rds")
> saveRDS(bfx,"Betfairxoubucket.rds")
> 
> 








