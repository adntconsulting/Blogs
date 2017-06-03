###################################################################
#  Author: Ed Ekpoudom
#  Last Updated: 18 January 2017
#
##################################################################
library(R6)

R_Regression <- R6Class("R_Regression",
                  public = list(
                    endog = NULL,
                    exog = NULL,
                    betahat = NULL,
                    initialize = function(endog = NA, exog = NA) {
                      self$endog <- endog
                      self$exog <- exog
                      self$fit()
                      self$print_output()
                    },
                    fit = function() {
                      Q.R <- qr(self$exog)   
                      Q <- qr.Q(Q.R) 
                      R <- qr.R(Q.R) 
                      Qy <- crossprod(Q, self$endog)
                      self$betahat <- solve(R, Qy)
                    },
                    print_output = function() {
                      cat("Coefficients:\n\n")
                      names <- rownames(self$betahat)
                      for(i in seq(1:nrow(self$betahat))){
                        cat(paste0(names[i],'\t= ', 
                                   round(self$betahat[i], 
                                          digits = 4),'\n'))
                      }
                    }
                    
                  )
)

load(Boston)
data <- Boston
Intcpt <- rep(1,nrow(data)) 
exog <- data[,1:13]
exog <- as.matrix(cbind(Intcpt,exog))
endog <- as.matrix(data[,14])
lm <- R_Regression$new(endog, exog)
