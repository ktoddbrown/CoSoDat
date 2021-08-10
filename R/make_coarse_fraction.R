#' Coarse fraction
#' 
#' Make the course fraction data model.
#'
#' @return a list
#' @export
#'
#' @examples
make_coarse_fraction <- function(){
  coarse_fraction <- list(
    course_fraction = list(
      value = list(
        description = 'Coarse fraction', 
        range = list(min = 0, max = 1)),
      unit = list(
        description = 'Coarse fraction unit', 
        control_vocabulary = list(
          mass_per_mass = 'ratio of coarse fraction mass to whole soil mass [common]', 
          volume_per_volume = 'ratio of coarse fraction volume to whole soil volume [rare]')
        ),
      method = list(
        description = 'Coarse fraction separation methods', 
        control_vocabulary = list(
          sieve_2mm = ' >2mm sieve size [common]', 
          hand_picked = 'hand picked large partices (ex roots, and rocks), generally peats [rare]')
        )
      )
    )
  return(coarse_fraction)
}