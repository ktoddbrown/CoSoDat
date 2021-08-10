#' Make loss on ignition
#'
#'
#' @return
#' @export
#'
#' @examples
make_loss_on_ignition <- function(){
  loss_on_ignition <- list(loss_on_igintion = list(
    value = list(
      description = "Loss on ignition - mass ratio between ash and dry soil weight",
      range = list(min=0, max=1)
      ),
    unit = list(mass_per_mass = 'ratio of mass lost during combustion to pre-combustion dry mass'),
      method = list(
        oven_temperature = list(descrition = 'temperature of oven for combustion',
                                unit = 'degrees C',
                                range = list(min = 0, max = Inf)),
        oven_time = list(descrition = 'time in oven for combustion',
                         unit = 'hours',
                         range = list(min = 0, max = 100)))
    ))
  return(loss_on_ignition)
}