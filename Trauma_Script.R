
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################

n <- 269 ## sample size

rm <- matrix(c( ## correlations reported by Zhou (2026)
  
  1.000, 0.394, 0.381, 0.297,
  0.394, 1.000, 0.489, 0.411,
  0.381, 0.489, 1.000, 0.534,
  0.297, 0.411, 0.534, 1.000), nrow=4)

colnames(rm) <- rownames(rm) <- c("CT","SP","AN","AL") ## names of variables

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ -1*CT+start(-0.5)*SP+start(-0.5)*AN+start(-0.5)*AL

## Intercepts, set to zero

CT ~ 0*1
SP ~ 0*1
AN ~ 0*1
AL ~ 0*1

CSE ~ 0*1

## (Error) variances

CT ~~ CT
SP ~~ SP
AN ~~ AN
AL ~~ AL

CSE ~~ CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, sample.mean=rep(0,4))

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results


########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################


