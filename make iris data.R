require(tidyverse)

n_rows <- nrow(iris)

max_length <- 10

parts <- n_rows / max_length

starts <- seq(from = 1, to = n_rows, by = max_length)
ends <- starts + (max_length - 1)

iris_shuffle <- iris[sample(c(1:nrow(iris))), ]

map2(starts, ends, 
     ~write_csv(x = iris_shuffle[.x:.y,], 
                file = glue::glue("data/iris-rows-{.x}-{.y}.csv")))
