# function that create random dataset consists of 4 variables
# version 1.3 created 2019.01.28
# x1 - 1'st variable
# x2 - 2'st variable correlated with x1 at level1
# z1  - (0,1) propobility of dependent event
# zz1 - binary dependent variable with occurrences of event 1 eq. 50%
require(stats)

createdataset<-function(size,level1,level2,w1,w2,ocr=NULL){

  set.seed(456321, kind = NULL, normal.kind = NULL)
  ERR=0
  if ((size)<1) {ERR=1}
  if (abs(level1)>1) {ERR=2}
  if (ERR>0) {message("Error:", ERR, "\n")}
  
  
  # Case A corr(x_1,x_2 )=0  
  #level1<-0
  
  
  # Case B corr(x_1,x_2 )=70%  
  #level1<-0.5
  
  #level2 - noise level/unexpleind variance 
  
  # 1’st variable
  x1<<-rnorm(size)
  # 2’nd variable
  x2<<-sign(level1)*(level1^2)*x1+(1-(level1^2))*rnorm(size)
  
  #noise 
  noise<<-rnorm(size)
  
  
  #additional condition for simulation
  
  w1<-w1/(w1+w2+level2)
  w2<-w2/(w1+w2+level2)
  level2<-level2/(w1+w2+level2)
  
  suma<<-w1*x1+w2*x2+level2*noise
  
  #dependent variable (Probability)
  z1<<-1/(1+exp((suma)))
  
  #binary dependent variable with 50% occurrences of 1
  zz1<<-ifelse(z1 > median(z1),1,0)
  #binary dependent variable with ocr occurrences of 1
  #zz1<-ifelse(z1 < quantile(z1,ocr),1,0)
  
}

#example 
#createdataset(size=10000,level1=0,level2=1,w1=1,w2=1)
#createdataset(size=50,level1=0.5,level2=1,w1=1,w2=1)
