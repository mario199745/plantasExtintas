Trabajo con plantas extintas
================

# Introducción

En este documento trabajaremos para explorar la identidad de plantas que
se encuentran extintas en silvestría o totalmente según la
[*IUCN*](https://www.iucnredlist.org/).

## Subtítulo

``` r
library(readr)
plants <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_double(),
    ##   binomial_name = col_character(),
    ##   country = col_character(),
    ##   continent = col_character(),
    ##   group = col_character(),
    ##   year_last_seen = col_character(),
    ##   red_list_category = col_character()
    ## )

    ## See spec(...) for full column specifications.

## Filtrando los datos para resolver el ejemplo

El código que voy a ejecutar, es para resolver el problema en el
siguiente
[slide](https://derek-corcoran-barrios.github.io/CursoProgrPres/Clase2/Clase2InvestigacionReproducible.html#29),
para poner dentro de la base de datos, solo los datos de Chile y solo
usar las columnas para país (country), la especie

``` r
library(dbplyr)
chile <- plants %>% 
  dplyr::filter(country == "Chile") %>% 
  dplyr::select(binomial_name, country)
chile
```

    ## # A tibble: 2 x 2
    ##   binomial_name           country
    ##   <chr>                   <chr>  
    ## 1 Santalum fernandezianum Chile  
    ## 2 Sophora toromiro        Chile

## Resumen de especies por país

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:dbplyr':
    ## 
    ##     ident, sql

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
Resumen <- plants %>% 
  dplyr::filter (continent == "South America") %>%
  group_by(country) %>% 
  summarise(n_species = n())
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

``` r
Resumen 
```

    ## # A tibble: 9 x 2
    ##   country             n_species
    ##   <chr>                   <int>
    ## 1 Argentina                   1
    ## 2 Bolivia                     1
    ## 3 Brazil                     10
    ## 4 Chile                       2
    ## 5 Colombia                    6
    ## 6 Ecuador                    52
    ## 7 Peru                        4
    ## 8 Trinidad and Tobago         6
    ## 9 Venezuela                   1
