# Script de análisis de Modelos Mixtos Lineales (LMM)
# Autor: Joan
# Fecha: 2024
# Descripción: Este script realiza análisis de Modelos Mixtos Lineales
# utilizando el paquete gamlj en R.

# Instalar y cargar paquetes necesarios
if (!requireNamespace("gamlj", quietly = TRUE)) install.packages("gamlj")
library(gamlj)

# Definir modelos mixtos lineales
modelo_lmm_cognition <- gamlj::gamljMixed(
    formula = cognition ~ depTrj + ybirth + age + (1 | country) + (1 | ID),
    data = data,  # NOTA: Sustituir con el dataset real
    comparison = TRUE,
    estimates_ci = TRUE,
    re_ci = TRUE
)

modelo_lmm_depTrj <- gamlj::gamljMixed(
    formula = depTrj ~ ybirth + age + (1 | country) + (1 | ID),
    data = data,
    comparison = TRUE,
    estimates_ci = TRUE,
    re_ci = TRUE
)

modelo_lmm_funTrj <- gamlj::gamljMixed(
    formula = funTrj ~ cognition + depTrj + ybirth + age + (1 | country) + (1 | ID),
    data = data,
    comparison = TRUE,
    estimates_ci = TRUE,
    re_ci = TRUE
)

# Guardar resultados en archivos CSV para análisis posterior
write.csv(modelo_lmm_cognition$fixed, file="../results/lmm_cognition.csv", row.names=FALSE)
write.csv(modelo_lmm_depTrj$fixed, file="../results/lmm_depTrj.csv", row.names=FALSE)
write.csv(modelo_lmm_funTrj$fixed, file="../results/lmm_funTrj.csv", row.names=FALSE)

# Mensaje de finalización
cat("Análisis de Modelos Mixtos Lineales completado. Resultados guardados en la carpeta results/\n")
