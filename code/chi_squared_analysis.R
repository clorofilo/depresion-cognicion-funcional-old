# Script de análisis de prueba de Chi-cuadrado
# Autor: [Joan]
# Fecha: [2024]
# Descripción: Este script realiza análisis de tablas de contingencia con la prueba de Chi-cuadrado
# utilizando el paquete jmv en R.

# Instalar y cargar paquetes necesarios
if (!requireNamespace("jmv", quietly = TRUE)) install.packages("jmv")
library(jmv)

# Definir el análisis de Chi-cuadrado para depTrj con todas las variables
prueba_chi2_depTrj <- jmv::contTables(
    formula = depTrj ~ .,  # depTrj con todas las demás variables
    data = data,  # NOTA: Sustituir con el dataset real
    contCoef = TRUE,
    phiCra = TRUE
)

# Definir el análisis de Chi-cuadrado para cogTrj con todas las variables
prueba_chi2_cogTrj <- jmv::contTables(
    formula = cogTrj ~ .,  # cogTrj con todas las demás variables
    data = data,  # NOTA: Sustituir con el dataset real
    contCoef = TRUE,
    phiCra = TRUE
)

# Definir el análisis de Chi-cuadrado para funTrj con todas las variables
prueba_chi2_funTrj <- jmv::contTables(
    formula = funTrj ~ .,  # funTrj con todas las demás variables
    data = data,  # NOTA: Sustituir con el dataset real
    contCoef = TRUE,
    phiCra = TRUE
)

# Guardar resultados en archivos CSV para análisis posterior
write.csv(prueba_chi2_depTrj$freqs, file="../results/prueba_chi2_depTrj_frecuencias.csv", row.names=FALSE)
write.csv(prueba_chi2_depTrj$tests, file="../results/prueba_chi2_depTrj_estadisticos.csv", row.names=FALSE)

write.csv(prueba_chi2_cogTrj$freqs, file="../results/prueba_chi2_cogTrj_frecuencias.csv", row.names=FALSE)
write.csv(prueba_chi2_cogTrj$tests, file="../results/prueba_chi2_cogTrj_estadisticos.csv", row.names=FALSE)

write.csv(prueba_chi2_funTrj$freqs, file="../results/prueba_chi2_funTrj_frecuencias.csv", row.names=FALSE)
write.csv(prueba_chi2_funTrj$tests, file="../results/prueba_chi2_funTrj_estadisticos.csv", row.names=FALSE)

# Mensaje de finalización
cat("Análisis de Chi-cuadrado completado para depTrj, cogTrj y funTrj. Resultados guardados en la carpeta results/\n")
