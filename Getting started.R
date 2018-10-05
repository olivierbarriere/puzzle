devtools::install_github("syneoshealth/puzzle")
library(puzzle)
pk = puzzle::df_pk
dose = puzzle::df_dose
cov = puzzle::df_cov
extra_times = puzzle::df_extra_times

setwd("C:/Users/mario/Desktop/test")
readr::write_csv(pk,"pk.csv")
readr::write_csv(dose,"dose.csv")
readr::write_csv(cov,"cov.csv")
readr::write_csv(extra_times,"extra_times.csv")


#Example using .csv
puzzle(directory=file.path(getwd()),
       order=c(0,1),
       parallel = F,
       pk=list(name="pk.csv"), dose=list(name="dose.csv"), cov=list(name="cov.csv"), extratimes=list(name="extra_times.csv"),
       nm=list(name="nonmem_01s.csv"),
       optionalcolumns="TIMEPOINT")


#Example using an R object
nm = list()
pk = as.data.frame(puzzle::df_pk)
nm$pk=list(parent=pk)
head(puzzle(directory=file.path(getwd()),
       order=c(0,1),
       parallel = T,
       pk=list(data=nm$pk), dose=list(data=df_dose), cov=list(data=df_cov),
       optionalcolumns="TIMEPOINT"))

#Example of multiple analytes
nm = list()
pk1 = as.data.frame(puzzle::df_pk)
pk2 = as.data.frame(puzzle::df_pk)
nm$pk=list(parent=pk1,metabolite=pk2)
head(puzzle(directory=file.path(getwd()),
            order=c(0,1),
            parallel = T,
            pk=list(data=nm$pk), dose=list(data=dose), cov=list(data=cov),
            optionalcolumns="TIMEPOINT"))


#Example of error with parallel = F
head(puzzle(directory=file.path(getwd()),
       order=c(1,1),
       parallel = F,
       pk=list(data=nm$pk), dose=list(data=dose), cov=list(data=cov), 
       optionalcolumns="TIMEPOINT"))
#Error in puzzle(directory = file.path(getwd()), order = c(1, 1), parallel = F,  : 
#Would you like to use a sequential zero + first order absorption model? If yes, please set order=c(0,1). Otherwise, please set parallel = T

#If yes
head(puzzle(directory=file.path(getwd()),
            order=c(0,1),
            parallel = F,
            pk=list(data=nm$pk), dose=list(data=dose), cov=list(data=cov), 
            optionalcolumns="TIMEPOINT"))

#If no
head(puzzle(directory=file.path(getwd()),
            order=c(1,1),
            parallel = T,
            pk=list(data=nm$pk), dose=list(data=dose), cov=list(data=cov), 
            optionalcolumns="TIMEPOINT"))
