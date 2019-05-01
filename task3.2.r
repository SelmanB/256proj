> require("data.table")
> load("task1.RData")
> aways10<-matches[season==2011]$AwayGoal
> aways15<-matches[season==2016]$AwayGoal
> var(aways10)
[1] 1.241522
> var(aways15)
[1] 1.315505
> mean10<-mean(aways10)
> mean15<-mean(aways15)
> W10<-(aways10-mean10)^2
> W15<-(aways15-mean15)^2
> pdf("distribution-of-W.pdf")
> hist(W10,breaks=16,main="Distribution of W at 2010")
> hist(W15,breaks=16,main="Distribution of W at 2015")
> dev.off()
null device 
          1 
> #mean of W we defined is exactly sigma
> #and we have a fairly large sample so we use CLT
> #we suggest sigma has a normal dist. with variance we'll calculate
> #and we demonstrated this property seperately by a simulation
> #our null hypothesis: sigma2010==sigma2015
> #our alternative is: sigma2010!=sigma2015
> #or equivalently sigma2010-sigma2015==0
> #and sigma2010-sigma2015!=0
> #let us find about this new random (unknown) variable
> sum(matches$season==2011)
[1] 380
> var.sigma.sq.2010<-var(W10)/380
> var.sigma.sq.2015<-var(W15)/380
> mean.diff<-mean(W10)-mean(W15)
> mean.dev<-sqrt(var.sigma.sq.2010+var.sigma.sq.2015)
> mean.diff
[1] -0.07378809
> #to check this, let us calculate the equivalent
> var(aways10)-var(aways15)
[1] -0.07398278
> #which suggests totally acceptable computational error
> mean.dev
[1] 0.1498722
> #significance level of 0.05 suggests
> #0.025 error on both sides
> #let us find how much difference does it suggest
> std.diff<-qnorm(0.025)
> std.diff
[1] -1.959964
> #times std deviations
> #which means
> std.diff*mean.dev
[1] -0.2937442
> #which is much larger permissible error
> #than what we observed
> mean.dev
[1] 0.1498722
> #so we fail to reject null hypothesis

