#' Soil fraction description
#'
#' Specification for different soil fraction methods.
#'
#' @return
#' @export
#'
#' @examples
make_soil_fraction <- function(){
  ans <- list(soil_fraction =
                list(
                  description = 'soil subsampling method',
                  method = list(
                    size = list(
                      description = 'soil sample fractionated by size',
                      upper_bound = list(
                        description = 'upper bound sieve size of soil fraction',
                        value = list(min = 0, max = Inf),
                        unit = list('mm' = 'millimeter [common]')
                      ),
                      lower_bound = list(
                        description = 'lower bound sieve size of soil fraction',
                        value = list(min = 0, max = Inf),
                        unit = list('millimeter' = 'mesh size in millimeter [common]')
                      ),
                      method = list('dry' ='sieved dry [common]',
                                    'wet' = 'sieved wet, 100% saturation')
                    ), 
                    density_extraction = list(
                      description = 'soil sample fractionated by density',
                      fraction = list('light' = 'subset of sample that is light or less dense',
                                      'supernatant' = 'suspended solution',
                                      'percipitate' = 'subset of sample that is heavy or more dense'),
                      method = list(solution = list('water'),
                                    aggitation = list('none'= 'without aggitation',
                                                      sonication = 'with sonication',
                                                      centrifuge = 'with centrifuge')
                      )
                    )
                  )
                )
  )
  
  return(ans)
  
}