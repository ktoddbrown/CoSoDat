#' Make semantic framework for data source
#'
#'What information is generally needed to download and access a new data source
#'
#' @return a list with the key parts of information and defined types
#' @export
#'
#' @examples
#' source.ls <- make_data_source()
make_data_source <- function(){
  data_source.ls <- list(data_source_ID = list(desciption = 'Internal study identifier; convention [FirstAuthorLastName-GroupName][Year][abc] ex Yamshito2015a',
                                               type = 'character'), #TODO formatting check here?
                         data_source_title = list(desciption = 'Long title of data source', #possibly redundent given citation
                                                  type = 'character'),
                         data_source_access = list(description = 'how the data was accessed',
                                                   type = list(regular_tables = 'download as individual data tables or as zipfiles with one header row and regular structure. Possible meta information in header defined as /* */ from Pangaea or as xml-style file from EDI.',
                                                               rescue = 'manual or scripted extraction needed from a scanned document or non-regular table'
                                                   )),
                         data_source_download_URL = list(description = 'list of for data download, as ; seperated list',
                                                         type = 'character'), #TODO formatting check here?
                         data_source_filename = list(description = 'list of data file names that match the data downloads',
                                                     type = 'character'),
                         data_source_citation = list(description = 'suggested data citation',
                                                     type = 'character'),
                         data_source_DOI = list(description = 'DOI for associated data object, might be different from download URL',
                                                type = 'character'),
                         data_source_published_year = list(description = 'Year data was published [Common Era]',
                                                           type = 'numeric', max = 'Inf', min = 0), # possibly redundant given citation
                         data_source_abstract = list(description = 'Abstract for data citation',
                                                     type = 'character'),
                         data_source_notes = list(description = 'Free notes field: why this data source was selected,list of data variables, keywords, and associated publications',
                                                  type = 'character'))
  return(data_source.ls)
}