#first we clean the matches data table from unnecessary columns
#because we will further populate the table
> require(data.table)
> matches<-readRDS("matches.rds")
> matches[,score:=NULL]
> matches[,goals:=HomeGoal+AwayGoal]
#let us now get rid of matches with unknown results
> matches<-matches[!is.na(goals)]
#we test if away teams and home teams are the same
> sort(unique(matches$away))==sort(unique(matches$home))
 [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[16] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[31] TRUE TRUE TRUE TRUE TRUE
> matches[,MatchResult:=NULL]
> matches[,timestamp:=NULL]
> matches[,date_of_match:=NULL]
#now we seperate the matches we will use for training
> trainmatches<-matches[1:3000]
#
#
#
#We decide some useful predictors may be the average
#number of goals home and away teams had scored
#in the past as home and away teams.
#So we create a data table for team data
> teams<-sort(unique(matches$home))
> teams<-data.table(team=teams)
> homeavg<-rep(0,35)
> awayavg<-rep(0,35)
> homevar<-rep(0,35)
> awayvar<-rep(0,35)
#Keep in mind that we use trainmatches for these data
> for(i in 1:35){
+ homeavg[i]<-mean(trainmatches[home==teams[i]$team]$HomeGoal)
+ homevar[i]<-var(trainmatches[home==teams[i]$team]$HomeGoal)
+ awayavg[i]<-mean(trainmatches[away==teams[i]$team]$AwayGoal)
+ awayvar[i]<-var(trainmatches[away==teams[i]$team]$AwayGoal)}
> teams[,homeavg:=homeavg]
> teams[,homevar:=homevar]
> teams[,awayavg:=awayavg]
> teams[,awayvar:=awayvar]
> teams
                 team   homeavg   homevar   awayavg   awayvar
 1:           arsenal 2.0733333 2.2294855 1.6778523 1.5847089
 2:       aston villa 1.0789474 1.2945971 0.9298246 0.9507840
 3:        birmingham 1.0000000 0.6666667 0.9473684 0.4970760
 4:         blackburn 1.2631579 1.3342817 1.2105263 0.9815078
 5:         blackpool 1.5789474 0.8128655 1.3157895 1.4502924
 6:            bolton 1.5000000 1.7702703 1.0789474 1.3179232
 7:       bournemouth 1.4821429 1.6360390 1.0545455 1.0154882
 8:          brighton 1.2777778 1.3888889 0.5625000 0.7958333
 9:           burnley 1.0000000 0.8148148 0.8363636 0.8060606
10:           cardiff 1.0526316 1.2748538 0.6315789 0.8011696
11:           chelsea 2.1000000 1.9697987 1.6066667 1.8912304
12:    crystal palace 1.1182796 1.2358579 1.0744681 1.2739648
13:           everton 1.7333333 1.6331096 1.1000000 0.9899329
14:            fulham 1.5526316 1.4771930 0.9078947 0.9914035
15:      huddersfield 0.9411765 1.0588235 0.6470588 1.4926471
16:         hull city 1.1754386 1.4329574 0.7192982 0.8483709
17:         leicester 1.5675676 1.5364680 1.2837838 1.1649389
18:         liverpool 1.9733333 2.0798210 1.6887417 2.1624724
19:   manchester city 2.5100671 2.3596953 1.8266667 2.0368680
20: manchester united 2.0266667 1.9321700 1.6200000 1.6600000
21:     middlesbrough 0.8947368 0.6549708 0.5263158 0.5964912
22:         newcastle 1.4732824 1.7896653 0.9692308 0.9137746
23:           norwich 1.2631579 1.2364912 0.8421053 0.9080702
24:               qpr 1.0526316 0.9436090 0.9649123 0.8916040
25:           reading 1.2105263 1.2865497 1.0526316 1.1637427
26:       southampton 1.5089286 2.0539736 1.0803571 1.0655566
27:             stoke 1.3333333 1.1498881 0.8133333 0.7702908
28:        sunderland 1.1052632 1.0948963 1.0000000 1.1212121
29:           swansea 1.3692308 1.3819917 0.9694656 0.9990605
30:         tottenham 1.8322148 1.7486849 1.6423841 1.6845916
31:           watford 1.2500000 1.0636364 0.9454545 1.1265993
32:         west brom 1.3112583 1.1758057 0.9533333 0.9978076
33:          west ham 1.3923077 0.9844365 1.0992366 1.1516148
34:             wigan 1.2280702 1.1434837 1.0350877 0.8201754
35:            wolves 1.2894737 1.1842105 0.9736842 0.8911807
                 team   homeavg   homevar   awayavg   awayvar
#Beautiful! So we have some data that we may want to use as
#predictors in our model
> saveRDS(matches,"matches3.rds")
> saveRDS(trainmatches,"trainmatches.rds")
> saveRDS(teams,"teams.rds")
>q()


