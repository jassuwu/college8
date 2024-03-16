install.packages("readxl")
library(readxl)
cc_default <- read_excel("R_wd/cc_default.xlsx", 
                         col_types = c("numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "text", "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "text"))
View(cc_default)

install.packages("e1071")
library(e1071)
install.packages("dplyr")
library(dplyr)
install.packages("smotefamily")
library(smotefamily)
install.packages("class")
library(class)
install.packages("fitdistrplus")
library(fitdistrplus)

# Define the data
pred.svm <- cbind(cc_default[2:9], cc_default[11:22])
target.svm <- cc_default[23]

# Calculate imbalance ratio
one.size <- length(which(target.svm == 1))
zero.size <- length(which(target.svm == 0))
ratio <- one.size/zero.size

# Define the set of classification
one.set <- which(target.svm == 1)
zero.set <- which(target.svm == 0)

# Create synthetic data
ADAS.cc <- ADAS(pred.svm, target.svm, K = 181)
ANS.cc <- ANS(pred.svm, target.svm, dupSize = 0)
BLSMOTE.cc <- BLSMOTE(pred.svm, target.svm, K = 181, C = 181, dupSize = 0,
                      method = c("type1", "type2"))
DBSMOTE.cc <- DBSMOTE(pred.svm, target.svm, dupSize = 0, MinPts = NULL, 
                      eps = NULL)
RSLS.cc <- RSLS(pred.svm, target.svm, K = 181, C = 181, dupSize = 0)
SLS.cc <- SLS(pred.svm, target.svm, K = 181, C = 181, dupSize = 0)
SMOTE.cc <- SMOTE(pred.svm, target.svm, K = 181, dup_size = 0)

# Support Vector Machine
start.ORI <- Sys.time()
ccdefault.svm <- svm(pred.svm, target.svm, scale = FALSE, 
                     type = "C-classification", kernel = "sigmoid", 
                     gamma = 1/21, coef0 = 0, cost = 1, class.weights = NULL, 
                     cachesize = 512, tolerance = 0.001, epsilon = 0.1, 
                     shrinking = TRUE, cross = 10, probability = TRUE, 
                     fitted = TRUE, na.action = na.omit)
stop.ORI <- Sys.time()
stop.ORI - start.ORI

start.ADAS <- Sys.time()
pred.ADAS <- ADAS.cc[["data"]][1:20]
target.ADAS <- (ADAS.cc[["data"]][21])
cc.ADAS.svm <- svm(pred.ADAS, target.ADAS, scale = FALSE, 
                   type = "C-classification", kernel = "sigmoid", 
                   gamma = 1/21, coef0 = 0, cost = 1, class.weights = NULL, 
                   cachesize = 512, tolerance = 0.001, epsilon = 0.1, 
                   shrinking = TRUE, cross = 10, probability = TRUE, 
                   fitted = TRUE, na.action = na.omit)
stop.ADAS <- Sys.time()
time.ADAS <- stop.ADAS - start.ADAS

start.ANS <- Sys.time()
pred.ANS <- ANS.cc[["data"]][1:20]
target.ANS <- ANS.cc[["data"]][21]
cc.ANS.svm <- svm(pred.ANS, target.ANS, scale = FALSE, 
                  type = "C-classification", kernel = "sigmoid", gamma = 1/21, 
                  coef0 = 0, cost = 1, class.weights = NULL, cachesize = 512, 
                  tolerance = 0.001, epsilon = 0.1, shrinking = TRUE, 
                  cross = 10, probability = TRUE, fitted = TRUE, 
                  na.action = na.omit)
stop.ANS <- Sys.time()
stop.ANS - start.ANS

start.BLS <- Sys.time()
pred.BLS <- BLSMOTE.cc[["data"]][1:20]
target.BLS <- BLSMOTE.cc[["data"]][21]
cc.BLS.svm <- svm(pred.BLS, target.BLS, scale = FALSE, 
                  type = "C-classification", kernel = "sigmoid", gamma = 1/21, 
                  coef0 = 0, cost = 1, class.weights = NULL, cachesize = 512, 
                  tolerance = 0.001, epsilon = 0.1, shrinking = TRUE, 
                  cross = 10, probability = TRUE, fitted = TRUE, 
                  na.action = na.omit)
