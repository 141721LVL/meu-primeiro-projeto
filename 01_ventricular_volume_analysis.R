# ==============================================================================
# PROJECT: Brain Study Platform
# FILE: 01_ventricular_volume_analysis.R
# DESCRIPTION: Automated Pipeline for Ventricular Volume Analysis and Clinical Evidence
# LICENSE: MIT License
# AUTHOR: Brain Study Initiative
# MISSION: Scientific Evidence, Medical Excellence. Open-Source Tools for All.
# ==============================================================================

# 🇧🇷 PORTUGUÊS: Este script automatiza a análise estatística de dados volumétricos 
# extraídos via 3D Slicer, gerando gráficos de alta qualidade para publicações.
# 🇺🇸 ENGLISH: This script automates the statistical analysis of volumetric data 
# extracted via 3D Slicer, generating high-quality plots for international publications.

# ------------------------------------------------------------------------------
# 1. ENVIRONMENT SETUP & DEPENDENCIES
# ------------------------------------------------------------------------------
# Check and install tidyverse/ggplot2 if not already present
if(!require(ggplot2)) install.packages("ggplot2", repos = "http://cran.us.r-project.org")
library(ggplot2)

# ------------------------------------------------------------------------------
# 2. DATA ACQUISITION & SIMULATION (Evidence-Based Medicine Database)
# ------------------------------------------------------------------------------
# Simulated clinical trial: Lateral Ventricle Volumes (mm3) vs. Neurological Symptom Score
# Database reflects raw data extracted by students using the 3D Slicer Segment Editor.

brain_data <- data.frame(
  Patient_ID = paste0("BS_ID_", 1:12),
  Ventricular_Volume_mm3 = c(12100, 12850, 31200, 11900, 13400, 29800, 
                             12250, 12600, 34100, 12050, 13100, 28900),
  Symptom_Severity_Score = c(8, 14, 79, 5, 18, 85, 11, 7, 92, 10, 16, 74),
  Clinical_Status = c("Control", "Control", "Pathological", "Control", "Control", "Pathological",
                      "Control", "Control", "Pathological", "Control", "Control", "Pathological")
)

cat("--- BRAIN STUDY DATASET LOADED SUCCESSFULY ---\n")
print(brain_data)

# ------------------------------------------------------------------------------
# 3. BIOMECHANICAL & STATISTICAL ANALYSIS (Rigor & Methodology)
# ------------------------------------------------------------------------------
# Pearson correlation coefficient to prove clinical hypothesis
correlation_result <- cor.test(brain_data$Ventricular_Volume_mm3, brain_data$Symptom_Severity_Score)

cat("\n--- STATISTICAL EVIDENCE REPORT ---\n")
cat("Pearson Correlation Coefficient (r):", round(correlation_result$estimate, 4), "\n")
cat("P-value:", format.pval(correlation_result$p.value, digits = 4), "\n")

# ------------------------------------------------------------------------------
# 4. HIGH-IMPACT VISUALIZATION FOR INTERNATIONAL CONGRESS (ggplot2)
# ------------------------------------------------------------------------------
# Professional, publication-ready scatter plot aligned with Mayo Clinic standards

brain_plot <- ggplot(brain_data, aes(x = Ventricular_Volume_mm3, y = Symptom_Severity_Score)) +
  geom_smooth(method = "lm", se = TRUE, color = "#d9534f", fill = "#f9f2f2", lwd = 1.2) +
  geom_point(aes(color = Clinical_Status), size = 4, alpha = 0.8) +
  scale_color_manual(values = c("Control" = "#2c3e50", "Pathological" = "#e74c3c")) +
  labs(
    title = "Clinical Evidence: Ventricular Volume vs. Symptom Severity",
    subtitle = "Quantitative Analysis Pipeline - Brain Study Global Initiative",
    x = "Lateral Ventricle Volume (mm³)",
    y = "Neurological Symptom Score (0 - 100)",
    color = "Clinical Cohort"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", color = "#1a1a1a", size = 15),
    plot.subtitle = element_text(face = "italic", color = "#555555", size = 11),
    axis.title = element_text(face = "bold"),
    legend.position = "bottom",
    panel.grid.major = element_line(color = "#ebebeb"),
    panel.grid.minor = element_blank()
  )

# Display the plot
print(brain_plot)

# To save the plot for your abstract submission:
 ggsave("brain_study_evidence_plot.png", plot = brain_plot, width = 8, height = 6, dpi = 300)
 ggsave("brain_study_evidence_plot.png", plot = brain_plot, width = 8, height = 6, dpi = 300)
