# Community soil data (CoSoDat)

This project aims to develop a soil vocabulary to represent experimental research data.


# Project layout

Currently vocabularies are represented as a R list and designed to describe soil data in enough detail to be able to design a data harmonization project.

# Current status

We currently have vocabulary designed to describe soil data sources and bulk density with coarse fraction.

Data sources are identified in `data/data_sources.tsv` with prioritization given (but not exclusive) to data reporting soil bulk density located in the global south.
These data sources were used to check the bulk density description design and will be used to prototype a data integration and annotation workflow in the future.

# Future plan

We need to develop integration with a data harmonization workflow.

Future vocabularies:
  1) organic carbon fraction
  2) soil sample location
      - georeference (lat, long, datum)
      - collection time (year, month, day, hour, minute, timezone)
      - layer depth (top, bottom, zero-reference)
      - physiochemical fractionation
  3) sampling strategy and design
  4) CO2/CH2 flux
  5) nitrogen
  6) phosphorus
  7) case/control treatment
    - lab incubation (temperature & moisture)
    - field warming experiment
    - rainout experiment
  8) microbial biomass
    - fumigation
    - substrate enrichment
  9) isotope quantification

After we have tested the vocabularies across several data sets, we plan to spin off a soil ontology January 2022.

# Direct outputs

K Todd-Brown, P Areeveso, J Atkins, A Brown, J Loisel, M O'Brien, K Patel, D Sihi. Tools from data-centered community of practice in soils, AGU Fall Meeting, Dec 2021