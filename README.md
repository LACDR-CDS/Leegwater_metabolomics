[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.24038153.svg)](https://doi.org/10.5281/zenodo.24038153)

# Metabolomics in breast cancer cell lines

This repository contains code to analyze data and generate figures for the following manuscript:

```         
Multi-omics characterization of breast cancer metabolism identifies new metabolic targets
Hanneke Leegwater, Xiaobing Zhang, Luojiao Huang, Christine Hoegen, Xuesong Wang, Agnieszka B. Wegrzyn, Thomas Hankemeier, Bob van de Water, Erik Danen, Annelien J. M. Zweemer, Amy C. Harms, Sylvia E. Le Dévédec
bioRxiv 2026.03.06.710028; doi: https://doi.org/10.64898/2026.03.06.710028
```

## Usage

Within the `code` folder, you will find Quarto files and a `functions` folder. 
The Quarto files can be used to rerun all code and to create all figures. 
Functions that one might want to reuse can be found in the functions folder.

### Data

Data to rerun the analysis is in the `data`, or described in th .gitignore file if it is external data that we downloaded from somewhere.
Let us know if anything is missing. 

### Installation

1.  Download/clone this repository
2.  Open the project file (`.Rproj`) in RStudio
3.  Open `code/figure1_calculations.qmd` and choose *Run* \> *Run All*.
4.  Open `code/figure1.Rmd` and choose *Run* \> *Run All*. Figures will appear in the specified `output_dir` folder.
5.  Repeat for figures 2, 3, and 4.

## Acknowledgments

This repository is largely based on one of our previous studies, available at: https://github.com/lacdr-tox/Leegwater_lipidomics_normalization
