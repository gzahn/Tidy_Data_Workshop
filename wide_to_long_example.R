library(tidyr)
library(readxl)

df = read_xlsx("wide_data_example.xlsx")
long = gather(df, key=Treatment, value=Result, -SampleID)

write.csv(long, file = "converted_to_long.csv")

