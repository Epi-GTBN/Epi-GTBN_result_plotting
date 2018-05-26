# Epi-GTBN plotting code

[![R-3.4.1](https://img.shields.io/badge/R-3.4.1-green.svg)](https://cran.r-project.org)

This is the plotting code for my thesis utilizing `ggplot2`. My working title for that thesis is ***Epi-GTBN: An Approach of Epistasis Mining Based on Genetic Tabu Algorithm and Bayesian Network***

<a href="https://github.com/Epi-GTBN">
  <img src="https://sgyzetrov.github.io/images/epiGTBN-horizontal.png" alt="Epi-GTBN logo" title="An Approach of Epistasis Mining Based on Genetic Tabu Algorithm and Bayesian Network" height = 100px>
</a>

## Dependency

```R
ggplot2
reshape2
```

## Input & Tweak

### Input

Input should be like `0025HERaccuracy_Example.csv` in given files.

By default it will search for `0025HERaccuracy_Example.csv` in R default diretory. Maybe `getwd()` and `setwd()` could help.

### Tweak

Comments in `plot.R` should act as a good helper. Also, some quick tweaks are presented below.

- Change `filename = 0025HERaccuracy_Example` to your own dataset's name. 
- In `colnames(dataset) = c("Method","MAF = 0.1","MAF = 0.2","MAF = 0.3","MAF = 0.4")`, Change `"Method","MAF = 0.1","MAF = 0.2","MAF = 0.3","MAF = 0.4"` to your own dataset's column names.
- In `dataset_long = melt(dataset, id.vars = "Method", variable.name = "MAF", value.name = "Accuracy")`, change `id.vars` to your own dataset's first column name; change `variable.name` to the name for your plots' horizontal axis and `value.name` to the name for your plots' vertical axis.
- In `dataset_long$Method = factor(dataset_long$Method, level = c("AntEpiSeeker", "BEAM", "BOOST", "hill-climbing", "MDR", "SNPRuler", "Epi-GTBN"))`, change `"AntEpiSeeker", "BEAM", "BOOST", "hill-climbing", "MDR", "SNPRuler", "Epi-GTBN"` to value of your own dataset's first column.
- In `palette = c("#000000", "#E69F00", "#CC99FF", "#D55E00", "#F0E442", "#0072B2", "#009E73")`, amount of colors should coincide with amount of values of your own dataset's first column.
- In `color = c(palette, palette, palette, palette)`, `palette` appears the same as the amount of the rest of your column (other than your first column). Like four times in my case.
- In `p = ggplot(dataset_long,aes(x = Method, y = Accuracy))+facet_grid(.~MAF)+`, change `x = Method, y = Accuracy, .~MAF` to your previous configurations (`id.vars`, `value.name` and `variable.name`).


## Plot's Result Demo

![0025HERaccuracy_ExampleAccuracy.png](https://github.com/Epi-GTBN/Epi-GTBN_result_plotting/blob/master/0025HERaccuracy_ExampleAccuracy.png)

