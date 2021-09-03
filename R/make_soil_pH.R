#' Make soil pH specifications
#'
#' @return
#' @export
#'
#' @examples
make_soil_pH <- function(){
  soil_pH.ls <- list(soil_pH = list(
    value = list(
      description = 'soil pH measurement',
      unit = '[unitless] - negative of the base 10 logarithm of the activity of the H+ ion',
      range = list(min = 0, max = 10)),
    percision = list('0.5' = '0.5 unit of percision, common with general consumer litmus paper',
                     '0.1' = '0.1 unit of percision'),
    method = list(
      solute = list('water' = 'soil sample diluted with pure water',
                    'CaCl2' = 'soil sample diluted with 0.01M CaCl2 in water'),
      soil_ratio = list('1:1' = '1 to 1 soil to solute',
                        '1:2' = '1 to 2 soil to solute',
                        '1:5' = '1 to 5 soil to solute',
                        '1:10' = '1 to 10 soil to solute'),
      instrament = list(
        litmus = 'litmus paper',
        meter = 'ph meter')
    )
  ))
}