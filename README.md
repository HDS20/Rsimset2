# Rsimset2
function: dKS.test 
enhancement of KS.test that allows to check discriminant power of variable 
version 1.0 created 2019.01.08
function that apply KS statistics to variable splitted into 2 categories (event 1: bvar=0 and event 2: bvar=1)
example:
x1<-rnorm(1000)
binary1<-ifelse(rnorm(1000)>0.5,1,0)
dKS.test(1000,x1,binary1)

function: Createdataset(size,level1,level2,w1,w2) 
Function that create random dataset consists of 4 vectors: x1(1xsize),x2(1xsize),z1(1xsize),zz1(1xsize)
zz1- binary variable dependent on x1 and x2
version 1.1 created 2019.01.08
example: Createdataset(100,0.5,1,1,1)

