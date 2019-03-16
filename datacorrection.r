> require(data.table)
> matches<-readRDS("matches.rds")
> sort(unique(matches$home))
 [1] "arsenal"           "aston villa"       "birmingham"       
 [4] "blackburn"         "blackpool"         "bolton"           
 [7] "bournemouth"       "brighton"          "burnley"          
[10] "cardiff"           "chelsea"           "crystal palace"   
[13] "crystal-palace"    "everton"           "fulham"           
[16] "huddersfield"      "hull city"         "leicester"        
[19] "liverpool"         "manchester city"   "manchester-city"  
[22] "manchester united" "manchester-united" "manchester-utd"   
[25] "middlesbrough"     "newcastle"         "newcastle utd"    
[28] "norwich"           "qpr"               "reading"          
[31] "southampton"       "stoke"             "stoke city"       
[34] "sunderland"        "swansea"           "tottenham"        
[37] "watford"           "west brom"         "west ham"         
[40] "west-ham"          "wigan"             "wolves"  
> wronghomes<-c("crystal-palace","manchester-city","manchester-united","manchester-utd","newcastle utd","stoke city","west-ham")
> truehomes<-c("crystal palace","manchester city","manchester united","manchester united","newcastle","stoke","west ham")
> for (i in 1:7)
+ matches$home[wronghomes[i]]<-truehomes[i]
> sort(unique(matches$home))
 [1] "arsenal"           "aston villa"       "birmingham"       
 [4] "blackburn"         "blackpool"         "bolton"           
 [7] "bournemouth"       "brighton"          "burnley"          
[10] "cardiff"           "chelsea"           "crystal palace"   
[13] "everton"           "fulham"            "huddersfield"     
[16] "hull city"         "leicester"         "liverpool"        
[19] "manchester city"   "manchester united" "middlesbrough"    
[22] "newcastle"         "norwich"           "qpr"              
[25] "reading"           "southampton"       "stoke"            
[28] "sunderland"        "swansea"           "tottenham"        
[31] "watford"           "west brom"         "west ham"         
[34] "wigan"             "wolves"           
> sort(unique(matches$away))
 [1] "arsenal"           "aston villa"       "birmingham"       
 [4] "blackburn"         "blackpool"         "bolton"           
 [7] "bournemouth"       "brighton"          "burnley"          
[10] "cardiff"           "chelsea"           "crystal palace"   
[13] "crystal-palace"    "everton"           "fulham"           
[16] "huddersfield"      "hull city"         "leicester"        
[19] "liverpool"         "manchester city"   "manchester-city"  
[22] "manchester united" "manchester-united" "manchester-utd"   
[25] "middlesbrough"     "newcastle"         "newcastle utd"    
[28] "norwich"           "qpr"               "reading"          
[31] "southampton"       "stoke"             "stoke city"       
[34] "sunderland"        "swansea"           "tottenham"        
[37] "watford"           "west brom"         "west ham"         
[40] "west-ham"          "wigan"             "wolves"

> wrongaways<-c("crystal-palace","manchester-city","manchester-united","manchester-utd","newcastle utd","stoke city","west-ham")
> trueaways<-c("crystal palace", "manchester city","manchester united", "manchester united","newcastle","stoke","west ham")
> for (i in 1:7)
+ matches[away==wrongaways[i]]$away<-trueaways[i]

> sort(unique(matches$away))
 [1] "arsenal"           "aston villa"       "birmingham"       
 [4] "blackburn"         "blackpool"         "bolton"           
 [7] "bournemouth"       "brighton"          "burnley"          
[10] "cardiff"           "chelsea"           "crystal palace"   
[13] "everton"           "fulham"            "huddersfield"     
[16] "hull city"         "leicester"         "liverpool"        
[19] "manchester city"   "manchester united" "middlesbrough"    
[22] "newcastle"         "norwich"           "qpr"              
[25] "reading"           "southampton"       "stoke"            
[28] "sunderland"        "swansea"           "tottenham"        
[31] "watford"           "west brom"         "west ham"         
[34] "wigan"             "wolves"       

> sort(unique(matches$away))==sort(unique(matches$home))
 [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[16] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[31] TRUE TRUE TRUE TRUE TRUE

> saveRDS(matches,file="matches.rds")


