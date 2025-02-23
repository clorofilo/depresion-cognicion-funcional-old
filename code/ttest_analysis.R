# Script de análisis de pruebas t independientes
# Autor: Joan
# Fecha: 2024
# Descripción: Este script realiza pruebas t para muestras independientes
# utilizando el paquete jmv en R.

# Instalar y cargar paquetes necesarios
if (!requireNamespace("jmv", quietly = TRUE)) install.packages("jmv")
library(jmv)

# Definir las fórmulas de las pruebas t
prueba_cognition <- jmv::ttestIS(
    formula = cognition ~ sex,
    data = data, # NOTA: Sustituir con el dataset real
    vars = cognition,
    hypothesis = "oneGreater",
    ci = TRUE,
    effectSize = TRUE,
    ciES = TRUE,
    desc = TRUE
)

prueba_physFunct <- jmv::ttestIS(
    formula = physFunct ~ sex,
    data = data, # NOTA: Sustituir con el dataset real
    vars = physFunct,
    students = FALSE,
    welchs = TRUE,
    hypothesis = "twoGreater",
    ci = TRUE,
    effectSize = TRUE,
    desc = TRUE,
    duplicate = 4
)

# Guardar resultados en archivos CSV para análisis posterior
write.csv(prueba_cognition$ttest, file="../results/prueba_cognition.csv", row.names=FALSE)
write.csv(prueba_physFunct$ttest, file="../results/prueba_physFunct.csv", row.names=FALSE)

# Mensaje de finalización
cat("Análisis de pruebas t completado. Resultados guardados en la carpeta results/\n")
