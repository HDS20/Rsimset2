# Rsimset2
Function: dKS.test 
enhancement of KS.test that allows to check discriminant power of variable 
version 1.0 created 2019.01.08
function that apply KS statistics to variable splitted into 2 categories (event 1: bvar=0 and event 2: bvar=1)
example:
x1<-rnorm(1000)
binary1<-ifelse(rnorm(1000)>0.5,1,0)
dKS.test(1000,x1,binary1)


