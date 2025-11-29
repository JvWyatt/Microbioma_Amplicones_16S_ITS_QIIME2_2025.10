#!/bin/bash

# =============================================================================
# SETUP_CONDA.SH - Instalación y configuración de Miniconda
# =============================================================================
# Autor: José A. Vega-Jaén
# =============================================================================

set -e

echo "📦 Configurando Miniconda para QIIME 2..."
echo "=" * 60

# =============================================================================
# 1. INSTALAR MINICONDA (si no está presente)
# =============================================================================
if ! command -v conda &> /dev/null; then
    echo "📥 Descargando Miniconda..."
    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
    
    echo "🔧 Instalando Miniconda..."
    bash /tmp/miniconda.sh -b -p /opt/miniconda
    
    export PATH="/opt/miniconda/bin:$PATH"
    conda init bash
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
conda config --set allow_conda_downgrades true
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main 2>/dev/null || true
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r 2>/dev/null || true

# =============================================================================
# 3. ACTUALIZAR CONDA
# =============================================================================
echo ""
echo "🔄 Actualizando conda a la última versión..."
conda update conda -y

echo ""
echo "=" * 60
echo "✅ ¡Conda configurado y listo!"
echo "=" * 60