stop.BLS <- Sys.time()
stop.BLS - start.BLS

start.DBS <- Sys.time()
pred.DBS <- DBSMOTE.cc[["data"]][1:20]
target.DBS <- DBSMOTE.cc[["data"]][21]
cc.DBS.svm <- svm(pred.DBS, target.DBS, scale = FALSE, 
                  type = "C-classification", kernel = "sigmoid", gamma = 1/21, 
                  coef0 = 0, cost = 1, class.weights = NULL, cachesize = 512, 
                  tolerance = 0.001, epsilon = 0.1, shrinking = TRUE, 
                  cross = 10, probability = TRUE, fitted = TRUE, 
                  na.action = na.omit)
stop.DBS <- Sys.time()
stop.DBS - start.DBS

start.RSLS <- Sys.time()
pred.RSLS <- RSLS.cc[["data"]][1:20]
target.RSLS <- RSLS.cc[["data"]][21]
cc.RSLS.svm <- svm(pred.RSLS, target.RSLS, scale = FALSE, 
                   type = "C-classification", kernel = "sigmoid", gamma = 1/21, 
                   coef0 = 0, cost = 1, class.weights = NULL, cachesize = 512, 
                   tolerance = 0.001, epsilon = 0.1, shrinking = TRUE, 
                   cross = 10, probability = TRUE, fitted = TRUE, 
                   na.action = na.omit)
stop.RSLS <- Sys.time()
stop.RSLS - start.RSLS

start.SLS <- Sys.time()
pred.SLS <- SLS.cc[["data"]][1:20]
target.SLS <- SLS.cc[["data"]][21]
cc.SLS.svm <- svm(pred.SLS, SLS.cc[["data"]][21], scale = FALSE, 
                  type = "C-classification", kernel = "sigmoid", gamma = 1/21, 
                  coef0 = 0, cost = 1, class.weights = NULL, cachesize = 512, 
                  tolerance = 0.001, epsilon = 0.1, shrinking = TRUE, 
                  cross = 10, probability = TRUE, fitted = TRUE, 
                  na.action = na.omit)
stop.SLS <- Sys.time()
stop.SLS - start.SLS

start.SMOTE <- Sys.time()
pred.SMOTE <- SMOTE.cc[["data"]][1:20]
target.SMOTE <- SMOTE.cc[["data"]][21]
cc.SMOTE.svm <- svm(pred.SMOTE, target.SMOTE, scale = FALSE, 
                    type = "C-classification", kernel = "sigmoid", 
                    gamma = 1/21, coef0 = 0, cost = 1, class.weights = NULL, 
                    cachesize = 512, tolerance = 0.001, epsilon = 0.1, 
                    shrinking = TRUE, cross = 10, probability = TRUE, 
                    fitted = TRUE, na.action = na.omit)
stop.SMOTE <- Sys.time()
stop.SMOTE - start.SMOTE

# K-Nearest Neighbor
data.knn <- cbind(cc_default[2:9], cc_default[11:23])
ccdefault.knn <- knn.cv(as.matrix(data.knn[1:20]), 
                        factor(c(rep("1", 1564), rep("0", 16143))), k = 133, 
                        prob = FALSE, use.all = TRUE)
accy.ccdefault.knn <- 
  length(which(ccdefault.knn == factor(c(rep("1", 1564), rep("0", 16143)))))/
  nrow(as.data.frame(ccdefault.knn))

cc.ADAS.knn <- knn.cv(as.matrix(pred.ADAS), factor(c(rep("1", 16143), 
                      rep("0", 16143))), k = 181, prob = FALSE, use.all = TRUE)
accy.ADAS.knn <- 
  length(which(cc.ADAS.knn == factor(c(rep("1", 16143), rep("0", 16143)))))/
  nrow(as.data.frame(cc.ADAS.knn))

