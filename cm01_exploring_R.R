2+2
number <- 3
number
number*2
number <- 5
number*2

times <- c(17, 30, 25, 35, 25, 30, 40, 20)
times

mean(times)

time_hours <- times/60
time_hours

range(times)
sqrt(times)

times > 30
times == 17

which(times > 30)
all(times > 30)
any(times > 30)

help(any)
?any
?mean

times[times > 30]
times[3]
times[-3]
times[3:5]
3:5
# second and fourth values
times[c(2 ,4)]
#everything but second and fourth values
times[-c(2, 4)]
times[times > 30]

times
# change first value from 17 to 47
times[1] <- 47

# replace all values > 30 with missing value na
times[times > 30] <- NA
times

times <- c(17, 30, 25, 35, 25, 30, 40, 20)
times[1] <- 47
times
# vector of length 2 (0, 1)
times[times > 30] <- c(0, 1)
times

times <- c(17, 30, 25, 35, 25, 30, 40, 20)
times[1] <- 47
times[times > 30] <- NA
times

mean(times)
# calculate mean of times but remove missing values
mean(times, na.rm = TRUE)

# mean of values between 20 and 35
times > 20
times < 35
times > 20 & times < 35
times[times > 20 & times < 35]
mean(times[times > 20 & times < 35], na.rm = TRUE)

# values between 20 OR 35
times[times > 20 | times < 35]

mean(times)
# name arguments
mean(x = times)

# after naming one argument, you must name all following arguments
# we named the trim argument, so we must also name the na.rm argument
mean(times, trim = .2, na.rm = TRUE)

# built-in dataframe mtcars
mtcars
?mtcars
head(mtcars)
str(mtcars)
names(mtcars)
as.character(1:10)
