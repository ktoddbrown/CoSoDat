make_organic_carbon_fraction <- function(){
  organic_carbon_fraction <- list(value = list(description = 'Organic carbon fraction - mass ratio between organic carbon and total dry fine soil weight',
                                               range = list(min=0, max=1)),
                                  unit = list(description = 'Organic carbon fraction unit', 
                                              control_vocabulary = list(mass_per_mass = 'ratio of organic carbon mass to dry fine soil mass', 
                                                                        mass_percent = 'percent of dry fine soil that is organic carbon')),
                                  method = list(WalkleyBlack = "Walkley-Black titration method",
                                                loss_on_ignition = list(description = "Loss on ignition - mass ratio between ash and dry soil weight",
                                                                        range = list(min=0, max=1),
                                                                        conversion_factor = list(description = 'conversion factor between loss on ignition and organic carbon fraction',
                                                                                                 range = list(min=0, max=1)),
                                                                        oven_temperature = list(descrition = 'temperature of oven for combustion',
                                                                                                unit = 'degrees C',
                                                                                                range = list(min = 0, max = Inf)),
                                                                        oven_time = list(descrition = 'time in oven for combustion',
                                                                                         unit = 'hours',
                                                                                         range = list(min = 0, max = 100)))))
  
}