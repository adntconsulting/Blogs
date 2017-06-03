###################################################################
#  Author: Ed Ekpoudom
#  Last Updated: 2 June 2017
#
##################################################################



#Code for simulation study and associated graph

samples.A <- unlist(lapply(1:1000, function(i) {
  sample.means <- mean(rnorm(50,0,1))
}))


samples.B <- unlist(lapply(1:1000, function(i) {
  sample.means <- mean(rnorm(100,0,1))
}))

samples.C <- unlist(lapply(1:1000, function(i) {
  sample.means <- mean(rnorm(200,0,1))
}))

samples.D <- unlist(lapply(1:1000, function(i) {
  sample.means <- mean(rnorm(200,0,3))
}))



df <- data.frame(samples.A,samples.B,samples.C,samples.D)

stacked_df <- stack(df)

ggplot(stacked_df, aes(x=values)) + geom_density(aes(group=ind, colour=ind, fill=ind), alpha=0.6) + ggtitle("Sampling Distributions")

#Example of an orthogonal matrix
A = matrix(c(0.33,0.67,0.67,0.67,-0.67,0.33,-0.67,-0.33,0.67),nrow=3,ncol=3)
A


A2 = A %*%t(A)
A2
A3 = round(A2)
A3

#Calculate the condition number
cond_num = norm(A,"2")*norm(solve(A),"2")
cond_num
