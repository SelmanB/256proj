> require(data.table)
> pin<-readRDS("pinnaclehist.rds")
> b3<-readRDS("bet365hist.rds")
> bf<-readRDS("betfairhist.rds")
> bfx<-readRDS("betfairxhist.rds")
> pr<-readRDS("probability.rds")
> pdf("pinnacleprob.pdf")
> plot(pin$diff,pin$pxn,col="green",main="Pinnacle",xlab="P(home win) - P(away win)", ylab="P(tie)")
> points(((1:10)-5.5)/5,pr$pin,pch=3,cex=5)
> dev.off()
null device 
          1 
> 
> 
> pdf("b365prob.pdf")
> plot(b3$diff,b3$pxn,col="blue",main="Bet365",xlab="P(home win) - P(away win)", ylab="P(tie)")
> points(((1:10)-5.5)/5,pr$b3,pch=3,cex=5)
> dev.off()
null device 
          1 
> 
> 
> pdf("betfairprob.pdf")
> plot(bf$diff,bf$pxn,col="orange",main="Betfair",xlab="P(home win) - P(away win)", ylab="P(tie)")
> points(((1:10)-5.5)/5,pr$bf,pch=3,cex=5)
> dev.off()
null device 
          1 
> 
> 
> pdf("betfairxprob.pdf")
> plot(bfx$diff,bfx$pxn,col="red",main="Betfair Exchange",xlab="P(home win) - P(away win)", ylab="P(tie)")
> points(((1:10)-5.5)/5,pr$bfx,pch=3,cex=5)
> dev.off()
null device 
          1 
> 

