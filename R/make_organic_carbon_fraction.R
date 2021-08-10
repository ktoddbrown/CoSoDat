#' Make organic carbon fraction
#' 
#' Make the data model for organic carbon fraction.
#' Relies on the loss on ignition data model.
#'
#' @return a list
#' @export
#'
#' @examples
#' 
make_organic_carbon_fraction <- function(){
  organic_carbon_fraction <- list(
    organic_carbon_fraction = list(
      value = list(
        description = 'Organic carbon fraction - mass ratio between organic carbon and total dry fine soil weight',
        range = list(min=0, max=1)),
      unit = list(
        description = 'Organic carbon fraction unit', 
        control_vocabulary = list(
          mass_per_mass = 'ratio of organic carbon mass to dry fine soil mass', 
          mass_percent = 'percent of dry fine soil that is organic carbon')),
      method = list(WalkleyBlack = "Walkley-Black titration method",
                    pedotransfer_loi = list(
                      parameter = list(
                        conversion_factor = list(
                          description = 'conversion factor between loss on ignition and organic carbon fraction',
                          range = list(min=0, max=1))
                      ),
                      input = list(loss_on_ignition = make_loss_on_ignition()),
                      r_function = 'loss_on_ignition * parameter$conversion_factor'
                    )
      )
    )
  )
  return(organic_carbon_fraction)
}