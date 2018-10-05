
## Overview

This package allows the user to assemble pharmacometrics ready databases from tabulated files following NONMEM convention.

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

## Using puzzle() to Assemble Pharmacometric Datasets

1) Load some data

```{r}
nm = list(pk = list(parent=as.data.frame(puzzle::df_pk_start)),
          dose=as.data.frame(puzzle::df_dose_start),
          cov=as.data.frame(puzzle::df_cov_start))
```

2) Run puzzle()

```{r}
puzzle(directory=file.path(getwd()),
       order=1,
       pk=list(data=nm$pk), 
       dose=list(data=nm$dose), 
       cov=list(data=nm$cov),
       nm=list(name="nonmem.csv"))

```

The puzzle function will create a NONMEM ready dataset "nonmem.csv" from the R object nm assuming the absorption is going to be modeled using a first order absorption process (i.e. order=1).

## Recommended reading

Extensive package documentation is available here: https://syneoshealth.github.io/puzzle/