# Community soil data (CoSoDat)

This project aims to develop a soil vocabulary to represent experimental research data.


# Project layout

Currently vocabularies are represented as a R list and designed to describe soil data in enough detail to be able to design a data harmonization project.

# Basic patterns

## Data point tuple
Terms are generally associated with a value-unit-method tupple that identify the expected range of the term across all possible units, common units, and a method description of _common methodologies_ that might _drive different interpretation_ of the data points.
Most methods are keyed lists with exclusive definitions grouped under the same category (`control_vocabulary`).
Ranges are provided when numerical values can be constraind (generally as 0-Inf or 0-1)
Bulk density below is given as an example.

```
bulk_density:
  value:
    description: Bulk density - dry soil to volume ratio, specify inclusion of coarse
      fraction in data
    range:
      min: 0.0
      max: .inf
  units:
    description: Bulk density unit [mass per volume]
    control_vocabulary:
      g_per_cm3: grams per centimeter cubed
      kg_per_m3: killograms per meter cubed
  method:
    volume:
      description: Bulk density volume method
      control_vocabulary:
        geometric_volume: Volume by extracted slice or core geometry.
        compliant_cavity: Fill hole with material of known density
        clod: Volume by displacement of soil mass.
        auger_cores: Internal core volume of an auger core
        imaged_volume: 3D scan for volume of soil clod
    mass:
      description: Flags inclusion of coarse fraction in bulk density value
      control_vocabulary:
        includes_coarse_fraction: Coarse fraction is include in mass
        excludes_coarse_fraction: Coarse fraction is excluded in mass
```

## Functional method

Some methods are functional relationships that generate derived values, often called pedotransfer functions in soil science.
These functions are assigned names and are represented as a list of description-input-parameter-r_function tupples.
  - `inputs` point to other defined terms.
  - `parameter` list of parameters needed to be specified to make the calculation.
  - `r_function` is code that should evaluate in R with a list called `parameter` and declared inputs.

An example is taken from organic carbon fraction below

```
organic_carbon_fraction:
  [[truncated]]
  method:
    [[truncated]]
    pedotransfer_loi:
      parameter:
        conversion_factor:
          description: conversion factor between loss on ignition and organic carbon
            fraction
          range:
            min: 0.0
            max: 1.0
      input:
        loss_on_ignition: [[truncated to remove loi details]]
      r_function: loss_on_ignition * parameter$conversion_factor
```

# Current status

We currently have vocabulary designed to describe soil data sources, bulk density, and coarse fraction.

Data sources are identified in `data/data_sources.tsv` with prioritization given (but not exclusive) to data reporting soil bulk density located in the global south.
These data sources were used to check the bulk density description design and will be used to prototype a data integration and annotation workflow in the future.

# Under development

The data models below are actively under development.
They have been drafted and are waiting for feedback.

  1) organic carbon fraction - 2021 Aug 10
  2) soil sample location - 2021 Aug 10
      - georeference (lat, long, datum, precision)
      - collection time (year, month, day, hour, minute, timezone)
      - layer depth (top, bottom, zero-reference)

# Future plan

We need to develop integration with a data harmonization workflow.

Future vocabularies:
  3) physiochemical fractionation
  4) sampling strategy and design
  5) CO2/CH2 flux
  6) nitrogen
  7) phosphorus
  8) case/control treatment
      - lab incubation (temperature & moisture)
      - field warming experiment
      - rainout experiment
  9) microbial biomass
      - fumigation
      - substrate enrichment
  10) isotope quantification

After we have tested the vocabularies across several data sets, we plan to spin off a soil ontology January 2022.

# Direct outputs

K Todd-Brown, P Areeveso, J Atkins, A Brown, J Loisel, M O'Brien, K Patel, D Sihi. Tools from data-centered community of practice in soils, AGU Fall Meeting, Dec 2021
