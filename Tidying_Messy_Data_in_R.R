library(dplyr)
library(tidyr)
library(ggplot2)

# Read in our data from the csv file and save as an object called "stocks"
stocks = read.csv("./Stock_Prices_Wide.csv")

# Look at the stock price data
stocks

# This is in "wide" format...the column headers X, Y, and Z actually represent variables (Stock names)
# The function gather() in the tidyr package let's us convert them into a new column

# Look up help file for the gather() funtion
?gather()

# gather function(name of data set object, name for new column, name for observed values, which columns have our data)
gather(stocks, stock, price, -day) # -day means to use ALL columns EXCEPT "day"
long_stocks = gather(stocks, stock, price, -day) # Save this as a new object

# Now, it's easy to plot and analyze with simple code
ggplot(long_stocks, aes(x=day,y=price,color=stock, group = stock)) +
  geom_point() + geom_line() +
  theme(axis.text.x = element_text(angle = 75, hjust = 1))


# Now, let's take a look at the 2010 Utah Census Data on Religious Adherence
utah <- read.csv("Utah_Religions_by_County.csv") 

# The values represent percentages of respondents who selected that religious affiliation
View(utah)

# Believe it or not, I spent about an hour cleaning this messy data up to this point
# Even data collection agencies often use terrible data formats!

# We can use gather() to make this a bit more useful
# see if you can fill in the blanks
gather(utah, ??? , ??? , ??? )                     %>% 
                                                   ggplot(aes(x=religion,y=proportion)) +
                                                   geom_boxplot(fill="DarkGreen") + theme_bw() + 
                                                   theme(axis.text.x = element_text(angle = 90, hjust = 1)) 





