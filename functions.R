#function to calculate RI value from n-alkane gcms data
#this function needs a table of n-alkane #, ki value, and associated GCMS rt values
#see alkane_rt.rds for example

library(tidyverse)


ri_calculation <- function(sample_rt, alkane_rt) {
  sort_table <- alkane_rt %>% 
    add_row(instrument_rt = sample_rt) %>% 
    arrange(instrument_rt) %>%
    pull(which(is.na(ki)))
  
  samp_pos <- pull(which(is.na(sort_table$ki)))
  
  n <- alkane_rt[samp_pos-1, 1]
  tn <- alkane_rt[samp_pos-1, 3]
  tN <- alkane_rt[samp_pos, 3]
  
  ri_value <- 100*(n+((sample_rt - tn)/(tN - tn))) 
  
  ri_value <- round(ri_value)
 
  return(ri_value) 
}

ri_calculation(9.34, alkane_rt)

sample_rt = 9.34

