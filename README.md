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

# Preparation for Workshop

1. Install R [https://cran.r-project.org/](https://cran.r-project.org/)
    * see instructions on installing R in chapter 1 of [Modern Dive Book](https://moderndive.netlify.app/1-getting-started.html#r-rstudio)
2. Install RStudio Desktop [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)
    * * see instructions on installing R in chapter 1 of [Modern Dive Book](https://moderndive.netlify.app/1-getting-started.html#r-rstudio)
3. Install the R packages listed below.
    * see instruction on how to install packages at Chapter 1.3.1 in the [Modern Dive Book](https://moderndive.netlify.app/1-getting-started.html#package-installation).
4. Download datasets and mapfiles:
    * [abalone.csv - CSV format](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/abalone.csv)
    * [abalone.RData - R Binary format](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/abalone.RData)
    * [abalone.sas7bdat - SAS format](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/abalone.sas7bdat)
    * [abalone.sav - SPSS format](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/abalone.sav)
    * [abalone.xlsx - EXCEL XLSX format](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/abalone.xlsx)
    * [abalone dataset at UCI library](https://archive.ics.uci.edu/ml/datasets/Abalone)
    * [Fulton County Map Shapefiles - ZIP file](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/FultonCountyZipCodes.zip)
    * [FALSE GA COVID DATA - EXCEL file](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/FALSE%20COVID%20DATA_TRAINING.xlsx)

**OPTIONAL PREP**

4. _OPTIONAL_ if you are still actively enrolled in RSPH, you can also run R and RStudio in the Emory RSPH virtual desktop using Apporto, [https://rsphemory.apporto.com/](https://rsphemory.apporto.com/).
5. Online BOOKS to get started:
    1. _Statistical Inference via Data Science: A ModernDive into R and the Tidyverse!_ by Chester Ismay and Albert Y. Kim [https://moderndive.netlify.app/](https://moderndive.netlify.app/).
    2. _R in Action, Third Edition: Data analysis and graphics with R and Tidyverse_ by Robert I. Kabacoff [https://www.manning.com/books/r-in-action-third-edition](https://www.manning.com/books/r-in-action-third-edition)
    3. _The Epidemiologist R Handbook_ [https://epirhandbook.com/en/](https://epirhandbook.com/en/)

# R packages to be installed for workshop:

See packages listed on [CRAN](https://cran.r-project.org/) - click on "Packages". All of the packages on CRAN can be installed inside RStudio by clicking on "Tools/Install Packages" top menu.

* [`tidyverse` website](https://www.tidyverse.org/) on [`tidyverse` on CRAN](https://cran.r-project.org/web/packages/tidyverse/index.html)- which includes:
    - [`ggplot2` website](https://ggplot2.tidyverse.org/) and on [CRAN](https://cran.r-project.org/web/packages/ggplot2/)
    - [`dplyr` website](https://dplyr.tidyverse.org/ and on [CRAN](https://cran.r-project.org/web/packages/dplyr/))
    - [`readr` website](https://readr.tidyverse.org/) and on [CRAN](https://cran.r-project.org/web/packages/readr/)
    - [`haven` website](https://haven.tidyverse.org/) and on [CRAN](https://cran.r-project.org/web/packages/haven/) and more packages are included
* [`palmerpenguins` website](https://allisonhorst.github.io/palmerpenguins/) and on [CRAN](https://cran.r-project.org/web/packages/palmerpenguins/)
* [`patchwork` website](https://patchwork.data-imaginist.com/) and on [CRAN](https://cran.r-project.org/web/packages/patchwork/)
* [`Hmisc` website](https://hbiostat.org/R/Hmisc/) and on [CRAN](https://cran.r-project.org/web/packages/Hmisc/)
* [`psych` website](https://personality-project.org/r/psych/) and on [CRAN](https://cran.r-project.org/web/packages/psych/)
* [`arsenal` website](https://mayoverse.github.io/arsenal/) and on [CRAN](https://cran.r-project.org/web/packages/arsenal/)
* [`readxl` website](https://readxl.tidyverse.org/) and on [CRAN](https://cran.r-project.org/web/packages/readxl/)
* [`foreign` on CRAN](https://cran.r-project.org/web/packages/foreign/)
* [`ggthemes` on CRAN](https://cran.r-project.org/web/packages/ggthemes/)
* [`data.table` website](https://rdatatable.gitlab.io/data.table/) and on [CRAN](https://cran.r-project.org/web/packages/data.table/)
* [`sf` website](https://r-spatial.github.io/sf/) and on [CRAN](https://cran.r-project.org/web/packages/sf/index.html)
* [`leaflet` website](https://rstudio.github.io/leaflet/) and on [CRAN](https://cran.r-project.org/web/packages/leaflet/index.html)

* _OPTIONAL_ [`ggthemr` on Github](https://github.com/Mikata-Project/ggthemr) - this one is not yet on CRAN and is totally optional to install. For this you will need the `devtools` package which is available on [CRAN](https://cran.r-project.org/web/packages/devtools/). Once you have `devtools` installed, you can optionally install the `ggthemr` package by typing the following command:

```
devtools::install_github('Mikata-Project/ggthemr')
```


# Overview of Workshop

This workshop will cover (final list in development):

* Module 01
    * An introduction to R and RStudio
    * Learning about R Objects and data structures
* Module 02
    * Introduction to R packages
    * Loading data, Saving data (read/write datasets)
* Module 03
    * Data Visualization with `ggplot2` package
* Module 04
    * Brief Intro Data Wrangling with `dplyr` package
* Module 05
    * Introduction to [Rmarkdown](https://rmarkdown.rstudio.com/)
    * Exercise - creating Rmarkdown Report
* Module 06
    * Using `dplyr` to join datasets
* Module 07
    * Putting it all together into a "COVID Case Report"
* Module 08
    * Open Dialog - audience questions


# Schedule - links to slides and R scripts

:spiral_calendar: November 11, 2022  
:alarm_clock:     09:00 - 16:00


| Time          | Activity         |
| :------------ | :--------------- |
| 09:00 - 09:25 | Module 1 [[Slides](https://melindahiggins2000.github.io/Emory_RWorkshop_11Nov2022/Rworkshop_11Nov2022_Module01.html#1) and [R script](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/module01_Rscript.R)] |
| 09:25 - 09:50 | Module 2 [[Slides](https://melindahiggins2000.github.io/Emory_RWorkshop_11Nov2022/Rworkshop_11Nov2022_Module02.html#1) and [R script](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/module02_Rscript.R)] |
| ------------- | ---------------- |
| 09:50 - 10:00 | _BIO Break_   |
| ------------- | ---------------- |
| 10:00 - 10:30 | Module 3 [[Slides](https://melindahiggins2000.github.io/Emory_RWorkshop_11Nov2022/Rworkshop_11Nov2022_Module03.html#1) and [R script](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/module03_Rscript.R)] |
| 10:30 - 11:00 | Module 4 [[Slides](https://melindahiggins2000.github.io/Emory_RWorkshop_11Nov2022/Rworkshop_11Nov2022_Module04.html#1) and [R script](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/module04_Rscript.R)] |
| ------------- | ---------------- |
| 11:00 - 12:00 | _Breakout Session 1_ [working on exercises from above modules] |
| 12:00 - 13:00 | **LUNCH BREAK** |
| ------------- | ---------------- |
| 13:00 - 13:25 | Module 5 [Abalone Rmarkdown Report](https://melindahiggins2000.github.io/Emory_RWorkshop_11Nov2022/AbaloneReport.html) and [Rmarkdown file](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/AbaloneReport.Rmd) |
| 13:25 - 13:50 | Module 6 [Merging Datasets Exercise](https://melindahiggins2000.github.io/Emory_RWorkshop_11Nov2022/merging_datasets.html) and [Rmarkdown file](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/merging_datasets.Rmd) |
| ------------- | ---------------- |
| 13:50 - 14:00 | _BIO Break_   |
| ------------- | ---------------- |
| 14:00 - 14:30 | Module 7 [COVID Cases Report](https://melindahiggins2000.github.io/Emory_RWorkshop_11Nov2022/FultonCounty_COVIDStats.html) and [Rmarkdown file](https://github.com/melindahiggins2000/Emory_RWorkshop_11Nov2022/raw/main/FultonCounty_COVIDStats.Rmd) |
| 14:30 - 15:00 | Module 8 Open Q&A |
| ------------- | ---------------- |
| 15:00 - 16:00 | _Breakout Session 2_ [working on exercises from modules and more editing on COVID case report] |
| ------------- | ---------------- |


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




