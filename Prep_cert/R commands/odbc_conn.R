# telecherger le package RODBC
install.packages('RODBC')
library(RODBC)
# conn <- odbcConnect('training2', uid='user', pwd='password')

housing_data <- sqlQuery(conn, 'select serialno, state, persons, rooms
                         from housing
                         where hinc > 1000000')
head(housing_data)