cc.ANS.knn <- knn.cv(as.matrix(pred.ANS), 
                     factor(c(rep("1", 15414), rep("0", 16143))), k = 181, 
                     prob = FALSE, use.all = TRUE)
accy.ANS.knn <- 
  length(which(cc.ANS.knn == factor(c(rep("1", 15414), rep("0", 16143)))))/
  nrow(as.data.frame(cc.ANS.knn))

cc.BLS.knn <- knn.cv(as.matrix(pred.BLS), 
                     factor(c(rep("1", 15640), rep("0", 16143))), k = 181, 
                     prob = FALSE, use.all = TRUE)
accy.BLS.knn <- 
  length(which(cc.BLS.knn == factor(c(rep("1", 15640), rep("0", 16143)))))/
  nrow(as.data.frame(cc.BLS.knn))

cc.DBS.knn <- knn.cv(as.matrix(pred.DBS), 
                     factor(c(rep("1", 15116), rep("0", 16143))), k = 181, 
                     prob = FALSE, use.all = TRUE)
accy.DBS.knn <- 
  length(which(cc.DBS.knn == factor(c(rep("1", 15116), rep("0", 16143)))))/
  nrow(as.data.frame(cc.DBS.knn))

cc.RSLS.knn <- knn.cv(as.matrix(pred.RSLS), 
                      factor(c(rep("1", 15640), rep("0", 16143))), k = 181, 
                      prob = FALSE, use.all = TRUE)
accy.RSLS.knn <- 
  length(which(cc.RSLS.knn == factor(c(rep("1", 15640), rep("0", 16143)))))/
  nrow(as.data.frame(cc.RSLS.knn))

cc.SLS.knn <- knn.cv(as.matrix(pred.SLS), 
                     factor(c(rep("1", 15640), rep("0", 16143))), k = 181, 
                     prob = FALSE, use.all = TRUE)
accy.SLS.knn <- 
  length(which(cc.SLS.knn == factor(c(rep("1", 15640), rep("0", 16143)))))/
  nrow(as.data.frame(cc.SLS.knn))

cc.SMOTE.knn <- knn.cv(as.matrix(pred.SMOTE), 
                       factor(c(rep("1", 15640), rep("0", 16143))), k = 181, 
                       prob = FALSE, use.all = TRUE)
accy.SMOTE.knn <- 
  length(which(cc.SMOTE.knn == factor(c(rep("1", 15640), rep("0", 16143)))))/
  nrow(as.data.frame(cc.SMOTE.knn))

# Copula-based synthetic sampling
# Return the empirical CDF
pred.minority <- pred.svm[one.set,]
ncardF <- ecdf(pred.minority$ncard)
outstF <- ecdf(pred.minority$outst)
limitF <- ecdf(pred.minority$limit)
balanceF <- ecdf(pred.minority$balance)
tusageF <- ecdf(pred.minority$tusage)
tcashF <- ecdf(pred.minority$tcash)
tretailF <- ecdf(pred.minority$tretail)
unpaidF <- ecdf(pred.minority$unpaid)
payratF <- ecdf(pred.minority$payrat)
percolF <- ecdf(pred.minority$percol)
util3F <- ecdf(pred.minority$util3)
usage3F <- ecdf(pred.minority$usage3)
payrat3F <- ecdf(pred.minority$payrat3)
util6F <- ecdf(pred.minority$util6)
usage6F <- ecdf(pred.minority$usage6)
payrat6F <- ecdf(pred.minority$payrat6)
balpcardF <- ecdf(pred.minority$balpcard)
unpaidplmtF <- ecdf(pred.minority$unpaidplmt)
tuseplmtF <- ecdf(pred.minority$tuseplmt)
lengthF <- ecdf(pred.minority$length)

# Calculate Z
Z_ncard <- qnorm(ncardF(pred.minority$ncard), mean = 0, sd = 1, 
                 lower.tail = TRUE, log.p = FALSE)
Z_outst <- qnorm(outstF(pred.minority$outst), mean = 0, sd = 1, 
                 lower.tail = TRUE, log.p = FALSE)
