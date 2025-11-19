# R-Script-for-GEO-Expression-Matrix-Handling-and-Normalization-GSE32138
R Script for GEO Expression Matrix Handling and Normalization GSE32138
# 📊 Microarray Data Preprocessing Pipeline (GSE32138)

This R script automates the fundamental steps for preparing microarray gene expression data from the **Gene Expression Omnibus (GEO)** for downstream analysis. The pipeline fetches the specified dataset (**GSE32138**), performs essential quality control (QC) checks, applies **quantile normalization**, and exports both the raw and processed data along with the metadata.

## 🚀 Key Features

* **Automated Data Retrieval:** Fetches the expression matrix and metadata directly from the **GEO database (GSE32138)** using `GEOquery`.
* **Quantile Normalization:** Applies **quantile normalization** (`limma::normalizeBetweenArrays`) to the $\log_2$-transformed intensity values to correct for technical variation and ensure comparable gene distributions across all samples.
* **Quality Control (QC) Visualization:** Generates **boxplots** before and after normalization to visually confirm data distribution consistency.
* **Data Persistence:** Exports the raw expression matrix, normalized expression matrix, and full metadata table as separate CSV files.

---

## 🔬 Analysis Overview

| Component | Method / Tool | Purpose |
| :--- | :--- | :--- |
| **Dataset** | GSE32138 | Target GEO accession ID (can be easily modified). |
| **Data Fetching** | `GEOquery` | Downloads the data directly into the R environment. |
| **Normalization** | Quantile Normalization | Standardizes the empirical distribution of gene expression intensity across all arrays/samples. |
| **QC Check** | Dual Boxplots | Visual assessment of expression distribution symmetry and the effectiveness of normalization. |

---

## 🛠️ Prerequisites and Setup

### 📦 Packages

The script automatically installs and loads the necessary Bioconductor and CRAN packages:
* `GEOquery` (For data retrieval)
* `Biobase` (For handling the ExpressionSet object)
* `limma` (For quantile normalization)
* `ggplot2` (Used for generating the plots)

### ⚙️ Execution

1.  **Download** the `R Script for GEO Expression Matrix Handling and Normalization GSE32138.R` file.
2.  **Execute** the script in your R environment:
    ```R
    source("R Script for GEO Expression Matrix Handling and Normalization GSE32138.R")
    ```
    *Note: All output files are saved to the current working directory where the script is executed.*

---

## 📁 Output Files (2 Plots + 3 CSV Files)

| Filename | Type | Description |
| :--- | :--- | :--- |
| `GSE32138_expression_matrix.csv` | CSV | **Raw** (un-normalized) expression data matrix. |
| `GSE32138_metadata.csv` | CSV | Full metadata (phenotype data) for all samples in the dataset. |
| `GSE32138_log2_quantile_normalized.csv` | CSV | $\log_2$-transformed expression matrix after **Quantile Normalization**, ready for DGE analysis. |
| `GSE32138_boxplot_raw.png` | QC | Boxplot illustrating raw, $\log_2$-transformed data distributions. |
| `GSE32138_boxplot_quantile_normalized.png` | QC | Boxplot confirming uniform data distributions after normalization. |
