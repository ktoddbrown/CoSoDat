#' Soil fraction description
#'
#' Specification for different soil fraction methods. 
#' Taken from [ISRaD](https://soilradiocarbon.org/) proposed soil fractionation descriptions.
#'
#' @return
#' @export
#'
#' @examples
make_soil_fraction <- function(){
  size_bounds.ls <- list(upper = list(
    description = 'upper bound sieve size of soil fraction',
    value = list(min = 0, max = Inf),
    unit = list('mm' = 'mesh size in millimeter [common]',
                'mesh_number' = 'openings per inch [US]')
  ),
  lower = list(
    description = 'lower bound sieve size of soil fraction',
    value = list(min = 0, max = Inf),
    unit = list('mm' = 'mesh size in millimeter [common]',
                'mesh_number' = 'openings per inch [US]')
  ))
  
  ans <- list(soil_fraction =
                list(
                  description = 'soil fractionation or subsampling method',
                  scheme = list(
                    partical_size = list(
                      description = 'soil sample fractionated by size',
                      method = list('dry' ='sieved dry [common]',
                                    'wet' = 'sieved wet, 100% saturation'),
                      fraction = list(
                        gravel = list(description = 'fraction of sand',
                                      bound = list(USDA_texture_class = 
                                                     list(upper = list(value = Inf, unit = 'mm'),
                                                          lower = list(value = 2, unit = 'mm')),
                                                   other = size_bounds.ls)),
                        sand = list(description = 'fraction of sand',
                                    bound = list(USDA_texture_class = 
                                                   list(upper = list(value = 2, unit = 'mm'),
                                                        lower = list(value =0.02, unit = 'mm')),
                                                 other = size_bounds.ls)),
                        silt = list(description = 'fraction of silt',
                                    bound = list(USDA_texture_class = 
                                                   list(upper = list(value =0.02, unit = 'mm'),
                                                        lower = list(value =0.002, unit = 'mm')),
                                                 other = size_bounds.ls)), #fill in simiarl to sand
                        clay = list(description = 'fraction of clay',
                                    bound = list(USDA_texture_class = 
                                                   list(upper = list(value = 0.002, unit = 'mm'),
                                                        lower = list(value =-Inf, unit = 'mm')),
                                                 other = size_bounds.ls)), #fill in simiarl to sand
                        silt_clay = list(description = 'fraction of silt and clay',
                                         bound = list(USDA_texture_class = 
                                                        list(upper = list(value = 0.02, unit = 'mm'),
                                                             lower = list(value =-Inf, unit = 'mm')),
                                                      other = size_bounds.ls)) #fill in simiarl to sand
                      )
                    ),
                    density_extraction = list(
                      description = 'soil sample fractionated by density',
                      fraction = list('light' = 'subset of sample that is light or less dense',
                                      'supernatant' = 'suspended solution',
                                      'percipitate' = 'subset of sample that is heavy or more dense'),
                      method = list(solution = list('water', 'soidium polytungstate', 'sodium iodite'),
                                    aggitation = list('none'= 'without aggitation',
                                                      sonication = 'with sonication',
                                                      centrifuge = 'with centrifuge'))
                      ),
                    aggregate = list(description = 
                                       'soil sample fractionated by non-standard size',
                                     method = list('dry' ='sieved dry [common]',
                                                   'wet' = 'sieved wet, 100% water saturation',
                                                   'hexametaphosphate'  = 'sieved wet in hexametaphosphate'),
                                     fraction = list(
                                       microaggregate = list(description = 'small agregate size class',
                                                             bound = size_bounds.ls)),
                                     macroaggregate = list(), #fill in similar
                                     silt_clay = list() #fill in similar
                    ),
                    biological = list( #note to self, not happy with this one
                      description = 'extract of biological components',
                      method = list(manual = 'seperation by manual process',
                                    PLFA = 'quantification by PLFA excraction'),
                      fraction = list(macrofossil = 'excraction of macrofossil',
                                      residual = '',
                                      roots = '', 
                                      microbes = '',
                                      microbial_residuals = '',
                                      PLFA = '')
                    ),
                    chemical = list(
                      description = 'chemical extraction',
                      method = list('pyrogenic C' = '', #add description of method options
                                    'humic acid'= '', #add description of method options
                                    'fulvic acid'= '', #add description of method options
                                    'humin'= '', #add description of method options
                                    other = list(component = c('solute', 'parcipatate'),
                                                 solution = c('hydrochloric acid',
                                                              'hydrofloric acid',
                                                              'sodium hydroxide',
                                                              'sodium pyrophosphate',
                                                              'hydroxylamine',
                                                              'dithinonite',
                                                              'acid-base-acid',
                                                              'ammonium oxalate',
                                                              'water',
                                                              'hydrogen peroxide',
                                                              'chromic acid',
                                                              'humic/fulvic/humin',
                                                              'photo-oxidation')))
                    )
                  )#end scheme
                )#end soil fraction
  ) #end ans
  
  return(ans)
  
}