Z_limit <- qnorm(limitF(pred.minority$limit), mean = 0, sd = 1, 
                 lower.tail = TRUE, log.p = FALSE)
Z_balance <- qnorm(balanceF(pred.minority$balance), mean = 0, sd = 1, 
                   lower.tail = TRUE, log.p = FALSE)
Z_tusage <- qnorm(tusageF(pred.minority$tusage), mean = 0, sd = 1, 
                  lower.tail = TRUE, log.p = FALSE)
Z_tcash <- qnorm(tcashF(pred.minority$tcash), mean = 0, sd = 1, 
                 lower.tail = TRUE, log.p = FALSE)
Z_tretail <- qnorm(tretailF(pred.minority$tretail), mean = 0, sd = 1, 
                   lower.tail = TRUE, log.p = FALSE)
Z_unpaid <- qnorm(unpaidF(pred.minority$unpaid), mean = 0, sd = 1, 
                  lower.tail = TRUE, log.p = FALSE)
Z_payrat <- qnorm(payratF(pred.minority$payrat), mean = 0, sd = 1, 
                  lower.tail = TRUE, log.p = FALSE)
Z_percol <- qnorm(percolF(pred.minority$percol), mean = 0, sd = 1, 
                  lower.tail = TRUE, log.p = FALSE)
Z_util3 <- qnorm(util3F(pred.minority$util3), mean = 0, sd = 1, 
                 lower.tail = TRUE, log.p = FALSE)
Z_usage3 <- qnorm(usage3F(pred.minority$usage3), mean = 0, sd = 1, 
                  lower.tail = TRUE, log.p = FALSE)
Z_payrat3 <- qnorm(payrat3F(pred.minority$payrat3), mean = 0, sd = 1, 
                   lower.tail = TRUE, log.p = FALSE)
Z_util6 <- qnorm(util6F(pred.minority$util6), mean = 0, sd = 1, 
                 lower.tail = TRUE, log.p = FALSE)
Z_usage6 <- qnorm(usage6F(pred.minority$usage6), mean = 0, sd = 1, 
                  lower.tail = TRUE, log.p = FALSE)
Z_payrat6 <- qnorm(payrat6F(pred.minority$payrat6), mean = 0, sd = 1, 
                   lower.tail = TRUE, log.p = FALSE)
Z_balpcard <- qnorm(balpcardF(pred.minority$balpcard), mean = 0, sd = 1, 
                    lower.tail = TRUE, log.p = FALSE)
Z_unpaidplmt <- qnorm(unpaidplmtF(pred.minority$unpaidplmt), mean = 0, sd = 1, 
                      lower.tail = TRUE, log.p = FALSE)
Z_tuseplmt <- qnorm(tuseplmtF(pred.minority$tuseplmt), mean = 0, sd = 1, 
                    lower.tail = TRUE, log.p = FALSE)
Z_length <- qnorm(lengthF(pred.minority$length), mean = 0, sd = 1, 
                  lower.tail = TRUE, log.p = FALSE)
Z_cc <- cbind(Z_ncard, Z_outst, Z_limit, Z_balance, Z_tusage, Z_tcash, 
              Z_tretail, Z_unpaid, Z_payrat, Z_percol, Z_util3, Z_usage3, 
              Z_payrat3, Z_util6, Z_usage6, Z_payrat6, Z_balpcard, Z_unpaidplmt,
              Z_tuseplmt, Z_length)

# Replace Inf with 5
install.packages("tidyverse")
library(tidyverse)
Z_cc[Z_cc == Inf] <- 5
Z_cc[Z_cc == -Inf] <- -5

# Calculating mean vector and covariance matrix
Z_ccMean <- matrix(0, nrow = 1, ncol = ncol(Z_cc))
Z_ccCov <- matrix(0, nrow = ncol(Z_cc), ncol = ncol(Z_cc))
for (i in 1:ncol(Z_cc)) {
  Z_ccMean[1,i] <- mean(Z_cc[i])
}
Z_ccCov <-cov(Z_cc, y = NULL, use = "pairwise.complete.obs")

