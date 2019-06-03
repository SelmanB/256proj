> require(data.table)
> odds<-readRDS("odds.rds")
> matches<-readRDS("matches3.rds")
#we create new columns for average over/under odds
> matches[,"0.5":=0]
> matches[,"1.5":=0]
> matches[,"2.5":=0]
> matches[,"3.5":=0]
> matches[,"4.5":=0]
> matches[,"5.5":=0]
> matches[,u0.5:=0]
> matches[,u1.5:=0]
> matches[,u2.5:=0]
> matches[,u3.5:=0]
> matches[,u4.5:=0]
> matches[,u5.5:=0]
> ou<-odds[betType=="ou"]
> ou[,betType:=NULL]
#we realized that odds don't exist for first ~190 matches:
> ou[matchId==matches[190]$matchId]
Empty data.table (0 rows) of 6 cols: matchId,oddtype,bookmaker,date,odd,totalhandicap
> ou[matchId==matches[200]$matchId]
      matchId oddtype   bookmaker       date  odd totalhandicap
  1: W8y9bQEJ    over      bet365 1293978300 1.08           0.5
  2: W8y9bQEJ    over      bet365 1293720840 1.07           0.5
  3: W8y9bQEJ    over      bet365 1293978300 1.40           1.5
  4: W8y9bQEJ    over      bet365 1293720840 1.33           1.5
  5: W8y9bQEJ    over      bet365 1293982800 2.29           2.5
 ---                                                           
293: W8y9bQEJ   under      SBOBET 1293983940 1.65           2.5
294: W8y9bQEJ   under      SBOBET 1293587640 1.75           2.5
295: W8y9bQEJ   under    Pinnacle 1293983940 1.85          2.25
296: W8y9bQEJ   under    Pinnacle 1293450540 2.02          2.25
297: W8y9bQEJ   under Interwetten 1293616260 1.65           2.5
#Let us find those average odds for given numbers of goals
> for(i in 1:3310){
+ matches[i]$"1.5"<-mean(ou[matchId==matches[i]$matchId&oddtype=="over"&totalhandicap=="1.5"]$odd)
+ matches[i]$"0.5"<-mean(ou[matchId==matches[i]$matchId&oddtype=="over"&totalhandicap=="0.5"]$odd)
+ matches[i]$"2.5"<-mean(ou[matchId==matches[i]$matchId&oddtype=="over"&totalhandicap=="2.5"]$odd)
+ matches[i]$"3.5"<-mean(ou[matchId==matches[i]$matchId&oddtype=="over"&totalhandicap=="3.5"]$odd)
+ matches[i]$"4.5"<-mean(ou[matchId==matches[i]$matchId&oddtype=="over"&totalhandicap=="4.5"]$odd)
+ matches[i]$"5.5"<-mean(ou[matchId==matches[i]$matchId&oddtype=="over"&totalhandicap=="5.5"]$odd)}
> for(i in 1:3310){
+ matches[i]$u5.5<-mean(ou[matchId==matches[i]$matchId&oddtype=="under"&totalhandicap=="5.5"]$odd)
+ matches[i]$u4.5<-mean(ou[matchId==matches[i]$matchId&oddtype=="under"&totalhandicap=="4.5"]$odd)
+ matches[i]$u3.5<-mean(ou[matchId==matches[i]$matchId&oddtype=="under"&totalhandicap=="3.5"]$odd)
+ matches[i]$u2.5<-mean(ou[matchId==matches[i]$matchId&oddtype=="under"&totalhandicap=="2.5"]$odd)
+ matches[i]$u1.5<-mean(ou[matchId==matches[i]$matchId&oddtype=="under"&totalhandicap=="1.5"]$odd)
+ matches[i]$u0.5<-mean(ou[matchId==matches[i]$matchId&oddtype=="under"&totalhandicap=="0.5"]$odd)
+ }
> #let us also add the data for teams on the table
> teams<-readRDS("teams.rds")
> teams
                 team   homeavg   homevar   awayavg   awayvar
 1:           arsenal 2.0733333 2.2294855 1.6778523 1.5847089
 2:       aston villa 1.0789474 1.2945971 0.9298246 0.9507840
#...
#create new columns for all the data of the home and away teams:
> matches[,homehomeavg:=0]#home team's average goals when home
> matches[,homehomevar:=0]
> matches[,homeawayavg:=0]
> matches[,homeawayvar:=0]
> 
> matches[,awayhomeavg:=0]
> matches[,awayhomevar:=0]#away team's variance of goals when home
> matches[,awayawayavg:=0]
> matches[,awayawayvar:=0]
#we find the lines once in every loop to accelerate computing 
> homedat<-teams[1]
> awaydat<-teams[1]
> 
> for(i in 1:3310){
+ homedat<-teams[team==matches[i]$home]
+ awaydat<-teams[team==matches[i]$away]
+ matches[i]$homehomeavg<-homedat$homeavg
+ matches[i]$homehomevar<-homedat$homevar
+ matches[i]$homeawayavg<-homedat$awayavg
+ matches[i]$homeawayvar<-homedat$awayvar
+ 
+ matches[i]$awayhomeavg<-awaydat$homeavg
+ matches[i]$awayhomevar<-awaydat$homevar
+ matches[i]$awayawayavg<-awaydat$awayavg
+ matches[i]$awayawayvar<-awaydat$awayvar
+ }
#now we have added relevant data on the table.
#a typical line looks like:
> matches[350]
    matchId    home            away       date HomeGoal AwayGoal goals      0.5
1: Ol39Fr8d everton manchester city 1304780400        2        1     3 1.052857
        1.5      2.5    3.5      4.5    5.5     u0.5     u1.5     u2.5   u3.5
1: 1.332308 2.074857 3.6604 6.998333 13.835 8.485714 2.932692 1.683143 1.2288
       u4.5     u5.5 homehomeavg homehomevar homeawayavg homeawayvar
1: 1.071667 1.018333    1.733333     1.63311         1.1   0.9899329
   awayhomeavg awayhomevar awayawayavg awayawayvar
1:    2.510067    2.359695    1.826667    2.036868
#we can now save the data and exit:
> saveRDS(matches,"matches_w_parameters.rds")
> q()


