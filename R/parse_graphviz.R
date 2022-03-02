# Read in the lines of the file
# remove everything outside of the parens
# remove all comments
# remove all empty lines
# strip graph <name> {} out
# sellect all lines without ->
# split and rotate
# select all lines with -> 
# split split and rotate

temp <- paste0(readLines('graphviz/loss_on_ignition.gv'), collapse = '\n')

#remove opening brackets
temp2 <- gsub('\\}[^\\}]*$', '', gsub('^.*graph [^\\{]+\\{', '', temp))

#remove comments
temp3 <- gsub('//[^\n]*\n', '', temp2)
library(tidyverse)
data.frame(lines = stringr::str_trim(unlist(strsplit(temp3, split = '\n')))) %>%
  filter(grepl('\\S', lines)) %>%
  mutate(edges = stringr::str_trim(gsub('\\[.*\\]', '', lines)),
         attributes = stringr::str_trim(gsub('\\].*$', '', gsub('^.*\\[', '', lines)) )) %>%
  tidyr::separate(col = edges, into = c('from', 'to'), sep = '->') %>%
  tidyr::separate_rows(attributes, sep = ',') %>%
  mutate(to = gsub('\\}', '', gsub('\\{', '', to))) %>%
  separate_rows(to, sep = '[\\s;,]+') %>%
  mutate(across(everything(), stringr::str_trim)) %>%
  separate(col = attributes, into = c('type', 'value'), sep = ' ?= ?') %>% 
  pivot_wider(names_from = 'type', values_from = 'value') %>%view
  
