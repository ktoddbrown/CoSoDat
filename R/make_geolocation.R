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
    horizontal_precision = list(
      control_vocabulary = list(
        centimeter = 'centimeter level precision, common on survey-quality location points',
        meter = 'meter level precision, common on post-sampling map referencing',
        kilometer = 'km level precision, common on county centriod or certain masking algorithms',
        megameter = '1 000 km level precision, width of Texas and half the width of the USA',
        gigameter = '1 000 000 km level precision, somewhere on Earth (circumference 40 075 km)')),
    horizontal_masking = list(
      value = 'Where corrections applied to the recorded latitude longitude to mask the location? Often done to address data privacy concerns',
      control_vocabulary = list(
        none = 'no masking was applied to locations',
        shuffle = 'some proportion of the locations were randomly reassigned to preserve privacy, precision reflects bounded area of all samples in pool',
        fuzzed = 'locations were assigned a random ammount of fuzzing to mask exact location, precision reflects ~3 standard deviations')),
    time = list(description = 'field collection or observation time, record only down to precision, breakdown of ISO 8601 YYYY MM DD HH:MM:SS.SS+00:00',
                year = 'YYYY Common Era',
                month = 'MM two digit month',
                day = 'DD two digit day',
                hour = 'HH two digit hour on 24 hr clock',
                minute = 'MM two digit minute (uncommon except for flux measurements)',
                second = 'SS.S* second digit (uncommon except for flux)',
                timezone = 'N hours before or after UTC'),
    depth = list(top = list(value = 'depth to top layer, common'),
                 center = list(value = 'depth to center of layer, [discouraged, top/bottom would need to be calculated from sequencial centers]'),
                 thickness = list(value = 'thickness of the layer, [discouraged, redundent if top/bottom recorded]')
                 bottom  = list(value = 'depth to bottom layer, common'),
                 zero_reference = list(value = 'where is 0 in the soil column, down is positive',
                                       control_vocabulary = list(soil_surface = '0 refered to as soil surface, down is positive',
                                                                 mineral_organic = '0 refers to mineral-organic interface, down is positive')),
                 unit = '[length], general on the order of centimeter to meter',
                 layer_definition = list(value = 'how layers are defined',
                                         control_vocabulary = list(by_horizon = 'layer depth determined by soil horizon or other geo feature',
                                                                   by_length = 'layer depth determined by regular length interval')))
  ))
  
  return(geolocation)
}