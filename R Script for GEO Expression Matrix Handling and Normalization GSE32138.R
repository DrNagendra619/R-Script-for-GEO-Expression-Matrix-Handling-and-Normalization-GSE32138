# 1 – Setup and Libraries
# Install BiocManager if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Install required packages
BiocManager::install("GEOquery")
BiocManager::install("Biobase")
BiocManager::install("limma")

# Load libraries
library(GEOquery)
library(Biobase)
library(limma)
library(ggplot2)

# Set GEO Series ID explicitly
GSE32138_id <- "GSE32138"

# Download GEO dataset (Series Matrix file)
GSE32138_gse <- getGEO(GSE32138_id, GSEMatrix = TRUE)


#2 – Extract Expression Matrix and Metadata
# Extract expression matrix
GSE32138_expr <- exprs(GSE32138_gse[[1]])

# Extract metadata
GSE32138_metadata <- pData(GSE32138_gse[[1]])

# Save raw expression matrix and metadata
write.csv(GSE32138_expr, file = paste0(GSE32138_id, "_expression_matrix.csv"))
write.csv(GSE32138_metadata, file = paste0(GSE32138_id, "_metadata.csv"))


# 3 – QC Plot Before Normalization
# Boxplot of raw expression values (log2 transformed)
png(file = paste0(GSE32138_id, "_boxplot_raw.png"), width = 1600, height = 900)
boxplot(log2(GSE32138_expr + 1),
        main = paste0(GSE32138_id, " Raw Expression (log2)"),
        xlab = paste0(GSE32138_id, " Samples"),
        ylab = paste0(GSE32138_id, " log2(intensity + 1)"),
        las = 2, outline = FALSE)
dev.off()


# 4 – Quantile Normalization
# Apply quantile normalization on log2-transformed data
GSE32138_expr_norm <- normalizeBetweenArrays(log2(GSE32138_expr + 1), method = "quantile")

# Boxplot after quantile normalization
png(file = paste0(GSE32138_id, "_boxplot_quantile_normalized.png"), width = 1600, height = 900)
boxplot(GSE32138_expr_norm,
        main = paste0(GSE32138_id, " Quantile Normalized (log2)"),
        xlab = paste0(GSE32138_id, " Samples"),
        ylab = paste0(GSE32138_id, " log2(intensity) quantile-normalized"),
        las = 2, outline = FALSE)
dev.off()

# Save normalized matrix
write.csv(GSE32138_expr_norm, file = paste0(GSE32138_id, "_log2_quantile_normalized.csv"))


# 5 – Completion Message
cat("Processing complete for ", GSE32138_id, "\n")
cat("Expression matrix: ", GSE32138_id, "_expression_matrix.csv\n", sep = "")
cat("Metadata: ", GSE32138_id, "_metadata.csv\n", sep = "")
cat("Boxplots: ", GSE32138_id, "_boxplot_raw.png, ", GSE32138_id, "_boxplot_quantile_normalized.png\n", sep = "")
cat("Normalized matrix: ", GSE32138_id, "_log2_quantile_normalized.csv\n", sep = "")

# End of Script GSE32138