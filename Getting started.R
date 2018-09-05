devtools::install_github("syneoshealth/puzzle",force=T)
library(puzzle)
getwd()
df_pk = puzzle::df_pk
df_dose = puzzle::df_dose
df_cov = puzzle::df_cov
df_extra_times = puzzle::df_extra_times
readr::write_csv(df_pk,"pk.csv")
readr::write_csv(df_dose,"dose.csv")
readr::write_csv(df_cov,"cov.csv")
readr::write_csv(df_extra_times,"extra_times.csv")


puzzle(directory=file.path(getwd()),
       order=c(0,1),
       parallel = T,
       pk=list(name="pk.csv"), dose=list(name="dose.csv"), cov=list(name="cov.csv"), extratimes=list(name="extra_times.csv"),
       nm=list(name="nonmem.csv"),
       optionalcolumns="TIMEPOINT")


puzzle(directory=file.path(getwd()),
       order=1,
       pk=list(data="df_pk"), dose=list(data="df_dose"), cov=list(data="df_cov"), extratimes=list(data="df_extra_times"),
       nm=list(data="nonmem.csv"),
       optionalcolumns="TIMEPOINT")


puzzle(directory=file.path(getwd()),
       order=1,
       pk=list(data="df_pk"), dose=list(data="df_dose"), cov=list(data="df_cov"), extratimes=list(data="df_extra_times"),
       nm=list(data="nonmem.csv"),
       optionalcolumns="TIMEPOINT")

head(puzzle(directory=file.path(getwd()),
       order=c(0,1),
       parallel = T,
       pk=list(data=nm$pk), dose=list(data=df_dose), cov=list(data=df_cov),
       #nm=list(name="nonmem.csv"),
       optionalcolumns="TIMEPOINT"))




#Example of multiple analytes
nm = list()
pk1 = as.data.frame(puzzle::df_pk)
pk2 = as.data.frame(puzzle::df_pk)

nm$pk=list(parent=pk1,metabolite=pk2)

head(puzzle(directory=file.path(getwd()),
            order=c(0,1),
            parallel = T,
            pk=list(data=nm$pk), dose=list(data=df_dose), cov=list(data=df_cov),
            optionalcolumns="TIMEPOINT"))


#Example of extratimes
nm = list()
pk1 = as.data.frame(puzzle::df_pk)
pk2 = as.data.frame(puzzle::df_pk)
extratimes = as.data.frame(puzzle::df_extra_times)

nm$pk=list(parent=pk1,metabolite=pk2)
nm$extratimes=list(extratimes=extratimes)


puzzle(directory=file.path(getwd()),
            order=c(0,1),
            parallel = F,
            pk=list(data=nm$pk), dose=list(data=df_dose), cov=list(data=df_cov), extratimes = list(name="extratimes.csv"),
            optionalcolumns="TIMEPOINT")



head(puzzle(directory=file.path(getwd()),
       order=c(0,1),
       parallel = F,
       pk=list(data=nm$pk), dose=list(data=df_dose), cov=list(data=df_cov), 
       optionalcolumns="TIMEPOINT"))
