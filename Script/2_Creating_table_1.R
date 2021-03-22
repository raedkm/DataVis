## Link to article
# https://cran.r-project.org/web/packages/tableone/vignettes/introduction.html


## tableone package itself
library(tableone)
## survival package for Mayo Clinic's PBC data
library(survival)
data(pbc)

CreateTableOne(data = pbc)

dput(names(pbc))

myVars <- c("time", "status", "trt", "age", "sex", "ascites", "hepato",
            "spiders", "edema", "bili", "chol", "albumin", "copper", "alk.phos",
            "ast", "trig", "platelet", "protime", "stage")

catVars <- c("status", "trt", "ascites", "hepato",
             "spiders", "edema", "stage")


tab2 <- CreateTableOne(vars = myVars, data = pbc, factorVars = catVars)

print(tab2, showAllLevels = TRUE, formatOptions = list(big.mark = ","))

#Summarizing the variables and examining missing valus also checking the normality
summary(tab2)


#Summarizing nonnormal variables (i.e. summarizing them using median instead of mean)
biomarkers <- c("bili","chol","copper","alk.phos","ast","trig","protime")
print(tab2, nonnormal = biomarkers, formatOptions = list(big.mark = ","))



# Summarizing by groups 
tab3 <- CreateTableOne(vars = myVars, strata = "trt" , data = pbc, factorVars = catVars)
print(tab3, nonnormal = biomarkers, formatOptions = list(big.mark = ","))



# Testing the variables
# The hypothesis test functions used by default are chisq.test() for categorical variables 
# (with continuity correction) and oneway.test() for continous variables 
# (with equal variance assumption, i.e., regular ANOVA). 
# Two-group ANOVA is equivalent of t-test.

print(tab3, nonnormal = biomarkers, exact = "stage", smd = TRUE)





# exporting to word
tab3Mat <- print(tab3, nonnormal = biomarkers, exact = "stage", quote = FALSE, noSpaces = TRUE, printToggle = FALSE)
write.csv(tab3Mat, file = "Output/myTable.csv")


