#!/bin/bash

# =============================================================================
# SETUP_QIIME2.SH - Instalación oficial de QIIME 2 2025.10 Amplicon
# =============================================================================
# Basado en: https://library.qiime2.org/quickstart/amplicon
# Autor: José A. Vega-Jaén
# =============================================================================

set -e

echo "🧬 Instalando QIIME 2 2025.10 Amplicon Distribution..."

# =============================================================================
# 1. INSTALAR MINICONDA (si no está presente)
# =============================================================================
if ! command -v conda &> /dev/null; then
    echo "📦 Instalando Miniconda..."
    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
    bash /tmp/miniconda.sh -b -p /opt/miniconda
    export PATH="/opt/miniconda/bin:$PATH"
    conda init bash
    rm -f /tmp/miniconda.sh
    echo "✅ Miniconda instalado"
else
    echo "✅ Conda ya disponible"
fi

# Asegurar PATH
export PATH="/opt/miniconda/bin:$PATH"

# =============================================================================
# 2. ACEPTAR TÉRMINOS DE SERVICIO Y ACTUALIZAR CONDA
# =============================================================================
echo "📋 Aceptando términos de servicio de Anaconda..."
conda config --set allow_conda_downgrades true
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main 2>/dev/null || true
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r 2>/dev/null || true

echo "🔄 Actualizando conda..."
conda update conda -y

# =============================================================================
# 3. INSTALAR QIIME 2 AMPLICON 2025.10 (Método oficial)
# =============================================================================
echo "� Instalando QIIME 2 Amplicon 2025.10..."

# URL oficial del environment file para Linux
ENV_URL="https://data.qiime2.org/distro/amplicon/qiime2-amplicon-2025.10-py311-linux-conda.yml"

# Descargar e instalar
wget -q $ENV_URL -O /tmp/qiime2-amplicon.yml
conda env create -n qiime2-amplicon-2025.10 --file /tmp/qiime2-amplicon.yml

echo "✅ QIIME 2 Amplicon 2025.10 instalado"

# =============================================================================
# 4. VERIFICAR INSTALACIÓN
# =============================================================================
echo "🔍 Verificando instalación..."

source activate qiime2-amplicon-2025.10
qiime info

echo ""
echo "🎉 ¡QIIME 2 2025.10 listo para usar!"
echo ""
echo "Para activar en futuras sesiones:"
echo "conda activate qiime2-amplicon-2025.10"

# Limpiar
rm -f /tmp/qiime2-amplicon.yml
conda clean -a -y