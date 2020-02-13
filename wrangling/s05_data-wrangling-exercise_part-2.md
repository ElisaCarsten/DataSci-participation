---
title: 's05: Some More `dplyr` Exercise'
output: 
  html_document:
    keep_md: true
    theme: paper
---

<!---The following chunk allows errors when knitting--->



**When you make an Rmd file for participation or homework, be sure to do this**:

1. Change the file output to both html and md _documents_ (not notebook).
  - See the `keep_md: TRUE` argument above.

2. `knit` the document. 

3. Stage and commit the Rmd and knitted documents.


# Let's review some `dplyr` syntax

Load the `tidyverse` package.
    

```r
# load your packages here:
library(tidyverse)
```
    

## `select()`, `rename()`, `filter()`, `mutate()`, and a little plotting

Let's use the `mtcars` dataset. Complete the following tasks. Chain together
all of the commands in a task using the pipe `%>%`.

1. Show the miles per gallon and horsepower for cars with 6 cylinders. Also
   convert the data frame to a tibble (keep the rownames and store them in the
   tibble with a descriptive variable name). Store this result as a new object
   with a descriptive object name.


```r
ex1 <- mtcars %>% 
  rownames_to_column("Model") %>% 
  as_tibble() %>% 
  select(Model, cyl, mpg, hp) %>% 
  filter(cyl == 6)

ex1 <- mtcars %>% 
  as_tibble(rownames = "Model") %>% 
  select(Model, cyl, mpg, hp) %>% 
  filter(cyl == 6) %>% 
  print()
```

```
## # A tibble: 7 x 4
##   Model            cyl   mpg    hp
##   <chr>          <dbl> <dbl> <dbl>
## 1 Mazda RX4          6  21     110
## 2 Mazda RX4 Wag      6  21     110
## 3 Hornet 4 Drive     6  21.4   110
## 4 Valiant            6  18.1   105
## 5 Merc 280           6  19.2   123
## 6 Merc 280C          6  17.8   123
## 7 Ferrari Dino       6  19.7   175
```

```r
ex1
```

```
## # A tibble: 7 x 4
##   Model            cyl   mpg    hp
##   <chr>          <dbl> <dbl> <dbl>
## 1 Mazda RX4          6  21     110
## 2 Mazda RX4 Wag      6  21     110
## 3 Hornet 4 Drive     6  21.4   110
## 4 Valiant            6  18.1   105
## 5 Merc 280           6  19.2   123
## 6 Merc 280C          6  17.8   123
## 7 Ferrari Dino       6  19.7   175
```

2. Print the results from Task 1 in an appealing way by using `knitr::kable()`.


```r
knitr::kable(head(ex1))
```



Model             cyl    mpg    hp
---------------  ----  -----  ----
Mazda RX4           6   21.0   110
Mazda RX4 Wag       6   21.0   110
Hornet 4 Drive      6   21.4   110
Valiant             6   18.1   105
Merc 280            6   19.2   123
Merc 280C           6   17.8   123

Let's use the `iris` dataset. Complete the following tasks. Chain together
all of the commands in a task using the pipe `%>%`.

3. Rename the variables to be all lowercase and to separate words with "_"
   instead of ".". Put the species name variable first. Store this result as 
   a new object.


```r
ex2 <- iris %>% 
  rename(sepal_length = Sepal.Length, sepal_width = Sepal.Width, petal_length = Petal.Length, petal_width = Petal.Width, species = Species) %>% 
  select(species, everything())

ex2
```

