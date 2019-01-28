source('C:/Users/Hubert/Desktop/A_paper/rozklady/Library/createdataset.R')
source('C:/Users/Hubert/Desktop/A_paper/rozklady/Library/dkstest.R')

#Simulations v1
#KS of sum variables depends on correlations between variables
set.seed(92872792)
iteracje=99
size=1000
w1=1
w2=1
#output 
statystyki<-matrix(nrow=iteracje,ncol=6)

#input dataset
f1<- par(mfrow = c(1, 3),pty = "s")


for(i in 1:iteracje) {

  setlevel1<-(-1+2/(iteracje+1)*i)
  createdataset(size,level1=setlevel1,level2=2,w1,w2)
  statystyki[i,1]<-cor(x1,x2)
  #statystyki[i,1]<-setlevel1
  statystyki[i,2]<-dKS.test(size,x1,zz1)$statistic
  statystyki[i,3]<-dKS.test(size,x2,zz1)$statistic
  statystyki[i,4]<-dKS.test(size,(w1*x1+w2*x2),zz1)$statistic
  statystyki[i,5]<-var(suma)^0.5
  statystyki[i,6]<-mean(suma)
  if (i==1 ) {
    c1<-cor(x1,x2)
    c2<-cor(x1+x2,z1)
    c3<-cor(x1,z1)
    c4<-cor(x2,z1)

    hist(x1+x2,xlab=c('size=',size,'corelation (x1,x2)=',c1),ylab='X1+X2')
    hist(x1,xlab=c('size=',size,'corelation (x1,x2)=',c1),ylab='X1')
    hist(x2,xlab=c('size=',size,'corelation (x1,x2)=',c1),ylab='X2')
  
  }
  
}


#plot(statystyki[,1],statystyki[,4],col='red',xlab='Corelation (X1,x2)',ylab='KS X1+X2',xlim=c(-1,1), ylim=c(0,1))
#plot(statystyki[,1],statystyki[,2],col='green',xlab='Corelation (X1,x2)',ylab='KS X1',xlim=c(-1,1), ylim=c(0,1))
#plot(statystyki[,1],statystyki[,3],col='blue',xlab='Corelation (X1,x2)',ylab='KS X2',xlim=c(-1,1), ylim=c(0,1))

f2 <- par(mfrow = c(1, 1),pty = "s")

plot(statystyki[,1],statystyki[,4],col='red',xlab='Corelation (x1,x2)',ylab='KS X1+X2',xlim=c(-1,1), ylim=c(0,1))
title(main='How does KS of x1+x2 depend on correlation (x1,x2)')
title(sub='Black line KS of x2 / Green line KS of x1')
lines(statystyki[,1],statystyki[,2],col='green')
lines(statystyki[,1],statystyki[,3],col='black')

