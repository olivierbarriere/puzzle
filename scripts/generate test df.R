#loading libraries
library(tidyverse)

#-----------------Create data files for examples
# df_pk
df_pk = Theoph
names(df_pk) = c("ID","WT","DOSE","TIME","DV")
df_pk = df_pk %>% select(ID,TIME,DV) %>% as.tibble()
df_pk$TIMEPOINT = round(df_pk$TIME,1)
df_pk = df_pk %>% select(ID,TIMEPOINT,everything())
save(df_pk, file = "E:/mgs/github/puzzle/data/df_pk.RData")
#-------------------------------------------------------

# df_dose
df_dose = Theoph
names(df_dose) = c("ID","WT","AMT","TIME","DV")
df_dose = df_dose %>% 
  select(ID,TIME,AMT) %>% 
  as.tibble() %>%
  filter(TIME==0)
save(df_dose, file = "E:/mgs/github/puzzle/data/df_dose.RData")
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
save(df_cov, file = "E:/mgs/github/puzzle/data/df_cov.RData")
#-------------------------------------------------------

# df_extra_times
df_extra_times = tibble(TIME = seq(from=1,to=26,by=0.1))
save(df_extra_times, file = "E:/mgs/github/puzzle/data/df_extra_times.RData")
#-------------------------------------------------------

# df_pk_start
df_pk_start = readr::read_csv("E:/mgs/github/inVentR2/inVentR2/inAssembling/1. Basic/pk.csv")
save(df_pk_start, file = "E:/mgs/github/puzzle/data/df_pk_start.RData")
#-------------------------------------------------------

# df_pd_start
df_pd_start = readr::read_csv("E:/mgs/github/inVentR2/inVentR2/inAssembling/1. Basic/pd.csv")
save(df_pd_start, file = "E:/mgs/github/puzzle/data/df_pd_start.RData")
#-------------------------------------------------------

# df_cov_start
df_cov_start = readr::read_csv("E:/mgs/github/inVentR2/inVentR2/inAssembling/1. Basic/cov.csv")
save(df_cov_start, file = "E:/mgs/github/puzzle/data/df_cov_start.RData")
#-------------------------------------------------------

# df_dose_start
df_dose_start = readr::read_csv("E:/mgs/github/inVentR2/inVentR2/inAssembling/1. Basic/dose.csv")
save(df_dose_start, file = "E:/mgs/github/puzzle/data/df_dose_start.RData")
#-------------------------------------------------------

# df_pk_parent
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/2. Multiple analytes and effects/pk2.xlsx"
df_pk_parent = readxl::read_excel(directory, sheet = 1) %>% as.data.frame()
save(df_pk_parent, file = "E:/mgs/github/puzzle/data/df_pk_parent.RData")
#-------------------------------------------------------

# df_pk_metabolite
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/2. Multiple analytes and effects/pk2.xlsx"
df_pk_metabolite = readxl::read_excel(directory, sheet = 2) %>% as.data.frame()
save(df_pk_metabolite, file = "E:/mgs/github/puzzle/data/df_pk_metabolite.RData")
#-------------------------------------------------------

# df_response1
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/2. Multiple analytes and effects/pd3.xlsx"
df_response1 = readxl::read_excel(directory, sheet = 1) %>% as.data.frame()
save(df_response1, file = "E:/mgs/github/puzzle/data/df_response1.RData")
#-------------------------------------------------------

# df_response2
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/2. Multiple analytes and effects/pd3.xlsx"
df_response2 = readxl::read_excel(directory, sheet = 1) %>% as.data.frame()
save(df_response2, file = "E:/mgs/github/puzzle/data/df_response2.RData")
#-------------------------------------------------------

# df_response3
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/2. Multiple analytes and effects/pd3.xlsx"
df_response3 = readxl::read_excel(directory, sheet = 1) %>% as.data.frame()
save(df_response3, file = "E:/mgs/github/puzzle/data/df_response3.RData")
#-------------------------------------------------------