```
##        species sepal_length sepal_width petal_length petal_width
## 1       setosa          5.1         3.5          1.4         0.2
## 2       setosa          4.9         3.0          1.4         0.2
## 3       setosa          4.7         3.2          1.3         0.2
## 4       setosa          4.6         3.1          1.5         0.2
## 5       setosa          5.0         3.6          1.4         0.2
## 6       setosa          5.4         3.9          1.7         0.4
## 7       setosa          4.6         3.4          1.4         0.3
## 8       setosa          5.0         3.4          1.5         0.2
## 9       setosa          4.4         2.9          1.4         0.2
## 10      setosa          4.9         3.1          1.5         0.1
## 11      setosa          5.4         3.7          1.5         0.2
## 12      setosa          4.8         3.4          1.6         0.2
## 13      setosa          4.8         3.0          1.4         0.1
## 14      setosa          4.3         3.0          1.1         0.1
## 15      setosa          5.8         4.0          1.2         0.2
## 16      setosa          5.7         4.4          1.5         0.4
## 17      setosa          5.4         3.9          1.3         0.4
## 18      setosa          5.1         3.5          1.4         0.3
## 19      setosa          5.7         3.8          1.7         0.3
## 20      setosa          5.1         3.8          1.5         0.3
## 21      setosa          5.4         3.4          1.7         0.2
## 22      setosa          5.1         3.7          1.5         0.4
## 23      setosa          4.6         3.6          1.0         0.2
## 24      setosa          5.1         3.3          1.7         0.5
## 25      setosa          4.8         3.4          1.9         0.2
## 26      setosa          5.0         3.0          1.6         0.2
## 27      setosa          5.0         3.4          1.6         0.4
## 28      setosa          5.2         3.5          1.5         0.2
## 29      setosa          5.2         3.4          1.4         0.2
## 30      setosa          4.7         3.2          1.6         0.2
## 31      setosa          4.8         3.1          1.6         0.2
## 32      setosa          5.4         3.4          1.5         0.4
## 33      setosa          5.2         4.1          1.5         0.1
## 34      setosa          5.5         4.2          1.4         0.2
## 35      setosa          4.9         3.1          1.5         0.2
## 36      setosa          5.0         3.2          1.2         0.2
## 37      setosa          5.5         3.5          1.3         0.2
## 38      setosa          4.9         3.6          1.4         0.1
## 39      setosa          4.4         3.0          1.3         0.2
## 40      setosa          5.1         3.4          1.5         0.2
## 41      setosa          5.0         3.5          1.3         0.3
## 42      setosa          4.5         2.3          1.3         0.3
## 43      setosa          4.4         3.2          1.3         0.2
## 44      setosa          5.0         3.5          1.6         0.6
## 45      setosa          5.1         3.8          1.9         0.4
## 46      setosa          4.8         3.0          1.4         0.3
## 47      setosa          5.1         3.8          1.6         0.2
## 48      setosa          4.6         3.2          1.4         0.2
## 49      setosa          5.3         3.7          1.5         0.2
## 50      setosa          5.0         3.3          1.4         0.2
## 51  versicolor          7.0         3.2          4.7         1.4
## 52  versicolor          6.4         3.2          4.5         1.5
## 53  versicolor          6.9         3.1          4.9         1.5
## 54  versicolor          5.5         2.3          4.0         1.3
## 55  versicolor          6.5         2.8          4.6         1.5
## 56  versicolor          5.7         2.8          4.5         1.3
## 57  versicolor          6.3         3.3          4.7         1.6
## 58  versicolor          4.9         2.4          3.3         1.0
## 59  versicolor          6.6         2.9          4.6         1.3
## 60  versicolor          5.2         2.7          3.9         1.4
## 61  versicolor          5.0         2.0          3.5         1.0
## 62  versicolor          5.9         3.0          4.2         1.5
## 63  versicolor          6.0         2.2          4.0         1.0
## 64  versicolor          6.1         2.9          4.7         1.4
## 65  versicolor          5.6         2.9          3.6         1.3
## 66  versicolor          6.7         3.1          4.4         1.4
## 67  versicolor          5.6         3.0          4.5         1.5
## 68  versicolor          5.8         2.7          4.1         1.0
## 69  versicolor          6.2         2.2          4.5         1.5
## 70  versicolor          5.6         2.5          3.9         1.1
## 71  versicolor          5.9         3.2          4.8         1.8
## 72  versicolor          6.1         2.8          4.0         1.3
## 73  versicolor          6.3         2.5          4.9         1.5
## 74  versicolor          6.1         2.8          4.7         1.2
## 75  versicolor          6.4         2.9          4.3         1.3
## 76  versicolor          6.6         3.0          4.4         1.4
## 77  versicolor          6.8         2.8          4.8         1.4
## 78  versicolor          6.7         3.0          5.0         1.7
## 79  versicolor          6.0         2.9          4.5         1.5
## 80  versicolor          5.7         2.6          3.5         1.0
## 81  versicolor          5.5         2.4          3.8         1.1
## 82  versicolor          5.5         2.4          3.7         1.0
## 83  versicolor          5.8         2.7          3.9         1.2
## 84  versicolor          6.0         2.7          5.1         1.6
## 85  versicolor          5.4         3.0          4.5         1.5
## 86  versicolor          6.0         3.4          4.5         1.6
## 87  versicolor          6.7         3.1          4.7         1.5
## 88  versicolor          6.3         2.3          4.4         1.3
## 89  versicolor          5.6         3.0          4.1         1.3
## 90  versicolor          5.5         2.5          4.0         1.3
## 91  versicolor          5.5         2.6          4.4         1.2
## 92  versicolor          6.1         3.0          4.6         1.4
## 93  versicolor          5.8         2.6          4.0         1.2
## 94  versicolor          5.0         2.3          3.3         1.0
## 95  versicolor          5.6         2.7          4.2         1.3
## 96  versicolor          5.7         3.0          4.2         1.2
## 97  versicolor          5.7         2.9          4.2         1.3
## 98  versicolor          6.2         2.9          4.3         1.3
## 99  versicolor          5.1         2.5          3.0         1.1
## 100 versicolor          5.7         2.8          4.1         1.3
## 101  virginica          6.3         3.3          6.0         2.5
## 102  virginica          5.8         2.7          5.1         1.9
## 103  virginica          7.1         3.0          5.9         2.1
## 104  virginica          6.3         2.9          5.6         1.8
## 105  virginica          6.5         3.0          5.8         2.2
## 106  virginica          7.6         3.0          6.6         2.1
## 107  virginica          4.9         2.5          4.5         1.7
## 108  virginica          7.3         2.9          6.3         1.8
## 109  virginica          6.7         2.5          5.8         1.8
## 110  virginica          7.2         3.6          6.1         2.5
## 111  virginica          6.5         3.2          5.1         2.0
## 112  virginica          6.4         2.7          5.3         1.9
## 113  virginica          6.8         3.0          5.5         2.1
## 114  virginica          5.7         2.5          5.0         2.0
## 115  virginica          5.8         2.8          5.1         2.4
## 116  virginica          6.4         3.2          5.3         2.3
## 117  virginica          6.5         3.0          5.5         1.8
## 118  virginica          7.7         3.8          6.7         2.2
## 119  virginica          7.7         2.6          6.9         2.3
## 120  virginica          6.0         2.2          5.0         1.5
## 121  virginica          6.9         3.2          5.7         2.3
## 122  virginica          5.6         2.8          4.9         2.0
## 123  virginica          7.7         2.8          6.7         2.0
## 124  virginica          6.3         2.7          4.9         1.8
## 125  virginica          6.7         3.3          5.7         2.1
## 126  virginica          7.2         3.2          6.0         1.8
## 127  virginica          6.2         2.8          4.8         1.8
## 128  virginica          6.1         3.0          4.9         1.8
## 129  virginica          6.4         2.8          5.6         2.1
## 130  virginica          7.2         3.0          5.8         1.6
## 131  virginica          7.4         2.8          6.1         1.9
## 132  virginica          7.9         3.8          6.4         2.0
## 133  virginica          6.4         2.8          5.6         2.2
## 134  virginica          6.3         2.8          5.1         1.5
## 135  virginica          6.1         2.6          5.6         1.4
## 136  virginica          7.7         3.0          6.1         2.3
## 137  virginica          6.3         3.4          5.6         2.4
## 138  virginica          6.4         3.1          5.5         1.8
## 139  virginica          6.0         3.0          4.8         1.8
## 140  virginica          6.9         3.1          5.4         2.1
## 141  virginica          6.7         3.1          5.6         2.4
## 142  virginica          6.9         3.1          5.1         2.3
## 143  virginica          5.8         2.7          5.1         1.9
## 144  virginica          6.8         3.2          5.9         2.3
## 145  virginica          6.7         3.3          5.7         2.5
## 146  virginica          6.7         3.0          5.2         2.3
## 147  virginica          6.3         2.5          5.0         1.9
## 148  virginica          6.5         3.0          5.2         2.0
## 149  virginica          6.2         3.4          5.4         2.3
## 150  virginica          5.9         3.0          5.1         1.8
```

