#!/bin/bash

# =============================================================================
# SETUP_QIIME2.SH - Configuración de QIIME 2 2025.10 para Google Colab
# =============================================================================
# Autor: José A. Vega-Jaén
# Propósito: Instalar y configurar QIIME 2 2025.10 en Google Colab
# Fecha: Noviembre 2025
# =============================================================================

set -e  # Salir si algún comando falla

# Colores para mensajes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para mostrar mensajes con colores
print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

print_message $BLUE "🧬 Iniciando configuración de QIIME 2 2025.10 para análisis de microbioma..."
echo "================================================================================"

# =============================================================================
# 1. VERIFICAR E INSTALAR MINICONDA
# =============================================================================
print_message $YELLOW "📋 Paso 1: Verificando instalación de Miniconda..."

if command -v conda &> /dev/null; then
    print_message $GREEN "✅ Conda ya está instalado:"
    conda --version
else
    print_message $YELLOW "📦 Instalando Miniconda..."
    
    # Descargar Miniconda para Linux
    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
    
    # Instalar Miniconda de forma silenciosa
    bash /tmp/miniconda.sh -b -p /opt/miniconda
    
    # Agregar conda al PATH
    export PATH="/opt/miniconda/bin:$PATH"
    
    # Inicializar conda
    conda init bash
    
    # Recargar bashrc
    source ~/.bashrc
    
    print_message $GREEN "✅ Miniconda instalado correctamente"
    
    # Limpiar archivo temporal
    rm -f /tmp/miniconda.sh
fi

# Asegurar que conda esté en el PATH
export PATH="/opt/miniconda/bin:$PATH"

# =============================================================================
# 2. CONFIGURAR CONDA
# =============================================================================
print_message $YELLOW "⚙️ Paso 2: Configurando canales de conda..."

# Configurar canales de conda en el orden correcto
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --add channels qiime2

# Configurar prioridades de canales
conda config --set channel_priority strict

print_message $GREEN "✅ Canales de conda configurados"

# =============================================================================
# 3. CREAR ENTORNO QIIME 2 2025.10
# =============================================================================
print_message $YELLOW "🔧 Paso 3: Creando entorno QIIME 2 2025.10..."

# Descargar archivo YAML oficial de QIIME 2 2025.10
QIIME2_VERSION="2025.10"
YAML_URL="https://raw.githubusercontent.com/qiime2/environment-files/master/2025.10/staging/qiime2-${QIIME2_VERSION}-py311-linux-conda.yml"

print_message $BLUE "📥 Descargando archivo de configuración QIIME 2 ${QIIME2_VERSION}..."
wget -q $YAML_URL -O /tmp/qiime2-environment.yml

# Verificar que el archivo se descargó correctamente
if [ ! -f /tmp/qiime2-environment.yml ]; then
    print_message $RED "❌ Error: No se pudo descargar el archivo YAML de QIIME 2"
    exit 1
fi

# Crear entorno QIIME 2
print_message $BLUE "🏗️ Creando entorno qiime2-${QIIME2_VERSION}..."
conda env create -n qiime2-${QIIME2_VERSION} --file /tmp/qiime2-environment.yml

print_message $GREEN "✅ Entorno QIIME 2 ${QIIME2_VERSION} creado exitosamente"

# =============================================================================
# 4. ACTIVAR ENTORNO E INSTALAR PAQUETES ADICIONALES
# =============================================================================
print_message $YELLOW "📦 Paso 4: Instalando paquetes adicionales..."

# Activar entorno
source activate qiime2-${QIIME2_VERSION}

# Instalar empress para visualizaciones de árboles filogenéticos
print_message $BLUE "🌳 Instalando empress..."
conda install -y -c conda-forge empress

# Instalar paquetes adicionales útiles para análisis
print_message $BLUE "📊 Instalando paquetes adicionales para visualización..."
pip install --quiet seaborn==0.12.* plotly==5.* kaleido==0.* rich==13.*

print_message $GREEN "✅ Paquetes adicionales instalados"

# =============================================================================
# 5. VERIFICAR INSTALACIÓN
# =============================================================================
print_message $YELLOW "🔍 Paso 5: Verificando instalación de QIIME 2..."

# Verificar que QIIME 2 funciona correctamente
if qiime info &> /dev/null; then
    print_message $GREEN "✅ QIIME 2 instalado y funcionando correctamente!"
    
    echo ""
    print_message $BLUE "📋 Información del sistema QIIME 2:"
    qiime info
    
else
    print_message $RED "❌ Error: QIIME 2 no está funcionando correctamente"
    exit 1
fi

# =============================================================================
# 6. CONFIGURAR VARIABLES DE ENTORNO
# =============================================================================
print_message $YELLOW "🌍 Paso 6: Configurando variables de entorno..."

# Crear script de activación automática
cat > /opt/miniconda/etc/profile.d/qiime2_setup.sh << 'EOF'
#!/bin/bash
# Activación automática de QIIME 2 para nuevas sesiones
export QIIME2_VERSION="2025.10"
export PATH="/opt/miniconda/bin:$PATH"

# Función para activar QIIME 2
activate_qiime2() {
    source activate qiime2-${QIIME2_VERSION}
    echo "🧬 Entorno QIIME 2 ${QIIME2_VERSION} activado"
}

# Función para mostrar información de QIIME 2
qiime2_info() {
    if command -v qiime &> /dev/null; then
        echo "🧬 QIIME 2 información:"
        qiime info
    else
        echo "❌ QIIME 2 no está disponible. Ejecuta 'activate_qiime2' primero."
    fi
}
EOF

# Hacer el script ejecutable
chmod +x /opt/miniconda/etc/profile.d/qiime2_setup.sh

print_message $GREEN "✅ Variables de entorno configuradas"

# =============================================================================
# 7. LIMPIAR ARCHIVOS TEMPORALES
# =============================================================================
print_message $YELLOW "🧹 Paso 7: Limpiando archivos temporales..."

# Limpiar cache de conda
conda clean -a -y

# Eliminar archivos temporales
rm -f /tmp/qiime2-environment.yml

print_message $GREEN "✅ Limpieza completada"

# =============================================================================
# 8. RESUMEN FINAL
# =============================================================================
echo ""
echo "================================================================================"
print_message $GREEN "🎉 ¡CONFIGURACIÓN DE QIIME 2 COMPLETADA EXITOSAMENTE!"
echo "================================================================================"
print_message $BLUE "📋 Resumen de la instalación:"
echo "   • Miniconda: Instalado y configurado"
echo "   • QIIME 2 ${QIIME2_VERSION}: Instalado en entorno conda"
echo "   • Empress: Instalado para visualizaciones"
echo "   • Paquetes adicionales: seaborn, plotly, rich"
echo ""
print_message $YELLOW "🚀 Para usar QIIME 2 en futuras sesiones:"
echo "   1. Ejecuta: source activate qiime2-${QIIME2_VERSION}"
echo "   2. O usa la función: activate_qiime2"
echo "   3. Verifica con: qiime info"
echo ""
print_message $BLUE "📁 Próximos pasos:"
echo "   • Preparar tus datos en las carpetas data_example/16S/ o data_example/ITS/"
echo "   • Continuar con el análisis usando el notebook principal"
echo ""
print_message $GREEN "¡Listo para analizar microbiomas! 🦠🍄"
echo "================================================================================"