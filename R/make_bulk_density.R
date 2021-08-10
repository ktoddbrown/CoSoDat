#' Make semantic framework for bulk density
#' 
#' A soil bulk density value generally uses the methods specified in the list structure defined here.
#' All masses are assumed to reflect dry weight, either measured or inferred, this may change in the future as we extend to hydrological measurements.
#'
#' @return a list describing the information needed to utilize a bulk density measurement
#' @export
#'
#' @examples
#' bd.ls <- make_bulk_density()
#' 
make_bulk_density <- function(){
  bulk_density.ls <- list(bulk_density = list(
    value = list(
      description = 'Bulk density - dry soil to volume ratio, specify inclusion of coarse fraction in data', 
      range = list(min = 0, max = Inf)),
    units = list(
      description= 'Bulk density unit [mass per volume]', 
      control_vocabulary = list(g_per_cm3 = 'grams per centimeter cubed',
                                kg_per_m3 = 'killograms per meter cubed')),
    method = list(
      volume = list(
        description = 'Bulk density volume method', 
        
        control_vocabulary = list(
          geometric_volume = 'Volume by extracted slice or core geometry.',
          compliant_cavity = 'Fill hole with material of known density',
          clod = 'Volume by displacement of soil mass.',
          auger_cores = 'Internal core volume of an auger core',
          imaged_volume = '3D scan for volume of soil clod')),
      mass = list(
        description = 'Flags inclusion of coarse fraction in bulk density value',
        control_vocabulary = list(
          includes_coarse_fraction = 'Coarse fraction is include in mass',
          excludes_coarse_fraction = 'Coarse fraction is excluded in mass'))),
    other_suggested_terms = list(
      coarse_fraction = 'Coarse fraction is required to correctly calculate soil elemental stocks (for example kg-C per m2) using bulk density and is strongly encouraged to be reported if bulk density is recorded.')))
                          
  return(bulk_density.ls)
}