# Generating random variables
install.packages("MASS")
library(MASS)
Z_cc.gen <- mvrnorm(n = zero.size-one.size, Z_ccMean, Z_ccCov, tol = 1e-6, 
                    empirical = FALSE)
P_cc <- matrix(0, nrow = zero.size-one.size, ncol = ncol(Z_cc))
for (i in 1:(zero.size-one.size)) {
  for (j in 1:ncol(Z_cc)) {
    P_cc[i,j] <- pnorm(Z_cc.gen[i,j], mean = 0, sd = 1, lower.tail = TRUE, 
                       log.p = FALSE)
  }
}

# Quantile function for empirical distribution
my_quantile <- function(x, prob) {
  if (is.unsorted(x)) x <- sort(x)
  n <- length(x)
  approx(seq(0, 1, length = n), x, prob)$y
}

# Create new matrix of predictors
pred.one <- pred.svm[one.set,]
pred_ccGen <- matrix(0, nrow = zero.size-one.size, ncol = ncol(Z_cc))
for (i in 1:(zero.size-one.size)) {
  for (j in 1:ncol(Z_cc)) {
    pred_ccGen[i,j] <- my_quantile(as.matrix(pred.one[j]), P_cc[i,j])
  }
}
pred_ccGen <- as.data.frame(pred_ccGen)
names(pred_ccGen) <- c(names(pred.svm))
pred_ccNew <- rbind(pred_ccGen, pred.svm)

# Create new matrix of target variable
target_ccGen <- as.data.frame(matrix(1,nrow = zero.size-one.size, ncol = 1))
names(target_ccGen) <- names(target.svm)
target_ccNew <- rbind(target_ccGen, target.svm)

# Run SVM with synthetic data
ccNew.svm <- svm(pred_ccNew, target_ccNew, scale = FALSE, 
                 type = "C-classification", kernel = "sigmoid", gamma = 1/21, 
                 coef0 = 0, cost = 1, class.weights = NULL, cachesize = 512, 
                 tolerance = 0.001, epsilon = 0.1, shrinking = TRUE, cross = 10, 
                 probability = TRUE, fitted = TRUE, na.action = na.omit)

# Run KNN with synthetic data
ccNew <- cbind(pred_ccNew, target_ccNew)
ccNew.knn <- knn.cv(as.matrix(ccNew[1:20]), 
                    factor(c(rep("1", 16143), rep("0", 16143))), k = 179, 
                    prob = FALSE, use.all = FALSE)
accyNew.knn <- 
  length(which(ccNew.knn == factor(c(rep("1", 16143), rep("0", 16143)))))/
  nrow(as.data.frame(ccNew.knn))

