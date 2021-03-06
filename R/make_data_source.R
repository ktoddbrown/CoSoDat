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
  data_source.ls <- list(data_source = list(
    ID = list(desciption = 'Internal study identifier; convention [FirstAuthorLastName-GroupName][Year][abc] ex Yamshito2015a',
              type = 'character'), #TODO formatting check here?
    citation = list(description = 'data citation',
                    type = 'character'),
    DOI = list(description = 'DOI for entire associated data object',
               type = 'character'),
    abstract = list(description = 'Abstract for data citation',
                    type = 'character'),
    license = list(description = 'data license and use-case restrictions',
                   type = 'chacacter'),
    notes = list(description = 'Free notes field: why this data source was selected,list of data variables, keywords, and associated publications',
                 type = 'character'),
    access = list(description = 'how the data was accessed',
                  type = list(regular_tables = 'download as individual data tables or as zipfiles with one header row and regular structure. Possible meta information in header defined as /* */ from Pangaea or as xml-style file from EDI.',
                                rescue = 'manual or one-off scripted extraction needed from a scanned document or non-regular table'
                  )),
    download = list(description = 'list of for data download including the name of the file paired with the download url',
                    type = 'pair-list')
  )
  )
  return(data_source.ls)
}