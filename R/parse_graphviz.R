#' Convert graph to table
#'
#' @param filename 
#'
#' @return
#' @export
#' @importFrom magrittr %>%
#' @importFrom stringr str_trim
#' @importFrom tidyr separate separate_row pivot_wider
#' @importFrom dplyr filter mutate 
#'
#' @examples
parse_graphviz <- function(filename){
  
  # read in the file and put it all in one string
  fullString <- paste0(readLines(filename), collapse = '\n')
  
  graphName <- gsub('^(di)?graph +', '', gsub(' +\\{.*', '', fullString))
  
  #remove opening/closing brackets
  bodyString <- gsub('\\}[^\\}]*$', '', gsub('^(di)?graph [^\\{]+\\{', '', fullString))
  
  #remove comments with leading //
  noCommentBody <- gsub('//[^\n]*\n', '', bodyString)
  
  #Pull appart the string to generate master table of all nodes/edge properties
  ans <- data.frame(lines = stringr::str_trim(unlist(strsplit(noCommentBody, split = '\n')))) %>% #split up the lines
    #only take non-empty lines
    dplyr::filter(grepl('\\S', lines)) %>%
    #create the edges by removing everything within the properties defied by []
    dplyr::mutate(edges = stringr::str_trim(gsub('\\[.*\\]', '', lines)),
                  #create the attributes by removing everything inside []
                  attributes = stringr::str_trim(gsub('\\].*$', '', gsub('^.*\\[', '', lines)) )) %>%
    #split out the 'edge' into nodes based on the direction separator
    tidyr::separate(col = edges, into = c('from', 'to'), sep = '->?', fill = 'right') %>%
    #Split out the attributes into their own rows
    tidyr::separate_rows(attributes, sep = ',') %>%
    ####break out the edges that are assigned multiple targets by first
    #strip out the {} from the end and start
    dplyr::mutate(to = stringr::str_trim(gsub('\\}\\s*$', '', gsub('^\\s*\\{', '', to)))) %>%
    #separate onto new rows the nodes based on spaces, ';' or ','
    tidyr::separate_rows(to, sep = '[\\s;,]+')  %>%
    #move the attributes into type/value pairs
    tidyr::separate(col = attributes, into = c('type', 'value'), sep = ' ?= ?') %>%
    #clean up spaces
    dplyr::mutate(across(everything(), stringr::str_trim))%>%
    #label the attributes in their own columns
    tidyr::pivot_wider(names_from = 'type', values_from = 'value') 
  
  return(ans)
}