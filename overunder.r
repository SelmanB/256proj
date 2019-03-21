> require(data.table)
> odds<-readRDS("odds.rds")
> odds
          matchId betType oddtype bookmaker       date  odd totalhandicap
      1: 004f4ING     1x2    odd1     10Bet 1420971300 1.67          <NA>
      2: 004f4ING     1x2    odd1     10Bet 1422806160 1.65          <NA>
      3: 004f4ING     1x2    odd1     12BET 1421025840 1.67          <NA>
      4: 004f4ING     1x2    odd1     12BET 1422805680 1.65          <NA>
      5: 004f4ING     1x2    odd1    188BET 1421036580 1.70          <NA>
     ---                                                                 
8486024: zZ6f59Ue      ou   under    SBOBET 1534519020 1.64          3.25
8486025: zZ6f59Ue      ou   under    SBOBET 1534122660 2.25           2.5
8486026: zZ6f59Ue      ou   under    SBOBET 1534099500 1.95          2.75
8486027: zZ6f59Ue      ou   under    SBOBET 1534395840 1.73             3
8486028: zZ6f59Ue      ou   under    SBOBET 1534522620 1.64          3.25
> odds[betType=="ou"]
          matchId betType oddtype bookmaker       date  odd totalhandicap
      1: 004f4ING      ou    over     1xBet 1422193680 1.05           0.5
      2: 004f4ING      ou    over     1xBet 1420974480 1.06           0.5
      3: 004f4ING      ou    over     1xBet 1422805620 1.08          0.75
      4: 004f4ING      ou    over     1xBet 1422193680 1.08          0.75
      5: 004f4ING      ou    over     1xBet 1422805620 1.10             1
     ---                                                                 
2670191: zZ6f59Ue      ou   under    SBOBET 1534519020 1.64          3.25
2670192: zZ6f59Ue      ou   under    SBOBET 1534122660 2.25           2.5
2670193: zZ6f59Ue      ou   under    SBOBET 1534099500 1.95          2.75
2670194: zZ6f59Ue      ou   under    SBOBET 1534395840 1.73             3
2670195: zZ6f59Ue      ou   under    SBOBET 1534522620 1.64          3.25
> sort(unique(odds[betType=="ou"]$bookmaker))
 [1] "10Bet"            "12BET"            "188BET"           "1xBet"           
 [5] "888sport"         "bet365"           "bet-at-home"      "Betclic"         
 [9] "Betfair"          "Betfair Exchange" "Betsafe"          "Betsson"         
[13] "BetVictor"        "Betway"           "bwin"             "ComeOn"          
[17] "Expekt"           "Interwetten"      "Paddy Power"      "Pinnacle"        
[21] "SBOBET"           "Sportingbet"      "Tipico"           "Unibet"          
[25] "William Hill"     "youwin"          
> pin<-odds[betType=="ou"& bookmaker=="Pinnacle"& totalhandicap==2.5]
> pin
        matchId betType oddtype bookmaker       date  odd totalhandicap
    1: 004f4ING      ou    over  Pinnacle 1422805740 2.14           2.5
    2: 004f4ING      ou    over  Pinnacle 1421617740 2.20           2.5
    3: 004f4ING      ou   under  Pinnacle 1422805740 1.80           2.5
    4: 004f4ING      ou   under  Pinnacle 1421617740 1.75           2.5
    5: 02oVDuv1      ou    over  Pinnacle 1509804540 2.06           2.5
   ---                                                                 
25183: zZ6f59Ue      ou   under  Pinnacle 1534606260 2.39           2.5
25184: zZ6f59Ue      ou   under  Pinnacle 1534605480 2.40           2.5
25185: zZ6f59Ue      ou   under  Pinnacle 1534605420 2.39           2.5
25186: zZ6f59Ue      ou   under  Pinnacle 1534153560 2.22           2.5
25187: zZ6f59Ue      ou   under  Pinnacle 1534157160 2.22           2.5
> b3<-odds[betType=="ou"& bookmaker=="bet365"& totalhandicap==2.5]
> b3
        matchId betType oddtype bookmaker       date  odd totalhandicap
    1: 004f4ING      ou    over    bet365 1422805800 2.08           2.5
    2: 004f4ING      ou    over    bet365 1420973340 2.00           2.5
    3: 004f4ING      ou   under    bet365 1422805800 1.73           2.5
    4: 004f4ING      ou   under    bet365 1420973340 1.80           2.5
    5: 02oVDuv1      ou    over    bet365 1509807540 2.04           2.5
   ---                                                                 
