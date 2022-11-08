# Emory R Workshop: November 11, 2022
{:.no_toc}

**Rollins COVID-19 Epidemiology Fellowship R Training**

-----

**Workshop Instructor:**

* [Melinda Higgins, PhD](https://melindahiggins.netlify.app/)
    - Director Biostatistics and Data Core
    - Office of Nursing Research
    - School of Nursing - Emory University
    - [melinda.higgins@emory.edu](mailto:melinda.higgins@emory.edu)

-----

**Table of Contents**

* TOC 1
{:toc}

# Overview of Workshop

This workshop will cover:

* Module 01
    * An introduction to R and RStudio
    * Learning about R Objects and data structures
* Module 02
    * Introduction to R packages
    * Loading data, Saving data
* Module 03
    * Data Visualization with `ggplot2` package
* Module 04
    * Brief Intro Data Wrangling with `dplyr` package
* Module 05
    * An introduction to R and RStudio
    * Learning about R Objects and data structures
* Module 06
    * Introduction to R packages
    * Loading data, Saving data
* Module 07
    * Data Visualization with `ggplot2` package
* Module 08
    * Brief Intro Data Wrangling with `dplyr` package


# Schedule - links to slides and R scripts

:spiral_calendar: November 11, 2022  
:alarm_clock:     09:00 - 16:00


| Time          | Activity         |
| :------------ | :--------------- |
| 09:00 - 09:25 | Module 1 [Slides: [Rworkshop_26Oct2022_Module01](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/Rworkshop_26Oct2022_Module01.html)]  [R script: [module01_Rscript.R](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/module01_Rscript.R)] |
| 09:25 - 09:50 | Module 2 [Slides: [Rworkshop_26Oct2022_Module02](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/Rworkshop_26Oct2022_Module02.html)]  [R script: [module02_Rscript.R](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/module02_Rscript.R)] |
|               | Files for optional data import/export: |
|               | * [abalone.csv - CSV format](https://github.com/melindahiggins2000/Emory_RWorkshop_26Oct2022/raw/main/abalone.csv) |
|               | * [abalone.RData - R Binary format](https://github.com/melindahiggins2000/Emory_RWorkshop_26Oct2022/raw/main/abalone.RData) |
|               | * [abalone.sas7bdat - SAS format](https://github.com/melindahiggins2000/Emory_RWorkshop_26Oct2022/raw/main/abalone.sas7bdat) |
|               | * [abalone.sav - SPSS format](https://github.com/melindahiggins2000/Emory_RWorkshop_26Oct2022/raw/main/abalone.sav) |
|               | * [abalone.xlsx - EXCEL XLSX format](https://github.com/melindahiggins2000/Emory_RWorkshop_26Oct2022/raw/main/abalone.xlsx) |
|               | * [abalone dataset at UCI library](https://archive.ics.uci.edu/ml/datasets/Abalone) |
| ------------- | ---------------- |
| 09:50 - 10:00 | _BIO Break_   |
| ------------- | ---------------- |
| 10:00 - 10:30 | Module 3 [Slides: [Rworkshop_26Oct2022_Module03](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/Rworkshop_26Oct2022_Module03.html)]  [R script: [module03_Rscript.R](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/module03_Rscript.R)] |
| 10:30 - 11:00 | Module 4 [Slides: [Rworkshop_26Oct2022_Module04](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/Rworkshop_26Oct2022_Module04.html)]  [R script: [module04_Rscript.R](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/module04_Rscript.R)] |
| ------------- | ---------------- |
| 11:00 - 12:00 | _Breakout Session 1_ |
| 12:00 - 13:00 | **LUNCH BREAK** |
| ------------- | ---------------- |
| 13:00 - 13:25 | Module 5 [Slides: [Rworkshop_26Oct2022_Module03](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/Rworkshop_26Oct2022_Module03.html)]  [R script: [module03_Rscript.R](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/module03_Rscript.R)] |
| 13:25 - 13:50 | Module 6 [Slides: [Rworkshop_26Oct2022_Module04](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/Rworkshop_26Oct2022_Module04.html)]  [R script: [module04_Rscript.R](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/module04_Rscript.R)] |
| ------------- | ---------------- |
| 13:50 - 14:00 | _BIO Break_   |
| ------------- | ---------------- |
| 14:00 - 14:30 | Module 7 [Slides: [Rworkshop_26Oct2022_Module03](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/Rworkshop_26Oct2022_Module03.html)]  [R script: [module03_Rscript.R](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/module03_Rscript.R)] |
| 14:30 - 15:00 | Module 8 [Slides: [Rworkshop_26Oct2022_Module04](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/Rworkshop_26Oct2022_Module04.html)]  [R script: [module04_Rscript.R](https://melindahiggins2000.github.io/Emory_RWorkshop_26Oct2022/module04_Rscript.R)] |
| ------------- | ---------------- |
| 15:00 - 16:00 | _Breakout Session 2_ |
| ------------- | ---------------- |

# Preparation for Workshop

1. Install R [https://cran.r-project.org/](https://cran.r-project.org/)
2. Install RStudio Desktop [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)
3. Install the R packages listed below.
4. _OPTIONAL_ if you are still actively enrolled in RSPH, you can also run R and RStudio in the Emory RSPH virtual desktop using Apporto, [https://rsphemory.apporto.com/](https://rsphemory.apporto.com/).
5. Online BOOKS to get started:
    1. _Statistical Inference via Data Science: A ModernDive into R and the Tidyverse!_ by Chester Ismay and Albert Y. Kim [https://moderndive.netlify.app/](https://moderndive.netlify.app/).
    2. _R in Action, Third Edition: Data analysis and graphics with R and Tidyverse_ by Robert I. Kabacoff [https://www.manning.com/books/r-in-action-third-edition](https://www.manning.com/books/r-in-action-third-edition)
    3. _The Epidemiologist R Handbook_ [https://epirhandbook.com/en/](https://epirhandbook.com/en/)



# R packages to be used in workshop:

* `tidyverse` - which includes:
    - `ggplot2`
    - `dplyr`
    - `readr`
* `palmerpenguins`
* `gapminder`
* `patchwork`
* `Hmisc`
* `psych`
* (optional packages)
    - `arsenal`
    - `readxl`
    - `haven`
    - `foreign`
    - `ggthemes`
    - `ggthemr`
* All packages available at [CRAN](https://cran.r-project.org/) - click on "Packages"

# Workshop Recording

* _To be added later..._

# Learn more about Rmarkdown at:

* [Rmarkdown by RStudio](https://rmarkdown.rstudio.com/)
* [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)
* [R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)
* Example Blog [http://jenrichmond.rbind.io/post/2021-08-31-parameterised-penguins/](http://jenrichmond.rbind.io/post/2021-08-31-parameterised-penguins/)
* Example Document [https://rpubs.com/jenrichmond/adelie](https://rpubs.com/jenrichmond/adelie)

# More R Resources - get help and inspiration

* [RStudio Education](https://education.rstudio.com/)
* [Quick-R](https://www.statmethods.net/)
* [BOOK: R in Action, 3rd ed.](https://www.manning.com/books/r-in-action-third-edition)
* [Datacamp](https://www.datacamp.com/)
    * [R for SAS Users - My Datacamp Course](https://www.datacamp.com/courses/r-for-sas-users)
* [Coursera](https://www.coursera.org/)
    * [Reproducible Templates for Analysis and Dissemination - My Coursera Course](https://www.coursera.org/learn/reproducible-templates-analysis)
* My Emory Courses:
    * [Emory N741](https://melindahiggins2000.github.io/N741bigdata/)
    * [Emory N736](https://melindahiggins2000.github.io/N736/)
* [BOOK: Statistical Inference via Data Science](https://moderndive.com/)
* [BOOK: The Epidemiologist R Handbook](https://epirhandbook.com/en/index.html)
* [BOOK: R Graphics Cookbook, 2nd edition](https://r-graphics.org/) by Winston Chang and associated [R Graphics Cookbook website]( http://www.cookbook-r.com/Graphs/)
* [The R Graph Gallery](https://r-graph-gallery.com/)




