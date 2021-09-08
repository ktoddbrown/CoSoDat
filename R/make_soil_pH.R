#' Make soil pH specifications
#'
#' @return
#' @export
#'
#' @examples
make_soil_pH <- function(){
  soil_pH.ls <- list(soil_pH = list(
    value = list(description = 'soil pH measurement; [common values 3.5, 11.5]',
                 range = list(min = 0, max = 14)),
    unit = '[unitless] - negative of the base 10 logarithm of the activity of the H+ ion',
    precision = list('0.5' = '0.5 unit of precision, common with general consumer litmus paper',
                     '0.1' = '0.1 unit of precision'),
    method = list(soil_water_status = list('ovan dry', 'air dry', 'field moist'),
                  solute = list('water' = 'soil sample diluted with pure water [common]',
                                'CaCl2' = list(description = 'soil sample diluted with CaCl2 in water [common]',
                                               solute_molarity = list('1M', '0.1M', '0.01M')),
                                'KCl'   = list(description = 'soil sample diluted with KCl in water',
                                               solute_molarity = list('1M', '0.1M')),
                                'NaF'   = list(description = 'soil sample diluted with NaF in water',
                                               solute_molarity = list('1M', '0.1M'))),
                  soil_ratio = list('saturation' = 'saturated soil paste',
                                    '1:1' = '1 to 1 soil to solute',
                                    '1:2' = '1 to 2 soil to solute',
                                    '1:2.5' = '1 to 2.5 soil to solute',
                                    '1:5' = '1 to 5 soil to solute',
                                    '1:10' = '1 to 10 soil to solute'),
                  equilibration_time = list('aprox 1hr' = '1 hour between solution creation and measurement [common]',
                                            '>1hr' = 'longer time periods [sulfdic materials in coastal deposits]'),
                  instrument = list(litmus = 'litmus paper',
                                    benchtop_meter = 'Benchtop pH meter',
                                    handheld_meter = 'Handheld pH meter'),
                  pedotransfer_pH = list(description = 'convert between one pH measurement and a second',
                    parameter = list(),#empty
                    input = list(soil_pH), #empty to avoid infinite loop
                    r_function = '#empty'
                  )
    )
  ))
}