17803: zZ6f59Ue      ou   under    bet365 1534550160 2.35           2.5
17804: zZ6f59Ue      ou   under    bet365 1534550100 2.30           2.5
17805: zZ6f59Ue      ou   under    bet365 1534549980 2.35           2.5
17806: zZ6f59Ue      ou   under    bet365 1533823980 2.10           2.5
17807: zZ6f59Ue      ou   under    bet365 1533827580 2.10           2.5
> bf<-odds[betType=="ou"& bookmaker=="Betfair"& totalhandicap==2.5]
> bf
        matchId betType oddtype bookmaker       date  odd totalhandicap
    1: 02oVDuv1      ou    over   Betfair 1509804480 2.10           2.5
    2: 02oVDuv1      ou    over   Betfair 1509458400 2.05           2.5
    3: 02oVDuv1      ou   under   Betfair 1509804480 1.80           2.5
    4: 02oVDuv1      ou   under   Betfair 1509458400 1.85           2.5
    5: 04zko0D5      ou    over   Betfair 1535861220 1.57           2.5
   ---                                                                 
11631: zZ6f59Ue      ou   under   Betfair 1533933360 2.20           2.5
11632: zZ6f59Ue      ou   under   Betfair 1533900060 2.25           2.5
11633: zZ6f59Ue      ou   under   Betfair 1533821040 2.20           2.5
11634: zZ6f59Ue      ou   under   Betfair 1532714940 2.25           2.5
11635: zZ6f59Ue      ou   under   Betfair 1532718540 2.25           2.5
> bfx<-odds[betType=="ou"& bookmaker=="Betfair Exchange"& totalhandicap==2.5]
> bfx
        matchId betType oddtype        bookmaker       date  odd totalhandicap
    1: 04PCiQzK      ou    over Betfair Exchange 1316271000 1.87           2.5
    2: 04PCiQzK      ou    over Betfair Exchange 1315481460 1.02           2.5
    3: 04PCiQzK      ou   under Betfair Exchange 1316271000 2.01           2.5
    4: 04PCiQzK      ou   under Betfair Exchange 1315481460 1.02           2.5
    5: 04zko0D5      ou    over Betfair Exchange 1536804660 1.54           2.5
   ---                                                                        
38916: zZ6f59Ue      ou   under Betfair Exchange 1534586700 2.50           2.5
38917: zZ6f59Ue      ou   under Betfair Exchange 1534581780 2.52           2.5
38918: zZ6f59Ue      ou   under Betfair Exchange 1534580760 2.50           2.5
38919: zZ6f59Ue      ou   under Betfair Exchange 1533546660 1.37           2.5
38920: zZ6f59Ue      ou   under Betfair Exchange 1533550260 1.37           2.5
> pinmatches<-sort(unique(pin$matchId))
> b3matches<-sort(unique(b3$matchId))
> bfmatches<-sort(unique(bf$matchId))
> bfxmatches<-sort(unique(bfx$matchId))
> pinl<-data.table(matchId=pinmatches,overodd=0,underodd=0)
> b3l<-data.table(matchId=b3matches,overodd=0,underodd=0)
> bfl<-data.table(matchId=bfmatches,overodd=0,underodd=0)
> bfxl<-data.table(matchId=bfxmatches,overodd=0,underodd=0)
> 
> 
> 
> pinl
       matchId overodd underodd
   1: 004f4ING       0        0
   2: 02oVDuv1       0        0
   3: 04PCiQzK       0        0
   4: 04vrPwsg       0        0
   5: 04zko0D5       0        0
  ---                          
2924: zXRqAtdp       0        0
2925: zXtioUye       0        0
2926: zXweIXVE       0        0
2927: zylytbNg       0        0
2928: zZ6f59Ue       0        0
> 
> 
> sum(is.na(pin$odd))
[1] 0
> sum(is.na(b3$odd))
[1] 0
> for(i in 1:length(bfxl$matchId)){
+ bfxl[i]$overodd<-first(bfx[matchId==bfxl[i]$matchId & oddtype=="over"]$odd)
+ bfxl[i]$underodd<-first(bfx[matchId==bfxl[i]$matchId & oddtype=="under"]$odd)} 
> bfxl
       matchId overodd underodd
   1: 04PCiQzK    1.87     2.01
   2: 04zko0D5    1.54     2.44
   3: 061xSktd    1.65     2.39
   4: 069WnDBn    2.22     1.72
   5: 06AqtiDs    1.69     2.29
  ---                          
