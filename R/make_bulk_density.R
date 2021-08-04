#' Make semantic framework for bulk density
#' 
#' A soil bulk density value generally uses the methods specified in the list structure defined here.
#' Note that coarse fraction is generally needed to interpret the bulk density measurement and also defined here.
#' All masses are assumed to reflect dry weight, either measured or inferred.
#'
#' @return a list describing the information needed to utilize a bulk density measurement
#' @export
#'
#' @examples
#' bd.ls <- make_bulk_density()
#' 
make_bulk_density <- function(){
  bulk_density.ls <- list(bulk_density_value = list(description = 'Bulk density - dry soil to volume ratio, specify inclusion of coarse fraction in data', 
                                                    type = 'numeric', min = 0, max = Inf),                        
                          bulk_density_units = list(description= 'Bulk density unit [mass per volume]', 
                                                    type = 'character'),
                          bulk_density_volume_method = list(description = 'Bulk density volume method', 
                                                            type = list(geometric_volume = 'Volume by extracted slice or core geometry.',
                                                                           compliant_cavity = 'Fill hole with material of known density',
                                                                           clod = 'Volume by displacement of soil mass.',
                                                                           auger_cores = 'Internal core volume of an auger core',
                                                                           imaged_volume = '3D scan for volume of soil clod')),
                          bulk_density_includes_coarse_fraction = list(description = 'Flags inclusion of coarse fraction in bulk density value',
                                                                       type = 'logical'),
                          coarse_fraction_value = list(description = 'Coarse fraction', 
                                                       type = 'numeric', min = 0, max = 1),
                          coarse_fraction_unit = list(description = 'Coarse fraction unit', 
                                                      type = list(mass_ratio = 'ratio of coarse fraction mass to whole soil mass [common]', 
                                                                     volume_ratio = 'ratio of coarse fraction volume to whole soil volume [rare]')),
                          coarse_fraction_method = list(description = 'Coarse fraction separation methods', 
                                                        type = list(sieve_2mm = ' >2mm sieve size [common]', 
                                                                       hand_picked = 'hand picked large partices (ex roots, and rocks), generally peats [rare]'))
  )
  
  return(bulk_density.ls)
}