4. Using the data from Task 3, plot the sepal width for each species. Perhaps 
   use a boxplot or a jitter plot (or both overlaid!). Be sure to format the
   axis labels nicely.


```r
ex2 %>% 
  ggplot(aes(species, sepal_width)) +
  geom_point(size = 1) +
  geom_boxplot() +
  geom_jitter(shape = 21, size = 1, color = "blue", fill = "#40b8d0") +
  xlab("Species") + ylab("Sepal Width")
```

![](s05_data-wrangling-exercise_part-2_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

5. `iris` expresses all of the measurements in centimeters. Convert them to 
   inches (1 in = 2.54 cm). Store this dataset as a new object.


```r
iris %>% 
  rename()
```

```
##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            5.1         3.5          1.4         0.2     setosa
## 2            4.9         3.0          1.4         0.2     setosa
## 3            4.7         3.2          1.3         0.2     setosa
## 4            4.6         3.1          1.5         0.2     setosa
## 5            5.0         3.6          1.4         0.2     setosa
## 6            5.4         3.9          1.7         0.4     setosa
## 7            4.6         3.4          1.4         0.3     setosa
## 8            5.0         3.4          1.5         0.2     setosa
## 9            4.4         2.9          1.4         0.2     setosa
## 10           4.9         3.1          1.5         0.1     setosa
## 11           5.4         3.7          1.5         0.2     setosa
## 12           4.8         3.4          1.6         0.2     setosa
## 13           4.8         3.0          1.4         0.1     setosa
## 14           4.3         3.0          1.1         0.1     setosa
## 15           5.8         4.0          1.2         0.2     setosa
## 16           5.7         4.4          1.5         0.4     setosa
## 17           5.4         3.9          1.3         0.4     setosa
## 18           5.1         3.5          1.4         0.3     setosa
## 19           5.7         3.8          1.7         0.3     setosa
## 20           5.1         3.8          1.5         0.3     setosa
## 21           5.4         3.4          1.7         0.2     setosa
## 22           5.1         3.7          1.5         0.4     setosa
## 23           4.6         3.6          1.0         0.2     setosa
## 24           5.1         3.3          1.7         0.5     setosa
## 25           4.8         3.4          1.9         0.2     setosa
## 26           5.0         3.0          1.6         0.2     setosa
## 27           5.0         3.4          1.6         0.4     setosa
## 28           5.2         3.5          1.5         0.2     setosa
## 29           5.2         3.4          1.4         0.2     setosa
## 30           4.7         3.2          1.6         0.2     setosa
## 31           4.8         3.1          1.6         0.2     setosa
## 32           5.4         3.4          1.5         0.4     setosa
## 33           5.2         4.1          1.5         0.1     setosa
## 34           5.5         4.2          1.4         0.2     setosa
## 35           4.9         3.1          1.5         0.2     setosa
## 36           5.0         3.2          1.2         0.2     setosa
## 37           5.5         3.5          1.3         0.2     setosa
## 38           4.9         3.6          1.4         0.1     setosa
## 39           4.4         3.0          1.3         0.2     setosa
## 40           5.1         3.4          1.5         0.2     setosa
## 41           5.0         3.5          1.3         0.3     setosa
## 42           4.5         2.3          1.3         0.3     setosa
## 43           4.4         3.2          1.3         0.2     setosa
## 44           5.0         3.5          1.6         0.6     setosa
## 45           5.1         3.8          1.9         0.4     setosa
## 46           4.8         3.0          1.4         0.3     setosa
## 47           5.1         3.8          1.6         0.2     setosa
## 48           4.6         3.2          1.4         0.2     setosa
## 49           5.3         3.7          1.5         0.2     setosa
## 50           5.0         3.3          1.4         0.2     setosa
## 51           7.0         3.2          4.7         1.4 versicolor
## 52           6.4         3.2          4.5         1.5 versicolor
## 53           6.9         3.1          4.9         1.5 versicolor
## 54           5.5         2.3          4.0         1.3 versicolor
## 55           6.5         2.8          4.6         1.5 versicolor
## 56           5.7         2.8          4.5         1.3 versicolor
## 57           6.3         3.3          4.7         1.6 versicolor
## 58           4.9         2.4          3.3         1.0 versicolor
## 59           6.6         2.9          4.6         1.3 versicolor
## 60           5.2         2.7          3.9         1.4 versicolor
## 61           5.0         2.0          3.5         1.0 versicolor
## 62           5.9         3.0          4.2         1.5 versicolor
## 63           6.0         2.2          4.0         1.0 versicolor
## 64           6.1         2.9          4.7         1.4 versicolor
## 65           5.6         2.9          3.6         1.3 versicolor
## 66           6.7         3.1          4.4         1.4 versicolor
## 67           5.6         3.0          4.5         1.5 versicolor
## 68           5.8         2.7          4.1         1.0 versicolor
## 69           6.2         2.2          4.5         1.5 versicolor
## 70           5.6         2.5          3.9         1.1 versicolor
## 71           5.9         3.2          4.8         1.8 versicolor
## 72           6.1         2.8          4.0         1.3 versicolor
## 73           6.3         2.5          4.9         1.5 versicolor
## 74           6.1         2.8          4.7         1.2 versicolor
## 75           6.4         2.9          4.3         1.3 versicolor
## 76           6.6         3.0          4.4         1.4 versicolor
## 77           6.8         2.8          4.8         1.4 versicolor
## 78           6.7         3.0          5.0         1.7 versicolor
## 79           6.0         2.9          4.5         1.5 versicolor
## 80           5.7         2.6          3.5         1.0 versicolor
## 81           5.5         2.4          3.8         1.1 versicolor
## 82           5.5         2.4          3.7         1.0 versicolor
## 83           5.8         2.7          3.9         1.2 versicolor
## 84           6.0         2.7          5.1         1.6 versicolor
## 85           5.4         3.0          4.5         1.5 versicolor
## 86           6.0         3.4          4.5         1.6 versicolor
## 87           6.7         3.1          4.7         1.5 versicolor
## 88           6.3         2.3          4.4         1.3 versicolor
## 89           5.6         3.0          4.1         1.3 versicolor
## 90           5.5         2.5          4.0         1.3 versicolor
## 91           5.5         2.6          4.4         1.2 versicolor
## 92           6.1         3.0          4.6         1.4 versicolor
## 93           5.8         2.6          4.0         1.2 versicolor
## 94           5.0         2.3          3.3         1.0 versicolor
## 95           5.6         2.7          4.2         1.3 versicolor
## 96           5.7         3.0          4.2         1.2 versicolor
## 97           5.7         2.9          4.2         1.3 versicolor
## 98           6.2         2.9          4.3         1.3 versicolor
## 99           5.1         2.5          3.0         1.1 versicolor
## 100          5.7         2.8          4.1         1.3 versicolor
## 101          6.3         3.3          6.0         2.5  virginica
## 102          5.8         2.7          5.1         1.9  virginica
## 103          7.1         3.0          5.9         2.1  virginica
## 104          6.3         2.9          5.6         1.8  virginica
## 105          6.5         3.0          5.8         2.2  virginica
## 106          7.6         3.0          6.6         2.1  virginica
## 107          4.9         2.5          4.5         1.7  virginica
## 108          7.3         2.9          6.3         1.8  virginica
## 109          6.7         2.5          5.8         1.8  virginica
## 110          7.2         3.6          6.1         2.5  virginica
## 111          6.5         3.2          5.1         2.0  virginica
## 112          6.4         2.7          5.3         1.9  virginica
## 113          6.8         3.0          5.5         2.1  virginica
## 114          5.7         2.5          5.0         2.0  virginica
## 115          5.8         2.8          5.1         2.4  virginica
## 116          6.4         3.2          5.3         2.3  virginica
## 117          6.5         3.0          5.5         1.8  virginica
## 118          7.7         3.8          6.7         2.2  virginica
## 119          7.7         2.6          6.9         2.3  virginica
## 120          6.0         2.2          5.0         1.5  virginica
## 121          6.9         3.2          5.7         2.3  virginica
## 122          5.6         2.8          4.9         2.0  virginica
## 123          7.7         2.8          6.7         2.0  virginica
## 124          6.3         2.7          4.9         1.8  virginica
## 125          6.7         3.3          5.7         2.1  virginica
## 126          7.2         3.2          6.0         1.8  virginica
## 127          6.2         2.8          4.8         1.8  virginica
## 128          6.1         3.0          4.9         1.8  virginica
## 129          6.4         2.8          5.6         2.1  virginica
## 130          7.2         3.0          5.8         1.6  virginica
## 131          7.4         2.8          6.1         1.9  virginica
## 132          7.9         3.8          6.4         2.0  virginica
## 133          6.4         2.8          5.6         2.2  virginica
## 134          6.3         2.8          5.1         1.5  virginica
## 135          6.1         2.6          5.6         1.4  virginica
## 136          7.7         3.0          6.1         2.3  virginica
## 137          6.3         3.4          5.6         2.4  virginica
## 138          6.4         3.1          5.5         1.8  virginica
## 139          6.0         3.0          4.8         1.8  virginica
## 140          6.9         3.1          5.4         2.1  virginica
## 141          6.7         3.1          5.6         2.4  virginica
## 142          6.9         3.1          5.1         2.3  virginica
## 143          5.8         2.7          5.1         1.9  virginica
## 144          6.8         3.2          5.9         2.3  virginica
## 145          6.7         3.3          5.7         2.5  virginica
## 146          6.7         3.0          5.2         2.3  virginica
## 147          6.3         2.5          5.0         1.9  virginica
## 148          6.5         3.0          5.2         2.0  virginica
## 149          6.2         3.4          5.4         2.3  virginica
## 150          5.9         3.0          5.1         1.8  virginica
```

6. Using the data from Task 5, plot the relationship between sepal width and
   sepal length. Indicate species using color and point shape.



7. Using the data from Task 5, plot the relationship between sepal width and
   sepal length. This time, separate each species into a different subplot 
   (facet).




# Back to Guide Again

Let's head back to the guide at the section on `summarize()`.


# Exercises for grouped data frames

Let's do some practice with grouping (and ungrouping) and summarizing data frames!

1. (a) What's the minimum life expectancy for each continent and each year? 
   (b) Add the corresponding country to the tibble, too. 
   (c) Arrange by min life expectancy.


```r
gapminder %>% 
  group_by(FILL_THIS_IN) %>% 
  FILL_THIS_IN(min_life = min(lifeExp))
```

```
## Error in eval(lhs, parent, parent): object 'gapminder' not found
```


2. Let's compute the mean Agreeableness score across items for each participant 
in the `psych::bfi` dataset. Be sure to handle `NA`!


```r
psych::bfi %>%
  as_tibble() %>% 
  select(A1:A5) %>% 
  rowwise() %>% 
  mutate(A_mean = mean(c(A1, A2, A3, A4, A5), na.rm = TRUE)) %>% 
  ungroup()
```

```
## # A tibble: 2,800 x 6
##       A1    A2    A3    A4    A5 A_mean
##    <int> <int> <int> <int> <int>  <dbl>
##  1     2     4     3     4     4    3.4
##  2     2     4     5     2     5    3.6
##  3     5     4     5     4     4    4.4
##  4     4     4     6     5     5    4.8
##  5     2     3     3     4     5    3.4
##  6     6     6     5     6     5    5.6
##  7     2     5     5     3     5    4  
##  8     4     3     1     5     1    2.8
##  9     4     3     6     3     3    3.8
## 10     2     5     6     6     5    4.8
## # … with 2,790 more rows
```

Now compute mean scores for Conscientiousness, as well as `sd` and `min` scores 
for reach person.



Some functions are **vectorized**, so you don't need `rowwise()`. 
For example, `pmin()` computes the "parallel min" across the vectors it receives:


```r
psych::bfi %>% 
  as_tibble() %>% 
  select(A1:A5) %>% 
  mutate(A_min = pmin(A1, A2, A3, A4, A5))
```

```
## # A tibble: 2,800 x 6
##       A1    A2    A3    A4    A5 A_min
##    <int> <int> <int> <int> <int> <int>
##  1     2     4     3     4     4     2
##  2     2     4     5     2     5     2
##  3     5     4     5     4     4     4
##  4     4     4     6     5     5     4
##  5     2     3     3     4     5     2
##  6     6     6     5     6     5     5
##  7     2     5     5     3     5     2
##  8     4     3     1     5     1     1
##  9     4     3     6     3     3     3
## 10     2     5     6     6     5     2
## # … with 2,790 more rows
```

**There are a few other ways to do this sort of computation.**

`rowMeans()` computes the mean of each row of a data frame. We can use it by
putting `select()` inside of `mutate()`:



```r
psych::bfi %>% 
  as_tibble() %>% 
  select(A1:A5) %>% 
  mutate(A_mn = rowMeans(select(., A1:A5)),
         A_mn2 = rowMeans(select(., starts_with("A", ignore.case = FALSE))))
```

```
## # A tibble: 2,800 x 7
##       A1    A2    A3    A4    A5  A_mn A_mn2
##    <int> <int> <int> <int> <int> <dbl> <dbl>
##  1     2     4     3     4     4   3.4   3.4
##  2     2     4     5     2     5   3.6   3.6
##  3     5     4     5     4     4   4.4   4.4
##  4     4     4     6     5     5   4.8   4.8
##  5     2     3     3     4     5   3.4   3.4
##  6     6     6     5     6     5   5.6   5.6
##  7     2     5     5     3     5   4     4  
##  8     4     3     1     5     1   2.8   2.8
##  9     4     3     6     3     3   3.8   3.8
## 10     2     5     6     6     5   4.8   4.8
## # … with 2,790 more rows
```

**In the development version of `dplyr`, there are some functions to make**
**this approach easier.**

```
remotes::install_github("tidyverse/dplyr")
```


```r
psych::bfi %>% 
  as_tibble() %>% 
  select(A1:A5) %>% 
  mutate(A_mn = rowMeans(across(A1:A5)),
         A_mn2 = rowMeans(across(starts_with("A", ignore.case = FALSE))))
```

3. Let's use `psych::bfi` and make a new data frame that has
   (1) each participant's educational level (convert it to a categorical variable
   using `factor*()`) and the mean score for each of the Big Five scales for each 
   participant. Store this data frame as a new object.
   