2406: zXmHZnXA    2.54     1.58
2407: zXtioUye    1.95     1.93
2408: zXweIXVE    2.67     1.53
2409: zy3x0uCs    1.61     2.44
2410: zZ6f59Ue    1.67     2.33
>  for(i in 1:length(bfl$matchId)){
+ bfl[i]$overodd<-first(bf[matchId==bfl[i]$matchId & oddtype=="over"]$odd)
+ bfl[i]$underodd<-first(bf[matchId==bfl[i]$matchId & oddtype=="under"]$odd)}
> 
> for(i in 1:length(pinl$matchId)){
+ pinl[i]$overodd<-first(pin[matchId==pinl[i]$matchId & oddtype=="over"]$odd)
+ pinl[i]$underodd<-first(pin[matchId==pinl[i]$matchId & oddtype=="under"]$odd)
+ }
> for(i in 1:length(b3l$matchId)){
+ b3l[i]$overodd<-first(b3[matchId==b3l[i]$matchId & oddtype=="over"]$odd)
+ b3l[i]$underodd<-first(b3[matchId==b3l[i]$matchId & oddtype=="under"]$odd)}
> 
> pinl[,overp:=1/overodd]
> pinl[,underp:=1/underodd]
> pinl[,totalp:=overodd+underodd]
> pinl[,overpn:=overp/totalp]
> pinl[,underpn:=underp/totalp]
> 
> b3l[,overp:=1/overodd]
> b3l[,underp:=1/underodd]
> b3l[,totalp:=overodd+underodd]
> b3l[,overpn:=overp/totalp]
> b3l[,underpn:=underp/totalp]
> 
> bfl[,overp:=1/overodd]
> bfl[,underp:=1/underodd]
> bfl[,totalp:=overodd+underodd]
> bfl[,overpn:=overp/totalp]
> bfl[,underpn:=underp/totalp]
> 
> bfxl[,overp:=1/overodd]
> bfxl[,underp:=1/underodd]
> bfxl[,totalp:=overodd+underodd]
> bfxl[,overpn:=overp/totalp]
> bfxl[,underpn:=underp/totalp]
> 
> pinl
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
        underpn
   1: 0.5431472
   2: 0.5255102
   3: 0.4795918
   4: 0.5860349
   5: 0.3636364
  ---          
2924: 0.4455696
2925: 0.4974490
2926: 0.6322115
2927: 0.4368687
2928: 0.4139651
> bfl
       matchId overodd underodd     overp    underp   totalp    overpn
   1: 02oVDuv1    2.10     1.80 0.4761905 0.5555556 1.031746 0.4615385
   2: 04zko0D5    1.57     2.55 0.6369427 0.3921569 1.029100 0.6189320
   3: 069WnDBn    2.25     1.70 0.4444444 0.5882353 1.032680 0.4303797
   4: 06H610QA    1.80     2.10 0.5555556 0.4761905 1.031746 0.5384615
   5: 08lLzk5P    2.20     1.70 0.4545455 0.5882353 1.042781 0.4358974
  ---                                                                 
1321: zXDmLx4H    2.75     1.50 0.3636364 0.6666667 1.030303 0.3529412
1322: zXmHZnXA    2.60     1.55 0.3846154 0.6451613 1.029777 0.3734940
1323: zXweIXVE    2.60     1.50 0.3846154 0.6666667 1.051282 0.3658537
1324: zylytbNg    1.70     2.25 0.5882353 0.4444444 1.032680 0.5696203
1325: zZ6f59Ue    1.67     2.30 0.5988024 0.4347826 1.033585 0.5793451
        underpn
   1: 0.5384615
   2: 0.3810680
   3: 0.5696203
   4: 0.4615385
   5: 0.5641026
  ---          
1321: 0.6470588
1322: 0.6265060
1323: 0.6341463
1324: 0.4303797
1325: 0.4206549
> bfxl
       matchId overodd underodd     overp    underp   totalp    overpn
   1: 04PCiQzK    1.87     2.01 0.5347594 0.4975124 1.032272 0.5180412
   2: 04zko0D5    1.54     2.44 0.6493506 0.4098361 1.059187 0.6130653
   3: 061xSktd    1.65     2.39 0.6060606 0.4184100 1.024471 0.5915842
   4: 069WnDBn    2.22     1.72 0.4504505 0.5813953 1.031846 0.4365482
   5: 06AqtiDs    1.69     2.29 0.5917160 0.4366812 1.028397 0.5753769
  ---                                                                 
2406: zXmHZnXA    2.54     1.58 0.3937008 0.6329114 1.026612 0.3834951
2407: zXtioUye    1.95     1.93 0.5128205 0.5181347 1.030955 0.4974227
2408: zXweIXVE    2.67     1.53 0.3745318 0.6535948 1.028127 0.3642857
2409: zy3x0uCs    1.61     2.44 0.6211180 0.4098361 1.030954 0.6024691
2410: zZ6f59Ue    1.67     2.33 0.5988024 0.4291845 1.027987 0.5825000
        underpn
   1: 0.4819588
   2: 0.3869347
   3: 0.4084158
   4: 0.5634518
   5: 0.4246231
  ---          
2406: 0.6165049
2407: 0.5025773
2408: 0.6357143
2409: 0.3975309
2410: 0.4175000
> 
> 
> saveRDS(pinl,"Pinnacleou.rds")
> saveRDS(b3l,"Bet365ou.rds")
> saveRDS(bfl,"Betfairou.rds")
> saveRDS(bfxl,"Betfairoxu.rds")
> 
> q()

