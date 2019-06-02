#continued from the last code
> matches[,predicted:=predict(model,matches)]
> matchesall<-readRDS("matches_everything.rds")
> matches[,over2.5:=matchesall$"2.5"]
> matches[,under2.5:=matchesall$u2.5]
> matches[,pcalcover:=pnorm((predicted-2.5)/sqrt(2.734))]
> matches[,pcalcunder:=1-pcalcover]
> matches[,poddover:=1/over2.5]
> matches[,poddunder:=1/under2.5]
> matches[,bet:="none"]
> matches[pcalcover>poddover]$bet<-"over"
> matches[pcalcunder>poddunder]$bet<-"under"
> matches[,gain:=0]
#now comes the strategy:
> for(i in 1:3310){
+ matches[i]$gain<-matches[i]$gain+(matches[i]$bet=="over" & matches[i]$goals>2.5)*(1/matches[i]$poddover)
+ matches[i]$gain<-matches[i]$gain+(matches[i]$bet=="over" & matches[i]$goals<2.5)*(-1.0)
+ matches[i]$gain<-matches[i]$gain+(matches[i]$bet=="under" & matches[i]$goals>2.5)*(-1.0)
+ matches[i]$gain<-matches[i]$gain+(matches[i]$bet=="under" & matches[i]$goals<2.5)*(1/matches[i]$poddunder)}
#in order to avoid the initial capital as gain
> matches[gain>1]$gain<-matches[gain>1]$gain-1
> mean(matches[3000:3310]$gain,na.rm=TRUE)
[1] -0.02768155
#not bad, but shows that we know all the information in the competition.
  [1] -1.0000000  0.0000000 -1.0000000  0.0000000 -1.0000000  1.6765116
  [7]  0.5232558 -1.0000000  0.0000000  0.8212245  0.7104082  0.0000000
 [13]  0.5272093  0.6904000  0.0000000 -1.0000000  0.9830612  0.0000000
 [19] -1.0000000 -1.0000000  0.0000000 -1.0000000 -1.0000000 -1.0000000
 [25]  0.6674000 -1.0000000  0.5565217  0.0000000  0.0000000  0.0000000
 [31] -1.0000000  0.0000000 -1.0000000 -1.0000000  0.0000000 -1.0000000
 [37]  0.0000000  0.4070732 -1.0000000  0.0000000 -1.0000000  0.6496825
 [43] -1.0000000  0.0000000  0.0000000  0.0000000 -1.0000000  0.3400000
 [49]  0.7183721 -1.0000000  0.6809302  0.6646527  0.8733922  0.0000000
 [55]  0.7219553 -1.0000000 -1.0000000  0.0000000  0.0000000  0.7876286
 [61] -1.0000000 -1.0000000 -1.0000000  0.0000000 -1.0000000 -1.0000000
 [67]  0.7283375  0.9758471  0.7810438  0.0000000  0.0000000  0.0000000
 [73]  2.4581206 -1.0000000 -1.0000000  0.0000000  0.0000000  0.0000000
 [79] -1.0000000  1.4690141  0.6496825 -1.0000000  0.0000000  0.0000000
 [85]  0.0000000 -1.0000000  0.3400000  0.7183721 -1.0000000  0.6809302
 [91]  0.6646527  0.8733922  0.0000000  0.7219553 -1.0000000 -1.0000000
 [97]  0.0000000  0.0000000  0.7876286 -1.0000000 -1.0000000 -1.0000000
[103]  0.0000000 -1.0000000 -1.0000000  0.7283375  0.9758471  0.7810438
[109]  0.0000000  0.0000000  0.0000000  2.4581206 -1.0000000 -1.0000000
[115]  0.0000000  0.0000000  0.0000000 -1.0000000  1.4690141  0.7732406
[121] -1.0000000  0.0000000  0.7005045 -1.0000000  0.0000000  1.6533905
[127]  0.0000000  0.4352395  0.7916110  0.0000000  0.8241200 -1.0000000
[133]  0.2794083 -1.0000000  0.0000000  0.0000000  0.0000000 -1.0000000
[139] -1.0000000  0.4906849  0.0000000  0.0000000  0.5443219 -1.0000000
[145] -1.0000000 -1.0000000  0.0000000  0.0000000 -1.0000000  0.0000000
[151]  0.7323761 -1.0000000 -1.0000000 -1.0000000  0.9980341 -1.0000000
[157]  0.9269953  0.3007353  0.4202128  0.8476296  0.0000000  0.0000000
[163]  0.7552395  0.9381667  0.0000000 -1.0000000  0.0000000  1.4458081
[169]  0.4895238  1.2841958  0.0000000  0.6452905  0.0000000        NaN
[175] -1.0000000  0.8716190  0.0000000  0.5163271  0.6471362 -1.0000000
[181]  0.0000000  0.0000000  0.7996891  1.0903697  0.2582239  0.0000000
[187]  0.9645640  2.1196887  0.5502778  0.0000000  0.0000000  1.5051741
[193]  0.0000000  0.4776923  0.9087354  0.0000000  0.5751674 -1.0000000
[199]  0.0000000  0.6382057  0.5822323 -1.0000000  1.4604145  0.0000000
[205]  0.5690496 -1.0000000 -1.0000000 -1.0000000  0.0000000  0.8578607
[211]  0.0000000 -1.0000000  0.0000000  0.0000000  0.0000000  0.0000000
[217] -1.0000000  0.6221029  0.8504049  0.6536858 -1.0000000  0.0000000
[223]  0.0000000  1.3943804  0.3499634  0.0000000  0.8427982  0.0000000
[229]  0.7784178  0.7508563  0.0000000  0.8643123  0.0000000  0.0000000
[235] -1.0000000 -1.0000000  0.0000000 -1.0000000  0.0000000  0.0000000
[241]  0.0000000 -1.0000000 -1.0000000  0.0000000  0.0000000  0.4842526
[247] -1.0000000  0.4868167 -1.0000000  0.5460099 -1.0000000  0.0000000
[253]  0.6722391 -1.0000000 -1.0000000  0.7184858  1.3988919 -1.0000000
[259] -1.0000000  0.6369492 -1.0000000  0.0000000 -1.0000000 -1.0000000
[265] -1.0000000  1.1510874  0.0000000  0.0000000  0.0000000  0.0000000
[271]  1.3976483  0.0000000 -1.0000000  1.2584314 -1.0000000  0.0000000
[277]  0.0000000 -1.0000000  0.4314583  0.8447925 -1.0000000  0.0000000
[283]  0.0000000 -1.0000000  0.0000000  0.0000000  0.0000000 -1.0000000
[289]  0.0000000  0.0000000  1.0051385  0.0000000 -1.0000000  0.8298418
[295]  0.0000000  1.0130392 -1.0000000 -1.0000000  0.3379420 -1.0000000
[301] -1.0000000  0.6513462 -1.0000000  0.0000000  0.7737755  0.0000000
[307]  0.0000000  1.3247627  0.8058135  0.6128982  0.0000000
#the number of non-betted matches also shows we don't have much more information than bet odd.
#let us compare our profit with the bookmakers' commission to see if we perform well:
> mean(matches$poddover+matches$poddunder,na.rm=TRUE)
[1] 1.062436
#GOOD NEWS! we could gain an extra of 4% compared to "market information", but we still don't profit due to bookmakers. If this was for example a stock market, however, it would be a large profit margin for trades.
> saveRDS(matches,"matches_final.rds")
>
