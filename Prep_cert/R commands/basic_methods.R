# import a CSV file of the total annual sales for each customer
setwd('c:/Rlabs/Prep_cert/')
sales <- read.csv('yearly_sales.csv', header = TRUE, sep = ';')
#is.integer(sales)
typeof(sales)
is.factor(sales$gender)
is.data.frame(sales)
class(sales$num_of_orders)
str(sales)
head(sales)
summary(sales)
# plot num_of_orders vs. sales
plot(sales$num_of_orders,sales$sales_total,main='Number of Orders vs. Sales')

# perform a statistical analysis (fit a linear regression model)
results <- lm(sales$sales_total~sales$num_of_orders)
summary(results)
# perform some diagnostics on the fitted model
# plot histogram of the residuals
hist(results$residuals, breaks = 800)

#sales_table <- read.table('yearly_sales.csv', header=TRUE, sep=';')
#sales_delim <- read.delim('yearly_sales.csv', sep=';')
#head(sales_table)
#head(sales_delim)

# add a column for the average sales per order
sales$per_order <- sales$sales_total/sales$num_of_orders
# export data as tab delimited without the row names
write.table(sales,'sales_modified.txt', sep='\t', row.names=FALSE)

#exemples of using lists 
housing <- list('own', 'rent')
v <- 1:5
c <- c('me', 'you', 'him')
M <- matrix(c(1,3,3,5,0,4,3,3,3),nrow = 3,ncol = 3)
assortiment <-list(housing, c, v, M)
assortiment
class(assortiment[3])
str(assortiment)

jpeg(file='sales_hist.jpeg') # create a new jpeg file
hist(sales$num_of_orders) # export histogram to jpeg
dev.off() # shut off the graphic device


#factors
install.packages('ggplot2')
library(ggplot2)
diamons <-data(diamonds) # load the data frame into the R workspace
str(diamonds)
# create a ordered factor attribute from numeric attributes
# categorize sales$sales_totals into three groups—small, medium and big
sales_group <- vector(mode = 'character', length = length(sales$sales_total))
sales_group[sales$sales_total < 100] <- 'small'
sales_group[sales$sales_total >= 100 & sales$sales_total < 500] <- 'medium'
sales_group[sales$sales_total > 500] <- 'big'
#sales$sales_group <- sales_group
# create and add the ordered factor to the sales data frame
spender <- factor(sales_group,levels=c('small', 'medium', 'big'), ordered = TRUE)
sales$sales_group <- spender
