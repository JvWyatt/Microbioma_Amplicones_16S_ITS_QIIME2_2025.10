#!/bin/bash

# =============================================================================
# INSTALL_QIIME2.SH - Instalación de QIIME 2 2025.10 Amplicon
# =============================================================================
# Basado en: https://library.qiime2.org/quickstart/amplicon
# Autor: José A. Vega-Jaén
# =============================================================================

set -e

echo "🧬 Instalando QIIME 2 2025.10 Amplicon Distribution..."
echo "=" * 60

# Asegurar PATH
export PATH="/opt/miniconda/bin:$PATH"

# =============================================================================
# 1. DESCARGAR ARCHIVO DE CONFIGURACIÓN OFICIAL
# =============================================================================
echo "📥 Descargando configuración oficial de QIIME 2..."
ENV_URL="https://data.qiime2.org/distro/amplicon/qiime2-amplicon-2025.10-py311-linux-conda.yml"
wget -q $ENV_URL -O /tmp/qiime2-amplicon.yml

echo "✅ Archivo de configuración descargado"

# =============================================================================
# 2. CREAR ENTORNO E INSTALAR QIIME 2
# =============================================================================
echo ""
echo "🏗️  Creando entorno conda e instalando QIIME 2..."
echo "⏱️  Esto puede tardar 5-10 minutos..."
echo ""

conda env create -n qiime2-amplicon-2025.10 --file /tmp/qiime2-amplicon.yml

echo ""
echo "✅ QIIME 2 Amplicon 2025.10 instalado correctamente"

# =============================================================================
# 3. VERIFICAR INSTALACIÓN
# =============================================================================
echo ""
echo "🔍 Verificando instalación..."
source activate qiime2-amplicon-2025.10
qiime info

# =============================================================================
# 4. LIMPIAR ARCHIVOS TEMPORALES
# =============================================================================
echo ""
echo "🧹 Limpiando archivos temporales..."
rm -f /tmp/qiime2-amplicon.yml
conda clean -a -y

echo ""
echo "=" * 60
echo "🎉 ¡QIIME 2 2025.10 instalado y listo para usar!"
echo "=" * 60
echo ""
echo "💡 Para activar QIIME 2 en futuras sesiones:"
echo "   conda activate qiime2-amplicon-2025.10"
echo ""
