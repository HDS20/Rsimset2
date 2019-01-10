# function that create random dataset consists of 4 variables
# version 1.2 created 2019.01.08
# x1 - 1'st variable
# x2 - 2'st variable correlated with x1 at level1
# z1  - (0,1) propobility of dependent event
# zz1 - binary dependent variable with occurences of event 1 eq. 50%

createdataset<-function(size,level1,level2,w1,w2){

  
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
  noise<-rnorm(size)
  
  w<-array(3)
  w[1]<-w1
  w[2]<-w2
  
  #dependent variable (Probability)
  z1<<-1/(1+exp((w[1]*x1+w[2]*x2+level2*noise)))
  
  #binary dependent variable with 50% occurences of 1
  zz1<<-ifelse(z1 > median(z1),1,0)
  
}

#example 
#createdataset(size=10000,level1=0,level2=1,w1=1,w2=1)
#createdataset(size=50,level1=0.5,level2=1,w1=1,w2=1)
