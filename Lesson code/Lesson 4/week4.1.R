##### Week 4
##### R objects and data structures
##### Single-Mode Data Structures: Augmented Vectors


### Attributes
## Get/set individual attribute values with attr() or see them all with attributes()
x <- 1:10
attr(x, "greeting")


# attr(x, which) <- value
attr(x, "greeting") <- "Hi!"
attr(x, "greeting")

attr(x, "farewell") <- "Bye!"
attributes(x)


typeof(attributes(x))
str(attributes(x))



### Factors ---
# factor() & as.factor()
yes.or.no <- c("yes", "no", "no", "yes", "yes")
first.factor <- factor(yes.or.no)
first.factor

second.factor <- as.factor(yes.or.no)
second.factor

third.factor <- factor(yes.or.no, levels = c("yes", "no"))
third.factor
nlevels(third.factor)


levels(second.factor)
levels(third.factor)


# as.character(): factor --> character
fourth.factor <- as.character(third.factor)
fourth.factor

# as.numeric(): factor --> numeric
fifth.factor <- as.numeric(third.factor)
fifth.factor

(as.numeric(first.factor))

temperature <- factor(c(28, 32, 30, 34, 32, 34))
temperature
str(temperature)

as.character(temperature)
as.numeric(temperature)

as.numeric(as.character(temperature))


# Factors are implemented internally using integers, and have a levels attribute:
x <- factor(c("ab", "cd", "ab"), levels = c("ab", "cd", "ef"))
typeof(x)
attributes(x)
str(x)

x.integer <- unclass(x)
x.integer

class(x.integer)
attr(x.integer,"levels")


# ordered factor
symptoms0 <- factor(c("SEVERE", "MILD", "MODERATE"),
                    levels = c("MILD", "MODERATE", "SEVERE"))
symptoms0


symptoms <- factor(c("SEVERE", "MILD", "MODERATE"),
                   levels = c("MILD", "MODERATE", "SEVERE"),
                   ordered = TRUE)
symptoms


# check for symptoms greater than moderate
symptoms0 > "MODERATE"
symptoms  > "MODERATE"


# create a vector by removing the class
class(symptoms)
symptoms.integer <- unclass(symptoms)
symptoms.integer
class(symptoms.integer)

class(symptoms.integer) <- "factor"
symptoms.integer

class(symptoms.integer) <- c("ordered", "factor")
symptoms.integer