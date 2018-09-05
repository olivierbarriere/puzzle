#loading libraries
library(tidyverse)

#-----------------Create data files for examples
# df_pk
df_pk = Theoph
names(df_pk) = c("ID","WT","DOSE","TIME","DV")
df_pk = df_pk %>% select(ID,TIME,DV) %>% as.tibble()
df_pk$TIMEPOINT = round(df_pk$TIME,1)
df_pk = df_pk %>% select(ID,TIMEPOINT,everything())
save(df_pk, file = "E:/mgs/github/andir/df_pk.RData")
#-------------------------------------------------------

# df_dose
df_dose = Theoph
names(df_dose) = c("ID","WT","AMT","TIME","DV")
df_dose = df_dose %>% 
  select(ID,TIME,AMT) %>% 
  as.tibble() %>%
  filter(TIME==0)
save(df_dose, file = "E:/mgs/github/andir/df_dose.RData")
#-------------------------------------------------------

# df_cov
df_cov = Theoph
names(df_cov) = c("ID","VALUE","DOSE","TIME","DV")
df_cov = df_cov %>% 
  select(ID,TIME,VALUE) %>% 
  as.tibble() %>%
  filter(TIME==0) %>% 
  mutate(VARIABLE="WGT") %>% 
  select(ID,TIME,VARIABLE,VALUE)
save(df_cov, file = "E:/mgs/github/andir/df_cov.RData")
#-------------------------------------------------------

# df_extra_times
df_extra_times = tibble(TIME = seq(from=1,to=26,by=0.1))
save(df_extra_times, file = "E:/mgs/github/andir/df_extra_times.RData")

