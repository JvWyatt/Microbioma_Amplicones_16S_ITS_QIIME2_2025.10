#!/bin/bash

# =============================================================================
# SETUP_CONDA.SH - Instalación y configuración de Miniconda
# =============================================================================
# Autor: José A. Vega-Jaén
# =============================================================================

set -e

echo "📦 Configurando Miniconda para QIIME 2..."
echo "============================================================"

# =============================================================================
# 1. INSTALAR MINICONDA (si no está presente)
# =============================================================================
if ! command -v conda &> /dev/null; then
    echo "📥 Descargando Miniconda..."
    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
    
    echo "🔧 Instalando Miniconda..."
    bash /tmp/miniconda.sh -b -p /opt/miniconda > /dev/null 2>&1
    
    export PATH="/opt/miniconda/bin:$PATH"
    conda init bash > /dev/null 2>&1
    rm -f /tmp/miniconda.sh
    
    echo "✅ Miniconda instalado correctamente"
else
    echo "✅ Conda ya está disponible"
fi

# Asegurar PATH
export PATH="/opt/miniconda/bin:$PATH"

# =============================================================================
# 2. ACEPTAR TÉRMINOS DE SERVICIO
# =============================================================================
echo ""
echo "📋 Aceptando términos de servicio de Anaconda..."
conda config --set allow_conda_downgrades true > /dev/null 2>&1
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main > /dev/null 2>&1 || true
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r > /dev/null 2>&1 || true

# =============================================================================
# 3. ACTUALIZAR CONDA
# =============================================================================
echo ""
echo "🔄 Actualizando conda a la última versión..."
conda update conda -y > /dev/null 2>&1

echo ""
echo "============================================================"
echo "✅ ¡Conda configurado y listo!"
echo "============================================================"
