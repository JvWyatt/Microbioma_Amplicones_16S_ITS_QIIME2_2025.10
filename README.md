# 🧬 Microbioma_Amplicones_16S_ITS_QIIME2_2025.10

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue)](https://github.com/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10)
[![QIIME2](https://img.shields.io/badge/QIIME2-2025.10-green)](https://qiime2.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10/blob/main/notebooks/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10.ipynb)

> **Notebook educativo** para análisis de **microbioma** con datos de **amplicones 16S 🦠** e **ITS 🍄** usando **QIIME 2 2025.10** en **Google Colab**.

---

## 📋 Tabla de Contenidos

- [🎯 Propósito](#-propósito)
- [✨ Características](#-características)
- [🚀 Inicio Rápido](#-inicio-rápido)
- [📂 Estructura del Repositorio](#-estructura-del-repositorio)
- [🛠️ Instalación y Configuración](#️-instalación-y-configuración)
- [📊 Datos Incluidos](#-datos-incluidos)
- [📚 Uso del Notebook](#-uso-del-notebook)
- [🔧 Requisitos del Sistema](#-requisitos-del-sistema)
- [📖 Documentación](#-documentación)
- [🤝 Contribuciones](#-contribuciones)
- [📄 Licencia](#-licencia)
- [✍️ Autor](#️-autor)

---

## 🎯 Propósito

Este repositorio proporciona un **entorno completo** y **fácil de usar** para aprender análisis de microbioma usando **QIIME 2** directamente en **Google Colab**. Está diseñado específicamente para:

- **🎓 Estudiantes** que quieren aprender bioinformática de microbiomas
- **👩‍🔬 Investigadores** que necesitan una plataforma rápida para análisis
- **👨‍🏫 Educadores** que buscan material didáctico interactivo
- **🔬 Laboratorios** que requieren flujos de trabajo reproducibles

### ¿Por qué usar este notebook?

✅ **Sin instalaciones complejas** - Todo funciona en Google Colab  
✅ **Configuración automática** - QIIME 2 2025.10 se instala automáticamente  
✅ **Datos incluidos** - Ejemplos de 16S e ITS listos para usar  
✅ **Educativo** - Explicaciones paso a paso en español  
✅ **Reproducible** - Mismos resultados en cualquier entorno  

---

## ✨ Características

### 🧬 **Análisis Soportados**
- **16S rRNA** 🦠: Bacterias y arqueas
- **ITS** 🍄: Hongos y levaduras

### 🛠️ **Herramientas Incluidas**
- **QIIME 2 2025.10** - Plataforma principal de análisis
- **Empress** - Visualización de árboles filogenéticos
- **Plotly/Seaborn** - Gráficos interactivos
- **Rich** - Salida colorida y elegante

### 📦 **Configuración Automática**
- **Miniconda** - Gestión de paquetes
- **Entornos conda** - Aislamiento de dependencias
- **Scripts automatizados** - Instalación con un solo comando
- **Verificación** - Comprobación automática de la instalación

---

## 🚀 Inicio Rápido

### Opción 1: Google Colab (Recomendado) 🌟

1. **Haz clic** en el botón de Colab arriba ⬆️
2. **Guarda** una copia en tu Google Drive
3. **Ejecuta** las celdas en orden
4. **¡Empieza** a analizar!

### Opción 2: Instalación Local

```bash
# 1. Clonar el repositorio
git clone https://github.com/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10.git
cd Microbioma_Amplicones_16S_ITS_QIIME2_2025.10

# 2. Ejecutar configuración automática
bash scripts/setup_qiime2.sh

# 3. Activar entorno
conda activate qiime2-2025.10

# 4. Verificar instalación
qiime info
```

---

## 📂 Estructura del Repositorio

```
Microbioma_Amplicones_16S_ITS_QIIME2_2025.10/
├── 📓 notebooks/
│   └── Microbioma_Amplicones_16S_ITS_QIIME2_2025.10.ipynb
├── 🛠️ scripts/
│   └── setup_qiime2.sh                    # Script de instalación automática
├── 🌍 envs/
│   ├── base.yml                           # Dependencias básicas
│   └── qiime2.yml                         # Dependencias QIIME 2
├── 📂 data_example/
│   ├── 16S/                               # Datos ejemplo bacterias/arqueas
│   │   ├── emp-single-end-sequences.zip   # Secuencias EMP
│   │   ├── sample-metadata.tsv            # Metadatos
│   │   └── README.md                      # Guía para 16S
│   └── ITS/                               # Datos ejemplo hongos
│       └── README.md                      # Guía para ITS
├── 📋 README.md                           # Este archivo
└── 📄 LICENSE                             # Licencia MIT
```

### 📝 Descripción de Componentes

#### 📓 `notebooks/`
- **Notebook principal** con todo el flujo de análisis
- **Celdas interactivas** para aprendizaje paso a paso
- **Explicaciones detalladas** en español

#### 🛠️ `scripts/`
- **`setup_qiime2.sh`**: Instalación automática de QIIME 2
  - Instala Miniconda si es necesario
  - Configura QIIME 2 2025.10
  - Instala paquetes adicionales
  - Verifica la instalación

#### 🌍 `envs/`
- **`base.yml`**: Dependencias básicas (Python, visualización)
- **`qiime2.yml`**: Dependencias específicas de QIIME 2

#### 📂 `data_example/`
- **Datos de prueba** para ambos tipos de análisis
- **READMEs específicos** con instrucciones detalladas
- **Espacio** para tus propios datos

---

## 🛠️ Instalación y Configuración

### 🤖 Configuración Automática (Recomendado)

El repositorio incluye un script que **automatiza completamente** la instalación:

```bash
bash scripts/setup_qiime2.sh
```

### ¿Qué hace el script automáticamente?

1. **🔍 Verifica** si Miniconda está instalado
2. **📥 Descarga** e instala Miniconda si es necesario
3. **⚙️ Configura** los canales de conda correctos
4. **📦 Descarga** el archivo YAML oficial de QIIME 2 2025.10
5. **🏗️ Crea** el entorno conda con todas las dependencias
6. **🌳 Instala** Empress para visualizaciones
7. **📊 Agrega** paquetes para visualización (seaborn, plotly)
8. **✅ Verifica** que QIIME 2 funciona correctamente
9. **🧹 Limpia** archivos temporales

### ⏱️ Tiempo de Instalación

- **Primera vez**: 10-15 minutos
- **Reinstalación**: 5-8 minutos
- **Verificación**: 1-2 minutos

---

## 📊 Datos Incluidos

### 🦠 **16S rRNA (Bacterias y Arqueas)**

**Ubicación**: `data_example/16S/`

- **`emp-single-end-sequences.zip`**
  - Secuencias del Earth Microbiome Project
  - Single-end demultiplexadas
  - Formato FASTQ comprimido
  
- **`sample-metadata.tsv`**
  - Metadatos de las muestras
  - Información experimental
  - Compatible con QIIME 2

### 🍄 **ITS (Hongos)**

**Ubicación**: `data_example/ITS/`

- Carpeta preparada para **tus datos de ITS**
- **README específico** con guías para hongos
- **Información** sobre primers ITS comunes
- **Bases de datos** recomendadas (UNITE)

### 📝 **Usando tus propios datos**

1. **Coloca** tus archivos en la carpeta correspondiente:
   - `data_example/16S/` para bacterias/arqueas
   - `data_example/ITS/` para hongos

2. **Asegúrate** de tener:
   - Secuencias en formato FASTQ (`.fastq`, `.fastq.gz`)
   - Archivo de metadatos en formato TSV
   - Columna `sample-id` en los metadatos

3. **Sigue** las instrucciones del notebook

---

## 📚 Uso del Notebook

### 🎯 **Flujo de Trabajo**

1. **🔗 Clonar** el repositorio
2. **⚙️ Configurar** QIIME 2 automáticamente
3. **📂 Preparar** los datos
4. **🔍 Explorar** la estructura
5. **🚀 Comenzar** el análisis

### 📖 **Secciones del Notebook**

#### 🏁 **Configuración Inicial**
- Clonado del repositorio
- Instalación automática de QIIME 2
- Verificación del entorno

#### 📂 **Preparación de Datos**
- Exploración de estructura de carpetas
- Verificación de datos de ejemplo
- Instrucciones para datos propios

#### 🔬 **Análisis (Próximamente)**
- Importación de datos a QIIME 2
- Control de calidad
- Procesamiento de secuencias
- Análisis taxonómico
- Análisis de diversidad

### 💡 **Consejos de Uso**

- **📱 Ejecuta** las celdas en orden
- **⏸️ Espera** a que cada celda termine antes de continuar
- **👀 Lee** las explicaciones entre celdas
- **❓ Consulta** los READMEs para información específica

---

## 🔧 Requisitos del Sistema

### 🌐 **Para Google Colab**
- **Navegador web** moderno
- **Cuenta de Google** (gratuita)
- **Conexión a internet** estable

### 💻 **Para Instalación Local**

#### Requisitos Mínimos
- **SO**: Linux (Ubuntu 20.04+), macOS (10.15+), Windows (WSL2)
- **RAM**: 4 GB mínimo, 8 GB recomendado
- **Almacenamiento**: 5 GB libres
- **Internet**: Para descargar dependencias

#### Software Requerido
- **Bash** shell
- **wget** o **curl**
- **Git** (para clonar)

> **Nota**: El script instala automáticamente Miniconda y todas las dependencias.

---

## 📖 Documentación

### 🔗 **Enlaces Útiles**

- **[QIIME 2 Documentation](https://docs.qiime2.org/)**
- **[QIIME 2 Tutorials](https://docs.qiime2.org/2025.10/tutorials/)**
- **[QIIME 2 Forum](https://forum.qiime2.org/)**
- **[Earth Microbiome Project](https://earthmicrobiome.org/)**

### 📚 **Recursos Educativos**

- **[QIIME 2 Workshops](https://workshops.qiime2.org/)**
- **[Microbiome Analysis Guide](https://link-to-guide)**
- **[16S vs ITS Comparison](https://link-to-comparison)**

### 🆘 **Resolución de Problemas**

#### ❌ **Errores Comunes**

**Error: "conda: command not found"**
```bash
# Solución: Reiniciar terminal o recargar bashrc
source ~/.bashrc
```

**Error: "Environment already exists"**
```bash
# Solución: Eliminar entorno existente
conda env remove -n qiime2-2025.10
bash scripts/setup_qiime2.sh
```

**Error: "YAML file not found"**
```bash
# Solución: Verificar conexión a internet y reintentar
bash scripts/setup_qiime2.sh
```

---

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! 🎉

### 🚀 **Cómo Contribuir**

1. **🍴 Fork** el repositorio
2. **🌿 Crea** una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. **💾 Commit** tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. **📤 Push** a la rama (`git push origin feature/AmazingFeature`)
5. **🔃 Abre** un Pull Request

### 🐛 **Reportar Bugs**

Usa las **[GitHub Issues](https://github.com/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10/issues)** para reportar bugs o solicitar features.

### 💡 **Ideas para Contribuciones**

- 📊 Nuevos tipos de visualizaciones
- 🔧 Mejoras en los scripts de instalación
- 📚 Más ejemplos de datos
- 🌐 Traducciones a otros idiomas
- 📖 Documentación adicional

---

## 📄 Licencia

Este proyecto está licenciado bajo la **Licencia MIT** - ver el archivo [LICENSE](LICENSE) para detalles.

### 📝 **Resumen de la Licencia MIT**

✅ **Uso comercial** permitido  
✅ **Modificación** permitida  
✅ **Distribución** permitida  
✅ **Uso privado** permitido  

⚠️ **Sin garantía** - úsalo bajo tu propia responsabilidad  
⚠️ **Incluir** texto de licencia en distribuciones

---

## ✍️ Autor

**José A. Vega-Jaén**
- 🏫 **Afiliación**: Universidad de Panamá
- 🐙 **GitHub**: [@JvWyatt](https://github.com/JvWyatt)
- 📧 **Email**: [tu-email@email.com]
- 🌐 **Website**: [tu-website.com]

### 📖 **Cómo Citar**

Si utilizas este notebook en tus análisis o investigación, puedes citarlo como:

```
Vega-Jaén, J. A. (2025). Microbioma_Amplicones_16S_ITS_QIIME2_2025.10: 
Notebook para análisis de microbioma con QIIME 2. GitHub Repository. 
https://github.com/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10
```

---

## 🙏 Agradecimientos

- **QIIME 2 Development Team** - Por crear una plataforma increíble
- **Earth Microbiome Project** - Por los datos de ejemplo
- **Google Colab** - Por proporcionar recursos computacionales gratuitos
- **Universidad de Panamá** - Por el apoyo institucional
- **Comunidad científica** - Por compartir conocimiento abiertamente

---

## 📈 Estadísticas del Proyecto

![GitHub stars](https://img.shields.io/github/stars/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10?style=social)
![GitHub forks](https://img.shields.io/github/forks/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10?style=social)
![GitHub issues](https://img.shields.io/github/issues/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10)
![GitHub last commit](https://img.shields.io/github/last-commit/JvWyatt/Microbioma_Amplicones_16S_ITS_QIIME2_2025.10)

---

<div align="center">

**¡Gracias por usar este notebook! 🧬🔬**

**Si te resulta útil, ¡dale una ⭐ al repositorio!**

---

*"La microbiota es el órgano que nunca sabíamos que teníamos"* - Rob Knight

</div>