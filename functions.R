#function to calculate RI value from n-alkane gcms data
#this function needs a table of n-alkane #, ki value, and associated GCMS rt values
#see alkane_rt.rds for example

library(tidyverse)
sample_rt <- 10.000

ri_calculation <- function(sample_rt, alkane_rt) {
  
}


samp_pos <- alkane_rt %>% 
  add_row(instrument_rt = sample_rt) %>% 
  arrange(instrument_rt) 

samp_pos <- which(is.na(samp_pos$ki))

ri_value <- 100((samp_pos-1)+((sample_rt - alkane_rt[samp_pos-1, 3])))
