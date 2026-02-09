# CRMC
A comprehensive ruminant microbial catalog (CRMC) reveals convergent selection for key vitamin-synthesizing pathways and genes across ruminants and human

## Background: 
The ruminant gastrointestinal tract serves as a natural microbial reservoir in which vitamin-synthesizing microbes play key integrated roles in digestion, nutrient absorption, and metabolic balance; however, studies systematically elucidating their functional characteristics and ecological roles remain limited due to the lack of a large-scale reference genome catalog for ruminant gastrointestinal vitamin-synthesizing microbes. Here, based on 2,325 metagenomic samples from 8 ruminant hosts, we comprehensively reconstructed and analyzed the ruminant gastrointestinal tract microbiome and the distribution patterns of vitamin-synthesizing microbes.
## Results: 
We reconstructed a unified ruminant gastrointestinal microbiome catalog (CRMC) with 39,696 MAGs, achieving the highest mapping rate (~83.45%) among 2,325 metagenomic datasets, surpassing GTDB, RGMGC, and other catalogs. Across the 8 ruminant hosts, we identified a total of 17,349 vitamin-synthesizing microbes spanning 9 biosynthetic pathways (thiamine, riboflavin, niacin, pantothenate, pyridoxine, biotin, folate, cobalamin, and menaquinone). These microbes exhibited unified pathway selection patterns consistent with those in the human gut microbiome. Furthermore, within the major vitamin-synthesizing pathways commonly selected across ruminants, vitamin-synthesizing microbes displayed concentrated co-selection of specific functional gene nodes, revealing that despite taxonomic differences among gastrointestinal vitamin-synthesizing communities, they share highly convergent pathway preferences and common node-level selection patterns.
## Conclusions: 
Together, by reconstructing the ruminant gastrointestinal tract microbiome reference genome catalog (CRMC), we elucidated the core microbial taxa and their functional features across ruminants, as well as the pathway preferences and distribution patterns of vitamin-synthesizing microbes. These findings provide an effective reference for advancing ruminant gastrointestinal tract microbiome research, offering gene co-selection insights for microbial synthetic biology design, and guiding microbiome-based interventions in ruminant systems.

## Keywords: 
Ruminant, gastrointestinal tract, microbiome, metagenome-assembled genomes, vitamin-synthesizing, cross-species comparison

## 🧬 Pipeline and Data Availability

This repository contains the scripts used for the analysis of ruminant metagenomic data. The workflow is divided into specific steps (01-15) covering quality control, assembly, annotation, and quantification.

### 1. Data Source
The raw data utilized in this study originates from **21 NCBI projects**, comprising a total of **2,325 ruminant metagenomic samples**. 
> **Note:** Detailed sample and project information can be found in **Table S1** of the supplementary file: `Feng_etal_Ruminant_CRMC_vitamin_Supplement_Table`.

### 2. Workflow Description
The analysis pipeline consists of the following modules:

#### A. Pre-processing and Assembly (Steps 01-05)
Each metagenomic sequencing sample was processed **independently** through the following steps:
* **Step 01:** Quality Control (QC) of raw reads.
* **Step 02:** Host genome removal to ensure microbial purity.
* **Step 03:** Metagenomic assembly.
* **Step 04:** Binning.
* **Step 05:** Quality control of the obtained bins.

#### B. Construction of Non-redundant Catalog (Step 06)
* **Step 06:** The high-quality bins identified in the previous steps were dereplicated to construct the Combined Ruminant Microbial Collection (CRMC).

#### C. Functional and Taxonomic Annotation (Steps 07-12)
The CRMC, along with **8 ruminant gastrointestinal microbial reference genome catalogs**, were annotated using the following pipeline:
* **Step 07:** Taxonomic annotation.
* **Step 08:** Gene prediction and annotation.
* **Step 09:** COG (Clusters of Orthologous Groups) functional annotation.
* **Step 10:** Enzyme function annotation.
* **Step 11 & 12:** rRNA and tRNA annotation, respectively.

#### D. Comparative Analysis and Quantification (Steps 13-15)
* **Step 13:** Average Nucleotide Identity (ANI) analysis was performed to compare similarities between Metagenome-Assembled Genomes (MAGs).
* **Step 14:** Clean reads from different datasets were mapped to the reference genomes to calculate the **mapping rate**.
* **Step 15:** Calculation of relative abundances.

### 3. Output Data
All intermediate and final data generated for the analysis in this study are compiled and available in the supplementary file: **`Feng_etal_Ruminant_CRMC_vitamin_Supplement_Table`**.
