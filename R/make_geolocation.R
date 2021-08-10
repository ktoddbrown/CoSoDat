#' Make geolocation
#' 
#' Geolocation of soil sample include latitude, lognitude, observation time, and depth.
#' Included in here is the precision of the latitude and longitude as well as any location maskes that were applied.
#' Depth notes both zero reference and how layers were defined.
#'
#' @return a list
#' @export
#'
#' @examples
make_geolocation <- function(){
  
  geolocation <- list(geolocation = list(
    latitude = list(value = 'latitude',
                    units = list(dec_deg = 'decimal degrees', 
                                 deg_min_sec = 'degree minute seconds')),
    longitude = list(value = 'latitude',
                     units = list(dec_deg = 'decimal degrees', 
                                  deg_min_sec = 'degree minute seconds')),
    datum = 'text', #TODO figure out standard to cite here
    horizontal_precision = list(centimeter = 'centimeter level precision, common on survey-quality location points',
                     meter = 'meter level precision, common on post-sampling map referencing',
                     kilometer = 'km level precision, common on county centriod or certain masking algorithms',
                     megameter = '1 000 km level precision, width of Texas and half the width of the USA',
                     gigameter = '1 000 000 km level precision, somewhere on Earth (circumference 40 075 km)'),
    horizontal_masking = list(none = 'no masking was applied to locations',
                   shuffle = 'some proportion of the locations were randomly reassigned to preserve privacy, precision reflects bounded area of all samples in pool',
                   fuzzed = 'locations were assigned a random ammount of fuzzing to mask exact location, precision reflects ~3 standard deviations'),
    time = list(description = 'field collection or observation time, record only down to precision',
                year = 'YYYY Common Era',
                month = 'MM two digit month',
                day = 'DD two digit day',
                hour = 'HH two digit hour on 24 hr clock',
                minute = 'MM two digit minute (uncommon except for flux measurements)',
                second = 'SS.S* second digit (uncommon except for flux)',
                timezone = 'N hours before or after UTC'),
    depth = list(top = 'depth to top layer',
                 bottom  = 'depth to bottom layer',
                 zero_reference = list(soil_surface = '0 refered to as soil surface, down is positive',
                                       mineral_organic = '0 refers to mineral-organic interface, down is positive'),
                 unit = list(cm = 'centimeter',
                             dm = 'decimeter',
                             m = 'meter'),
                 layer_definition = list(horizon = 'layer depth determined by soil horizon or other geo feature',
                                         regular = 'layer depth determined by regular length interval'))
  ))
  
  return(geolocation)
}