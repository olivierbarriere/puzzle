devtools::install_github("ModelingGreatSolutions/andir")

library("andir")
df_pk = andir::df_pk
df_dose = andir::df_dose
df_pk = readr::write_csv(df_pk,"pk.csv")
df_dose = readr::write_csv(df_dose,"dose.csv")
and(directory=file.path(getwd()),
    order=c(0,1),
    pk=list(name="pk.csv"), 
    dose=list(name="dose.csv"), 
    nm=list(name="nonmem.csv"),
    simultaneous = T)
