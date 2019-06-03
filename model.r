> model<-lm(goals~homehomeavg+homehomevar+homeawayavg+
+ homeawayvar+awayhomeavg+awayhomevar+awayawayavg+awayawayvar+z0.5
+ +z1.5+z2.5+z3.5+z4.5+z5.5,matches[191:3000])
> model

Call:
lm(formula = goals ~ homehomeavg + homehomevar + homeawayavg + 
    homeawayvar + awayhomeavg + awayhomevar + awayawayavg + awayawayvar + 
    z0.5 + z1.5 + z2.5 + z3.5 + z4.5 + z5.5, data = matches[191:3000])

Coefficients:
(Intercept)  homehomeavg  homehomevar  homeawayavg  homeawayvar  awayhomeavg  
    9.15472      0.53238     -0.01790     -0.65434      0.10031     -0.57307  
awayhomevar  awayawayavg  awayawayvar         z0.5         z1.5         z2.5  
    0.10127      0.72982      0.05483     -0.42473      1.75912    -12.11269  
       z3.5         z4.5         z5.5  
   10.34095      2.26845     -0.34515  

> summary(model)

Call:
lm(formula = goals ~ homehomeavg + homehomevar + homeawayavg + 
    homeawayvar + awayhomeavg + awayhomevar + awayawayavg + awayawayvar + 
    z0.5 + z1.5 + z2.5 + z3.5 + z4.5 + z5.5, data = matches[191:3000])

Residuals:
    Min      1Q  Median      3Q     Max 
-3.4301 -1.1842 -0.1131  1.0893  7.0389 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)   
(Intercept)   9.15472    3.53411   2.590  0.00964 **
homehomeavg   0.53238    0.23926   2.225  0.02615 * 
homehomevar  -0.01790    0.15430  -0.116  0.90765   
homeawayavg  -0.65434    0.32161  -2.035  0.04199 * 
homeawayvar   0.10031    0.20194   0.497  0.61943   
awayhomeavg  -0.57307    0.23779  -2.410  0.01602 * 
awayhomevar   0.10127    0.15602   0.649  0.51632   
awayawayavg   0.72982    0.32045   2.277  0.02284 * 
awayawayvar   0.05483    0.20126   0.272  0.78532   
z0.5         -0.42473    1.60251  -0.265  0.79100   
z1.5          1.75912    4.03976   0.435  0.66327   
z2.5        -12.11269    4.62857  -2.617  0.00892 **
z3.5         10.34095    4.43415   2.332  0.01977 * 
z4.5          2.26845    3.06652   0.740  0.45951   
z5.5         -0.34515    1.22696  -0.281  0.77849   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.653 on 2777 degrees of freedom
  (18 observations deleted due to missingness)
Multiple R-squared:  0.04691,	Adjusted R-squared:  0.04211 
F-statistic: 9.763 on 14 and 2777 DF,  p-value: < 2.2e-16

> alter<-lm(goals~homehomeavg+awayawayavg+z0.5+z1.5+z2.5+z3.5+z4.5+z5.5,matches[191:3000])
> summary(alter)

Call:
lm(formula = goals ~ homehomeavg + awayawayavg + z0.5 + z1.5 + 
    z2.5 + z3.5 + z4.5 + z5.5, data = matches[191:3000])

Residuals:
   Min     1Q Median     3Q    Max 
-3.399 -1.216 -0.121  1.084  6.985 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)   
(Intercept)   9.29171    3.52837   2.633  0.00850 **
homehomeavg   0.13236    0.10017   1.321  0.18650   
awayawayavg   0.30145    0.09459   3.187  0.00145 **
z0.5         -0.61238    1.60290  -0.382  0.70246   
z1.5          1.58561    4.04253   0.392  0.69492   
z2.5        -12.01171    4.61904  -2.600  0.00936 **
z3.5         10.56615    4.43033   2.385  0.01715 * 
z4.5          2.02705    3.05792   0.663  0.50746   
z5.5         -0.26243    1.22673  -0.214  0.83062   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.656 on 2783 degrees of freedom
  (18 observations deleted due to missingness)
Multiple R-squared:  0.04206,	Adjusted R-squared:  0.03931 
F-statistic: 15.27 on 8 and 2783 DF,  p-value: < 2.2e-16

> plot(alter)
Sonraki çizimi görmek için <Enter>'a basın: 
Error in plot.new() : attempt to plot on null device
Ek olarak: Warning messages:
1: In (function (display = "", width, height, pointsize, gamma, bg,  :
  yerel Xlib tarafından desteklenmiyor: bazı X işlemleri C yerelinde çalışacak
2: In (function (display = "", width, height, pointsize, gamma, bg,  :
  X yerelleştirme düzelticilerini belirleyemez
> gm<-lm(goals~homehomeavg+awayawayavg,matches)
Warning messages:
1: In (function (display = "", width, height, pointsize, gamma, bg,  :
  yerel Xlib tarafından desteklenmiyor: bazı X işlemleri C yerelinde çalışacak
2: In (function (display = "", width, height, pointsize, gamma, bg,  :
  X yerelleştirme düzelticilerini belirleyemez
> gm<-lm(goals~homehomeavg+awayawayavg,matches)
> summary(gm)

Call:
lm(formula = goals ~ homehomeavg + awayawayavg, data = matches)

Residuals:
    Min      1Q  Median      3Q     Max 
-3.4230 -1.2205 -0.0699  1.1170  7.2015 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.43671    0.15511   9.263  < 2e-16 ***
homehomeavg  0.52089    0.07135   7.301 3.56e-13 ***
awayawayavg  0.41899    0.08335   5.027 5.26e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.657 on 3307 degrees of freedom
Multiple R-squared:  0.02217,	Adjusted R-squared:  0.02158 
F-statistic:  37.5 on 2 and 3307 DF,  p-value: < 2.2e-16

> 

