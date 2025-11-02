# Datos de Ejemplo - 16S rRNA 🦠

Esta carpeta contiene datos de ejemplo para análisis de **amplicones de 16S rRNA** usando QIIME 2.

## Archivos incluidos

### `emp-single-end-sequences.zip`
- **Descripción**: Secuencias de ejemplo del proyecto Earth Microbiome Project (EMP)
- **Tipo**: Secuencias single-end demultiplexadas
- **Formato**: Archivo ZIP con secuencias FASTQ
- **Uso**: Datos de prueba para seguir el tutorial de QIIME 2

### `sample-metadata.tsv`
- **Descripción**: Metadatos de las muestras incluidas
- **Formato**: TSV (Tab-Separated Values)
- **Contenido**: Información sobre las muestras, condiciones experimentales, etc.
- **Uso**: Archivo de metadatos requerido por QIIME 2 para los análisis

## Cómo usar estos datos

1. **En Google Colab**: Los archivos ya están disponibles tras clonar el repositorio
2. **Con tus propios datos**: Puedes reemplazar estos archivos con tus propias secuencias
3. **Formato requerido**: 
   - Secuencias en formato FASTQ (comprimidas o no)
   - Metadatos en formato TSV con las columnas requeridas

## Estructura esperada para tus datos

```
16S/
├── sequences.fastq.gz          # Tus secuencias
├── sample-metadata.tsv         # Tus metadatos
└── barcodes.fastq.gz          # Si usas secuencias multiplexadas
```

## Notas importantes

- **Calidad**: Asegúrate de que tus secuencias tengan buena calidad
- **Metadatos**: El archivo de metadatos debe tener una columna llamada `sample-id`
- **Nombres**: Los nombres de las muestras deben coincidir entre las secuencias y metadatos
- **Formato**: QIIME 2 acepta formatos FASTQ, FASTA, y sus versiones comprimidas

## Próximos pasos

Después de preparar tus datos aquí, podrás:
1. Importar las secuencias a QIIME 2
2. Realizar control de calidad
3. Generar tablas de características (ASVs/OTUs)
4. Realizar análisis taxonómicos y de diversidad

¡Listo para analizar tu microbioma! 🧬