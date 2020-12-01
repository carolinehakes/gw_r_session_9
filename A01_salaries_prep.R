library(tidyverse)
library(lubridate)
library(janitor)
library(glue)
library(plotly)
library(DT)
library(kableExtra)
library(htmlwidgets)
library(htmltools)
library(summarytools)


#import and format columns
salaries <- read_csv("whsalaries_2017_2018.csv")

salaries <- salaries %>% 
  clean_names() %>% 
  mutate(
    name = str_to_upper(name),
    last = str_to_upper(last),
    first_m = str_to_upper(first_m),
    first = str_to_upper(first),
    status = str_to_upper(status),
    paybasis = str_to_upper(paybasis),
    positiontitle = str_to_upper(positiontitle),
    salary = parse_number(salary)
  )


### looking and avgs and medians ####

#for everyone, by year
salaries %>% 
  group_by(year) %>% 
  summarise(median(salary))

salaries %>% 
  group_by(year) %>% 
  summarise(mean(salary))


### finding highest paid people ####

salaries %>% 
  filter(year == "2017") %>% 
  select(name, salary, positiontitle) %>% 
  arrange(desc(salary)) %>% 
  head(20) 

salaries %>% 
  filter(year == "2018") %>% 
  select(name, salary, positiontitle) %>% 
  arrange(desc(salary)) %>% 
  head(20) 
  

#summarytools summaries
view(dfSummary(salaries))

