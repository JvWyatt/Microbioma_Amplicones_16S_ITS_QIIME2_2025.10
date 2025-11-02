# Datos de Ejemplo - ITS (Internal Transcribed Spacer) 🍄

Esta carpeta está preparada para datos de **amplicones de ITS** para análisis de **comunidades fúngicas** usando QIIME 2.

## ¿Qué son los datos ITS?

Los **ITS (Internal Transcribed Spacer)** son regiones del ADN ribosomal que se utilizan como **marcadores moleculares** para:
- Identificar especies de **hongos** 🍄
- Estudiar **diversidad fúngica** en diferentes ambientes
- Analizar **micobiomas** (comunidades de hongos)

## Estructura esperada para tus datos

```
ITS/
├── sequences.fastq.gz          # Tus secuencias ITS
├── sample-metadata.tsv         # Metadatos de las muestras
├── barcodes.fastq.gz          # Si usas secuencias multiplexadas
└── primers.txt                # Información de primers utilizados
```

## Regiones ITS comunes

- **ITS1**: Entre 18S y 5.8S rRNA
- **ITS2**: Entre 5.8S y 28S rRNA
- **ITS completo**: ITS1 + 5.8S + ITS2

## Primers frecuentemente utilizados

### ITS1
- **ITS1F/ITS2**: Región ITS1 completa
- **BITS/B58S3**: Específicos para hongos

### ITS2
- **fITS7/ITS4**: Región ITS2 completa
- **ITS3/ITS4**: Alternativa para ITS2

## Preparación de tus datos

### 1. **Secuencias**
- Formato: FASTQ (comprimido o no)
- Calidad: Score Phred ≥ 20 recomendado
- Longitud: Variable según la región ITS

### 2. **Metadatos** (sample-metadata.tsv)
```
sample-id    sample-type    substrate    collection-date
sample-001   soil          forest       2025-01-15
sample-002   root          agricultural 2025-01-16
```

### 3. **Información de primers**
- Secuencias de primers utilizados
- Región ITS amplificada
- Protocolo de PCR utilizado

## Consideraciones especiales para ITS

### 🧬 **Diferencias con 16S**
- **Longitud variable**: ITS tiene mayor variabilidad de longitud
- **Estructura secundaria**: Más compleja que 16S
- **Bases de datos**: UNITE, NCBI ITS RefSeq

### 🍄 **Análisis específicos**
- **FUNGuild**: Predicción de guilds funcionales
- **ITSx**: Extracción de regiones ITS específicas
- **CONSTAX**: Taxonomía consenso para ITS

## Bases de datos recomendadas

1. **UNITE**: Base de datos principal para ITS
   - Descarga: https://unite.ut.ee/
   - Taxonomía curada para hongos

2. **NCBI ITS RefSeq**: Secuencias de referencia
3. **Warcup**: Específica para hongos de suelos

## Workflow típico para ITS

1. **Importar** secuencias a QIIME 2
2. **Remover primers** con cutadapt
3. **Control de calidad** y filtrado
4. **Clustering** o **ASVs** con DADA2/Deblur
5. **Asignación taxonómica** con UNITE
6. **Análisis de diversidad** alpha y beta
7. **Análisis funcional** con FUNGuild

## Cómo empezar

1. **Coloca tus archivos** en esta carpeta
2. **Verifica el formato** de metadatos
3. **Ejecuta el notebook** principal
4. **Sigue las celdas** específicas para ITS

## Recursos adicionales

- [QIIME 2 ITS Tutorial](https://docs.qiime2.org/2025.10/tutorials/)
- [UNITE Database](https://unite.ut.ee/)
- [FUNGuild Documentation](https://github.com/UMNFuN/FUNGuild)

¡Listo para explorar el reino de los hongos! 🍄🧬