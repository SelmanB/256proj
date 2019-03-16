> require(data.table)
> matches<-readRDS("matches.rds")
> homes<-matches[!is.na(HomeGoal)]$HomeGoal
> aways<-matches[!is.na(AwayGoal)]$AwayGoal
> sort(unique(aways))
[1] 0 1 2 3 4 5 6 7
> sort(unique(homes))
[1] 0 1 2 3 4 5 6 7 8
> homebreaks<-0:9-0.5
> awaybreaks<-0:8-0.5
> diff<-matches$HomeGoal-matches$AwayGoal
> sort(unique(diff))
 [1] -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7  8
> pdf("HomeScore.pdf")
> hist(homes,breaks=homebreaks,col="red",main="Home Score (goals)",xlab="Home Goals",ylab="Number of Games")
> dev.off()
null device 
          1 
> pdf("AwayScore.pdf")
> hist(aways,breaks=awaybreaks,col="blue",main="Away Score (goals)",xlab="Away Goals",ylab="Number of Games")
> dev.off()
null device 
          1 
> diffbreaks<--6:9-0.5
> pdf("ScoreDifference")
> hist(diff,breaks=diffbreaks,col="gray",main="Home Score (goals) - Away Score (goals)",xlab="Home Goals - Away Goals",ylab="Number of Games")
> dev.off()
null device 
          1 
> homerate<-mean(homes)
> awayrate<-mean(aways)
> homex<-sort(unique(homes))
> awayx<-sort(unique(aways))
> homenorm<-sum(homes==1)/dpois(1,homerate)
> pdf("HomesWithPois.pdf")
> hist(homes,breaks=homebreaks,col="pink",main="Home Score (goals)",xlab="Home Goals",ylab="Number of Games")
> points(homex,dpois(homex,homerate)*homenorm,type="b",col="red")
> dev.off()
null device 
          1 
> awaynorm<-sum(aways==1)/dpois(1,awayrate)
> pdf("AwaysWithPois.pdf")
> hist(aways,breaks=awaybreaks,col="lightblue",main="Away Score (goals)",xlab="Away Goals",ylab="Number of Games")
> points(awayx,dpois(awayx,awayrate)*awaynorm,type="b",col="blue")
> dev.off()
null device 
          1 



