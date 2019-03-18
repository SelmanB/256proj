> require(data.table)
> pin<-readRDS("pinnacleoddswp.rds")
> b3<-readRDS("bet365oddswp.rds")
> bf<-readRDS("betfairoddswp.rds")
> bfx<-readRDS("betfairxoddswp.rds")
> pdf("pinnacle1.pdf")
> plot(pin$phn-pin$pan,pin$pxn,col="green",main="Pinnacle",xlab="P(home win) - P(away win)",ylab="P(tie)")
> dev.off()
null device 
          1 
> pdf("bet3651.pdf")
> plot(b3$phn-b3$pan,b3$pxn,col="blue",main="Bet 365",xlab="P(home win) - P(away win)",ylab="P(tie)")
> dev.off()
null device 
          1 
> pdf("betfair1.pdf")
> plot(bf$phn-bf$pan,bf$pxn,col="orange",main="Betfair",xlab="P(home win) - P(away win)",ylab="P(tie)")
> dev.off()
null device 
          1 
> 
> pdf("betfairx1.pdf")
> plot(bfx$phn-bfx$pan,bfx$pxn,col="red",main="Betfair Exchange",xlab="P(home win) - P(away win)",ylab="P(tie)")
> def.off()
Hata: "def.off" fonksiyonu bulunamadı
> dev.off()
null device 
          1 
> 