# Fitting to metalog distribution
install.packages("rmetalog")
library(rmetalog)
outst.mtg <- metalog(pred.minority$outst, bounds = c(0, 800000000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
limit.mtg <- metalog(pred.minority$limit, bounds = c(2999999, 1000000001), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
balnc.mtg <- metalog(pred.minority$balance, bounds = c(0, 700000000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
tusag.mtg <- metalog(pred.minority$tusage, bounds = c(-16000000, 400000000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
tcash.mtg <- metalog(pred.minority$tcash, bounds = c(-0.1, 40000000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
tretl.mtg <- metalog(pred.minority$tretail, bounds = c(-16000000, 300000000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
upaid.mtg <- metalog(pred.minority$unpaid, bounds = c(-0.1, 450000000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
payrt.mtg <- metalog(pred.minority$payrat, bounds = c(-7001, 69000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
prcol.mtg <- metalog(pred.minority$percol, bounds = c(-0.1, 200), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
util3.mtg <- metalog(pred.minority$util3, bounds = c(-0.1, 9), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
usag3.mtg <- metalog(pred.minority$usage3, bounds = c(-.1, 3), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
payr3.mtg <- metalog(pred.minority$payrat3, bounds = c(-60000, 80000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
util6.mtg <- metalog(pred.minority$util6, bounds = c(-.1, 11), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
usag6.mtg <- metalog(pred.minority$usage6, bounds = c(-1, 9), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
payr6.mtg <- metalog(pred.minority$payrat6, bounds = c(-18000, 55000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
balpc.mtg <- metalog(pred.minority$balpcard, bounds = c(-1, 150000000), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
uplmt.mtg <- metalog(pred.minority$unpaidplmt, bounds = c(-1, 8), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
tulmt.mtg <- metalog(pred.minority$tuseplmt, bounds = c(-1, 5), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)
lngth.mtg <- metalog(pred.minority$length, bounds = c(0, 35), 
                     boundedness = "b", term_limit = 13, step_len = 0.01, 
                     probs = NA, fit_method = "any", save_data = FALSE)

# Calculate metalog probability
outst.Pmtg <- pmetalog(outst.mtg, pred.minority$outst, 13)
limit.Pmtg <- pmetalog(limit.mtg, pred.minority$limit, 13)
balnc.Pmtg <- pmetalog(balnc.mtg, pred.minority$balance, 13)
tusag.Pmtg <- pmetalog(tusag.mtg, pred.minority$tusage, 13)
tcash.Pmtg <- pmetalog(tcash.mtg, pred.minority$tcash, 3)
tretl.Pmtg <- pmetalog(tretl.mtg, pred.minority$tretail, 13)
upaid.Pmtg <- pmetalog(upaid.mtg, pred.minority$unpaid, 3)
payrt.Pmtg <- pmetalog(payrt.mtg, pred.minority$payrat, 13)
prcol.Pmtg <- pmetalog(prcol.mtg, pred.minority$percol, 3)
util3.Pmtg <- pmetalog(util3.mtg, pred.minority$util3, 13)
usag3.Pmtg <- pmetalog(usag3.mtg, pred.minority$usage3, 3)
payr3.Pmtg <- pmetalog(payr3.mtg, pred.minority$payrat3, 13)
util6.Pmtg <- pmetalog(util6.mtg, pred.minority$util6, 13)
usag6.Pmtg <- pmetalog(usag6.mtg, pred.minority$usage6, 13)
payr6.Pmtg <- pmetalog(payr6.mtg, pred.minority$payrat6, 13)
balpc.Pmtg <- pmetalog(balpc.mtg, pred.minority$balpcard, 3)
uplmt.Pmtg <- pmetalog(uplmt.mtg, pred.minority$unpaidplmt, 13)
tulmt.Pmtg <- pmetalog(tulmt.mtg, pred.minority$tuseplmt, 3)
lngth.Pmtg <- pmetalog(lngth.mtg, pred.minority$length, 13)

# Calculate Z
ncard.Zmtg <- Z_ncard
outst.Zmtg <- qnorm(outst.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
limit.Zmtg <- qnorm(limit.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
balnc.Zmtg <- qnorm(balnc.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
tusag.Zmtg <- qnorm(tusag.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
tcash.Zmtg <- qnorm(tcash.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
tretl.Zmtg <- qnorm(tretl.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
upaid.Zmtg <- qnorm(upaid.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
payrt.Zmtg <- qnorm(payrt.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
prcol.Zmtg <- qnorm(prcol.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
util3.Zmtg <- qnorm(util3.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
usag3.Zmtg <- qnorm(usag3.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
payr3.Zmtg <- qnorm(payr3.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
util6.Zmtg <- qnorm(util6.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
usag6.Zmtg <- qnorm(usag6.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
payr6.Zmtg <- qnorm(payr6.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
balpc.Zmtg <- qnorm(balpc.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
uplmt.Zmtg <- qnorm(uplmt.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
tulmt.Zmtg <- qnorm(tulmt.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)
lngth.Zmtg <- qnorm(lngth.Pmtg, mean = 0, sd = 1, lower.tail = TRUE)

Zmtg_cc <- cbind(Z_ncard, outst.Zmtg, limit.Zmtg, balnc.Zmtg, tusag.Zmtg, 
                 tcash.Zmtg, tretl.Zmtg, upaid.Zmtg, payrt.Zmtg, prcol.Zmtg,
                 util3.Zmtg, usag3.Zmtg, payr3.Zmtg, util6.Zmtg, usag6.Zmtg,
                 payr6.Zmtg, balpc.Zmtg, uplmt.Zmtg, tulmt.Zmtg, lngth.Zmtg)
Zmtg_cc[Zmtg_cc == Inf] <- 5
Zmtg_cc[Zmtg_cc == -Inf] <- -5

# Calculating mean vector and covariance matrix
Zmtg_ccMean <- matrix(0, nrow = 1, ncol = ncol(Zmtg_cc))
Zmtg_ccCov <- matrix(0, nrow = ncol(Zmtg_cc), ncol = ncol(Zmtg_cc))
for (i in 1:ncol(Zmtg_cc)) {
  Zmtg_ccMean[1,i] <- mean(Zmtg_cc[i])
}
Zmtg_ccCov <-cov(Zmtg_cc, y = NULL, use = "pairwise.complete.obs")

# Generating random variables
Zmtg_cc.gen <- mvrnorm(n = zero.size-one.size, Zmtg_ccMean, Zmtg_ccCov, 
                       tol = 1e-6, empirical = FALSE)
Pmtg_cc <- matrix(0, nrow = zero.size-one.size, ncol = ncol(Zmtg_cc))
for (i in 1:(zero.size-one.size)) {
  for (j in 1:ncol(Zmtg_cc)) {
    Pmtg_cc[i,j] <- pnorm(Zmtg_cc.gen[i,j], mean = 0, sd = 1, lower.tail = TRUE, 
                          log.p = FALSE)
  }
}

# Create new matrix of predictors
ncard_mtgGen <- my_quantile(as.matrix(pred.one$ncard), Pmtg_cc[,1])
outst_mtgGen <- qmetalog(outst.mtg, Pmtg_cc[, 2])
limit_mtgGen <- qmetalog(limit.mtg, Pmtg_cc[, 3])
balnc_mtgGen <- qmetalog(balnc.mtg, Pmtg_cc[, 4])
tusag_mtgGen <- qmetalog(tusag.mtg, Pmtg_cc[, 5])
tcash_mtgGen <- qmetalog(tcash.mtg, Pmtg_cc[, 6])
tretl_mtgGen <- qmetalog(tretl.mtg, Pmtg_cc[, 7])
upaid_mtgGen <- qmetalog(upaid.mtg, Pmtg_cc[, 8])
payrt_mtgGen <- qmetalog(payrt.mtg, Pmtg_cc[, 9])
prcol_mtgGen <- qmetalog(prcol.mtg, Pmtg_cc[, 10])
util3_mtgGen <- qmetalog(util3.mtg, Pmtg_cc[, 11])
usag3_mtgGen <- qmetalog(usag3.mtg, Pmtg_cc[, 12])
payr3_mtgGen <- qmetalog(payr3.mtg, Pmtg_cc[, 13])
util6_mtgGen <- qmetalog(util3.mtg, Pmtg_cc[, 14])
usag6_mtgGen <- qmetalog(usag3.mtg, Pmtg_cc[, 15])
payr6_mtgGen <- qmetalog(payr3.mtg, Pmtg_cc[, 16])
balpc_mtgGen <- qmetalog(balpc.mtg, Pmtg_cc[, 17])
uplmt_mtgGen <- qmetalog(uplmt.mtg, Pmtg_cc[, 18])
tulmt_mtgGen <- qmetalog(tulmt.mtg, Pmtg_cc[, 19])
lngth_mtgGen <- qmetalog(lngth.mtg, Pmtg_cc[, 20])

pred_mtgGen <- cbind(ncard_mtgGen, outst_mtgGen, limit_mtgGen, balnc_mtgGen,
                     tusag_mtgGen, tcash_mtgGen, tretl_mtgGen, upaid_mtgGen,
                     payrt_mtgGen, prcol_mtgGen, util3_mtgGen, usag3_mtgGen,
                     payr3_mtgGen, util6_mtgGen, usag6_mtgGen, payr6_mtgGen,
                     balpc_mtgGen, uplmt_mtgGen, tulmt_mtgGen, lngth_mtgGen)
pred_mtgGen <- as.data.frame(pred_mtgGen)
names(pred_mtgGen) <- c(names(pred.svm))
pred_mtgNew <- rbind(pred_mtgGen, pred.svm)

# Create new matrix of target variable
target_mtgGen <- as.data.frame(matrix(1,nrow = zero.size-one.size, ncol = 1))
names(target_mtgGen) <- names(target.svm)
target_mtgNew <- rbind(target_mtgGen, target.svm)

# Run SVM with synthetic data
ccmtg.svm <- svm(pred_mtgNew, target_mtgNew, scale = FALSE, 
                 type = "C-classification", kernel = "sigmoid", gamma = 1/21, 
                 coef0 = 0, cost = 1, class.weights = NULL, cachesize = 512, 
                 tolerance = 0.001, epsilon = 0.1, shrinking = TRUE, cross = 10, 
                 probability = TRUE, fitted = TRUE, na.action = na.omit)

# Run KNN with synthetic data
ccmtg <- cbind(pred_mtgNew, target_mtgNew)
ccmtg.knn <- knn.cv(as.matrix(ccmtg[1:20]), 
                    factor(c(rep("1", 16143), rep("0", 16143))), k = 179, 
                    prob = FALSE, use.all = FALSE)
accymtg.knn <- 
  length(which(ccmtg.knn == factor(c(rep("1", 16143), rep("0", 16143)))))/
  nrow(as.data.frame(ccmtg.knn))

# Logistic regression
formula <- paste("default ~ ", paste(names(cc_default[2:22]), collapse = " + "))
library(nnet)
defaultfact <- as.data.frame(as.factor(cc_default$default))
names(defaultfact) [names(defaultfact) == names(defaultfact[1])] <- "default"
data <- cbind(defaultfact, cc_default[2:22])
# Parameterizing the logistic regression model
ccdefault.lr <- glm(formula, family = "binomial", data, model = TRUE, x = FALSE, 
                    y = TRUE, singular.ok = TRUE)

accuracy <- cbind(accy.ADAS.knn, accy.ANS.knn, accy.BLS.knn, accy.ccdefault.knn, 
                  accy.DBS.knn, accy.RSLS.knn, accy.SLS.knn, accy.SMOTE.knn,
                  accymtg.knn, accyNew.knn)
write.csv(accuracy, "accuracy.csv")

write.csv(cbind(c(rep("1", 16143), rep("0", 16143)), 
                as.data.frame(cc.ADAS.knn)), "ADASknn.csv")
write.csv(cbind(c(rep("1", 15414), rep("0", 16143)), 
                as.data.frame(cc.ANS.knn)), "ANSknn.csv")
write.csv(cbind(c(rep("1", 15640), rep("0", 16143)), 
                as.data.frame(cc.BLS.knn)), "BLSknn.csv")
write.csv(cbind(c(rep("1", 15116), rep("0", 16143)), 
                as.data.frame(cc.DBS.knn)), "DBSknn.csv")
write.csv(cbind(c(rep("1", 15640), rep("0", 16143)), 
                as.data.frame(cc.RSLS.knn)), "RSLSknn.csv")
write.csv(cbind(c(rep("1", 15640), rep("0", 16143)), 
                as.data.frame(cc.SLS.knn)), "SLSknn.csv")
write.csv(cbind(c(rep("1", 15640), rep("0", 16143)), 
                as.data.frame(cc.SMOTE.knn)), "SMOTEknn.csv")
write.csv(cbind(c(rep("1", 16143), rep("0", 16143)), 
                as.data.frame(ccNew.knn)), "Newknn.csv")
write.csv(cbind(c(rep("1", 16143), rep("0", 16143)), 
                as.data.frame(ccmtg.knn)), "Mtgknn.csv")
write.csv(cbind(c(rep("1", 1564), rep("0", 16143)), 
                as.data.frame(ccdefault.knn)), "defknn.csv")

# Fitting to Pearson distribution system
descdist(pred.minority$outst) #Hasil: beta
fitbeta_ncard <- fitdist(pred.minority$ncard, "beta", method = "mme", gof = "KS")