# df_pk_optional_columns
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/3. Optional columns/pk_OptionalColumns.csv"
df_pk_optional_columns = readr::read_csv(directory) %>% as.data.frame()
save(df_pk_optional_columns, file = "E:/mgs/github/puzzle/data/df_pk_optional_columns.RData")
#-------------------------------------------------------

# df_dose_optional_columns
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/3. Optional columns/dose_OptionalColumns.csv"
df_dose_optional_columns = readr::read_csv(directory) %>% as.data.frame()
save(df_dose_optional_columns, file = "E:/mgs/github/puzzle/data/df_dose_optional_columns.RData")
#-------------------------------------------------------

# df_parent_evid4
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/4. EVID4/pk.xlsx"
df_parent_evid4 = readxl::read_excel(directory, sheet = 1) %>% as.data.frame()
save(df_parent_evid4, file = "E:/mgs/github/puzzle/data/df_parent_evid4.RData")
#-------------------------------------------------------

# df_metabolite_evid4
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/4. EVID4/pk.xlsx"
df_metabolite_evid4 = readxl::read_excel(directory, sheet = 2) %>% as.data.frame()
save(df_metabolite_evid4, file = "E:/mgs/github/puzzle/data/df_metabolite_evid4.RData")
#-------------------------------------------------------

# df_extra_times_parent_evid4
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/4. EVID4/addltimes.xlsx"
df_extra_times_parent_evid4 = readxl::read_excel(directory, sheet = 1) %>% as.data.frame()
save(df_extra_times_parent_evid4, file = "E:/mgs/github/puzzle/data/df_extra_times_parent_evid4.RData")
#-------------------------------------------------------

# df_extra_times_metabolite_evid4
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/4. EVID4/addltimes.xlsx"
df_extra_times_metabolite_evid4 = readxl::read_excel(directory, sheet = 2) %>% as.data.frame()
save(df_extra_times_metabolite_evid4, file = "E:/mgs/github/puzzle/data/df_extra_times_metabolite_evid4.RData")
#-------------------------------------------------------

# df_dose_evid4
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/4. EVID4/dose.csv"
df_dose_evid4 = readr::read_csv(directory) %>% as.data.frame()
df_dose_evid4$TRT = ifelse(df_dose_evid4$TRT=="Anagrelide","Test","Reference")
save(df_dose_evid4, file = "E:/mgs/github/puzzle/data/df_dose_evid4.RData")
#-------------------------------------------------------

# df_cov_evid4
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/4. EVID4/cov.csv"
df_cov_evid4 = readr::read_csv(directory) %>% as.data.frame()
save(df_cov_evid4, file = "E:/mgs/github/puzzle/data/df_cov_evid4.RData")
#-------------------------------------------------------

# df_dose_datetime
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/5. extratimes mixte/doses_datetime.csv"
df_dose_datetime = readr::read_csv(directory) %>% as.data.frame() %>% select(-STUDYID)
df_dose_datetime$TRT  = "Syneos Health CPT 900 mg" 
df_dose_datetime$TREATMENT  = "Syneos Health" 
save(df_dose_datetime, file = "E:/mgs/github/puzzle/data/df_dose_datetime.RData")
#-------------------------------------------------------

# df_extra_times_datetime
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/5. extratimes mixte/extratimes_datetime.csv"
df_extra_times_datetime = readr::read_csv(directory) %>% as.data.frame()
save(df_extra_times_datetime, file = "E:/mgs/github/puzzle/data/df_extra_times_datetime.RData")
#-------------------------------------------------------

# df_extra_times_time
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/5. extratimes mixte/extratimes_time.csv"
df_extra_times_time = readr::read_csv(directory) %>% as.data.frame()
save(df_extra_times_time, file = "E:/mgs/github/puzzle/data/df_extra_times_time.RData")
#-------------------------------------------------------

# df_pk_datetime
directory = "E:/mgs/github/inVentR2/inVentR2/inAssembling/5. extratimes mixte/pk_datetime.csv"
df_pk_datetime = readr::read_csv(directory) %>% as.data.frame() %>% select(-STUDYID)
save(df_pk_datetime, file = "E:/mgs/github/puzzle/data/df_pk_datetime.RData")
#-------------------------------------------------------
