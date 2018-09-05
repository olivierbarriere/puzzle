
## Overview

The puzzle package simplifies one of the most time consuming task of the pharmacometrician workflow. This package allows you to build pharmacometrics ready databases from tabulated files following NONMEM formating convention.

## Installation

You should follow these steps:

1) Install the devtools package if you have not done so far.


```{r}
install.packages("devtools")
```

2) Load the devtools package.


```{r}
library("devtools")
```

3) Install the puzzle


```{r}
install_github("syneoshealth/puzzle")
```

4) Load the puzzle package

```{r}
library("puzzle")
```

## Assembling Pharmacometric Databases

1) Load the datasets

```{r}
pk = puzzle::df_pk
dose = puzzle::df_dose
```

2) Save them as .csv files

```{r}
pk = readr::write_csv(pk,"pk.csv")
dose = readr::write_csv(dose,"dose.csv")
```
3) Call the puzzle function puzzle()

```{r}
puzzle(directory=file.path(getwd()),
      order=1,
      pk=list(name="pk.csv"), 
      dose=list(name="dose.csv"), 
      nm=list(name="nonmem.csv"))
```
The puzzle function will create a NONMEM ready dataset "nonmem.csv" from the tabulated files "pk.csv" and "dose.csv" assuming the absorption is going to be modeled using a first order absorption process (order=1).

## Recommended reading

Extensive package documentation is available here: 