```r
FILL_THIS_IN <-
  psych::bfi %>% 
  FILL_THIS_IN(FILL_THIS_IN)
```

```
## Error in FILL_THIS_IN(., FILL_THIS_IN): could not find function "FILL_THIS_IN"
```

4. Use the data from Task 3 to summarize the distributions of Big Five scores 
   for each educational level (e.g., report the mean, sd, min, and max for
   each score in each group). Also report the sample size within each group.
   

```r
FILL_THIS_IN %>% 
  FILL_THIS_IN(FILL_THIS_IN) %>% 
  FILL_THIS_IN(FILL_THIS_IN)
```

```
## Error in eval(lhs, parent, parent): object 'FILL_THIS_IN' not found
```



# Bonus Exercises

1. In `gapminder`, take all countries in Europe that have a GDP per capita 
   greater than 10000, and select all variables except `gdpPercap`. 
   (Hint: use `-`).

2. Take the first three columns of `gapminder` and extract the names.

3. In `gapminder`, convert the population to a number in billions.

4. Take the `iris` data frame and extract all columns that start with 
   the word "Petal". 
    - Hint: take a look at the "Select helpers" documentation by running the 
      following code: `?tidyselect::select_helpers`.

5. Filter the rows of `iris` for Sepal.Length >= 4.6 and Petal.Width >= 0.5.

6. Calculate the growth in population since the first year on record 
_for each country_ by rearranging the following lines, and filling in the 
`FILL_THIS_IN`. Here's another convenience function for you: `dplyr::first()`. 

```
mutate(rel_growth = FILL_THIS_IN) %>% 
arrange(FILL_THIS_IN) %>% 
gapminder %>% 
knitr::kable()
group_by(country) %>% 
```




7. Determine the country, on each continent, that experienced the 
**sharpest 5-year drop in life expectancy**, sorted by the drop, by rearranging 
the following lines of code. Ensure there are no `NA`'s. A helpful function to 
compute changes in a variable across rows of data (e.g., for time-series data) 
is `tsibble::difference()`:

```
drop_na() %>% 
ungroup() %>% 
arrange(year) %>% 
filter(inc_life_exp == min(inc_life_exp)) %>% 
gapminder %>% 
mutate(inc_life_exp = FILL_THIS_IN) %>% # Compute the changes in life expectancy
arrange(inc_life_exp) %>% 
group_by(country) %>% 
group_by(continent) %>% 
knitr::kable()
```



Exercises 4. and 5. are from 
[r-exercises](https://www.r-exercises.com/2017/10/19/dplyr-basic-functions-exercises/).
