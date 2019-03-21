> require(data.table)
> pin<-readRDS("Pinnacleouprob.rds")
> b3<-readRDS("Bet365ouprob.rds")
> bf<-readRDS("Betfairouprob.rds")
> bfx<-readRDS("Betfairxouprob.rds")
>
> pdf("Pinneacleoverunder.pdf")
> plot(pin$x,pin$y,main="Pinnacle",xlab="Odd-Implied Probability of Over 2.5",ylab="Real Probability of Over 2.5",col="green")
> lines(c(0,1),c(0,1))
> dev.off()
null device 
          1 
> 
> 
> pdf("Bet365overunder.pdf")
> plot(b3$x,b3$y,main="Bet 365",xlab="Odd-Implied Probability of Over 2.5",ylab="Real Probability of Over 2.5",col="blue")
> lines(c(0,1),c(0,1))
> dev.off()
null device 
          1 
> 
> 
> pdf("Betfairoverunder.pdf")
> plot(bf$x,bf$y,main="Betfair",xlab="Odd-Implied Probability of Over 2.5",ylab="Real Probability of Over 2.5",col="orange")
> lines(c(0,1),c(0,1))
> dev.off()
null device 
          1 
> 
> 
> pdf("Betfairxoverunder.pdf")
> plot(bfx$x,bfx$y,main="Betfair Exchange",xlab="Odd-Implied Probability of Over 2.5",ylab="Real Probability of Over 2.5",col="red")
> lines(c(0,1),c(0,1))
> dev.off()
null device 
          1 
> 
> q()

