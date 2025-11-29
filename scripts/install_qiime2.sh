#!/bin/bash

# =============================================================================
# INSTALL_QIIME2.SH - Instalación de QIIME 2 2025.10 Amplicon
# =============================================================================
# Basado en: https://library.qiime2.org/quickstart/amplicon
# Autor: José A. Vega-Jaén
# =============================================================================

set -e

echo "🧬 Instalando QIIME 2 2025.10 Amplicon Distribution..."
echo "============================================================"

# Asegurar PATH
export PATH="/opt/miniconda/bin:$PATH"

# =============================================================================
# 1. DESCARGAR ARCHIVO DE CONFIGURACIÓN OFICIAL
# =============================================================================
echo "📥 Descargando configuración oficial de QIIME 2..."
ENV_URL="https://data.qiime2.org/distro/amplicon/qiime2-amplicon-2025.10-py311-linux-conda.yml"

if ! wget -q "$ENV_URL" -O /tmp/qiime2-amplicon.yml; then
    echo "❌ Error al descargar el archivo de configuración"
    echo "💡 Verifica tu conexión a internet"
    exit 1
fi

echo "✅ Archivo de configuración descargado"

# =============================================================================
# 2. CREAR ENTORNO E INSTALAR QIIME 2
# =============================================================================
echo ""
echo "🏗️  Creando entorno conda e instalando QIIME 2..."
echo "⏱️  Esto puede tardar 5-10 minutos..."
echo ""

conda env create -n qiime2-amplicon-2025.10 --file /tmp/qiime2-amplicon.yml > /dev/null 2>&1

echo ""
echo "✅ QIIME 2 Amplicon 2025.10 instalado correctamente"

# =============================================================================
# 3. VERIFICAR INSTALACIÓN
# =============================================================================
echo ""
echo "🔍 Verificando instalación..."
source activate qiime2-amplicon-2025.10
qiime info > /dev/null 2>&1

# =============================================================================
# 4. LIMPIAR ARCHIVOS TEMPORALES
# =============================================================================
echo ""
echo "🧹 Limpiando archivos temporales..."
rm -f /tmp/qiime2-amplicon.yml
conda clean -a -y > /dev/null 2>&1

echo ""
echo "============================================================"
echo "🎉 ¡QIIME 2 2025.10 instalado y listo para usar!"
echo "============================================================"
echo ""
echo "💡 Para activar QIIME 2 en futuras sesiones:"
echo "   conda activate qiime2-amplicon-2025.10"
echo ""
