> require(data.table)
> odds<-readRDS("odds.rds")
> ou<-odds[betType=="ou"]
> sort(unique(ou$totalhandicap))
 [1] "0.5"   "0.75"  "1"     "10"    "10.5"  "11"    "11.5"  "12"    "120.5"
[10] "1.25"  "125.5" "129.5" "13"    "134.5" "135.5" "140.5" "145.5" "148.5"
[19] "15"    "1.5"   "16"    "1.75"  "2"     "2.25"  "2.29"  "2.5"   "2.75" 
[28] "3"     "30.5"  "3.25"  "3.5"   "3.75"  "4"     "4.25"  "4.5"   "4.75" 
[37] "5"     "50.5"  "5.25"  "5.5"   "5.75"  "6"     "6.25"  "6.5"   "6.75" 
[46] "7"     "7.25"  "7.5"   "7.75"  "8"     "8.5"   "9"    
#There are SO MANY over under bet numbers that most of them
#probably don't exist for all matches
#so we should find the numbers that exist for all matches.
#Let us now find frequencies of them
> handicaps<-sort(unique(ou$totalhandicap))
> freq<-rep(0,52)
> for(i in 1:52)
+ freq[i]<-sum(ou$totalhandicap==handicaps[i])
> handicaps<-data.table(number=handicaps,freq=freq)
> handicaps
    number   freq
 1:    0.5 220946
 2:   0.75   1326
 3:      1   8257
 4:     10     19
 5:   10.5      4
 6:     11     24
 7:   11.5      2
 8:     12     10
 9:  120.5      2
10:   1.25   2979
11:  125.5      4
12:  129.5      2
13:     13      6
14:  134.5      4
15:  135.5      2
16:  140.5      2
17:  145.5      2
18:  148.5      2
19:     15      4
20:    1.5 320204
21:     16      2
22:   1.75  20180
23:      2  70172
24:   2.25  94773
25:   2.29      2
26:    2.5 613669
27:   2.75 115181
28:      3 109707
29:   30.5      2
30:   3.25  52754
31:    3.5 401366
32:   3.75  14328
33:      4  14464
34:   4.25   4428
35:    4.5 300228
36:   4.75   1560
37:      5   7637
38:   50.5      4
39:   5.25    518
40:    5.5 215822
41:   5.75    160
42:      6    602
43:   6.25    121
44:    6.5  65180
45:   6.75     86
46:      7     10
47:   7.25      6
48:    7.5  11878
49:   7.75      6
50:      8      8
51:    8.5   1524
52:      9     16
    number   freq
#Discrepancy is obvious, there are probably also some typos.
> handicaps<-handicaps[freq>1000]
> handicaps
    number   freq
 1:    0.5 220946
 2:   0.75   1326
 3:      1   8257
 4:   1.25   2979
 5:    1.5 320204
 6:   1.75  20180
 7:      2  70172
 8:   2.25  94773
 9:    2.5 613669
10:   2.75 115181
11:      3 109707
12:   3.25  52754
13:    3.5 401366
14:   3.75  14328
15:      4  14464
16:   4.25   4428
17:    4.5 300228
18:   4.75   1560
19:      5   7637
20:    5.5 215822
21:    6.5  65180
22:    7.5  11878
23:    8.5   1524
    number   freq
#even these numbers may not all be suitable
#what we conclude is that we should use
#1:5+0.5 numbers
>q()

