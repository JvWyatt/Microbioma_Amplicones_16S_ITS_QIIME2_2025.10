#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Funciones auxiliares para el notebook de QIIME 2
Autor: José A. Vega-Jaén
"""

import subprocess
import sys
import time
import os


def install_with_progress(script_name, task_name, estimated_time):
    """
    Ejecuta un script bash mostrando progreso visual amigable
    
    Args:
        script_name: Nombre del script a ejecutar
        task_name: Nombre descriptivo de la tarea
        estimated_time: Tiempo estimado en minutos
    
    Returns:
        tuple: (success: bool, message: str)
    """
    print(f"🚀 {task_name}...")
    print(f"   Tiempo estimado: {estimated_time}\n")
    
    # Ejecutar script
    process = subprocess.Popen(
        ['bash', f'scripts/{script_name}'],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True,
        cwd=os.getcwd()
    )
    
    # Animación de progreso
    spinner = ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏']
    i = 0
    start_time = time.time()
    
    while process.poll() is None:
        elapsed = int(time.time() - start_time)
        mins = elapsed // 60
        secs = elapsed % 60
        print(f"\r   {spinner[i % len(spinner)]} En progreso... ({mins}m {secs}s)", end='', flush=True)
        time.sleep(0.1)
        i += 1
    
    stdout, stderr = process.communicate()
    elapsed = int(time.time() - start_time)
    
    print("\r" + " " * 80 + "\r", end='')  # Limpiar línea
    
    if process.returncode == 0:
        print(f"✅ {task_name} completado exitosamente")
        print(f"   Tiempo: {elapsed // 60}m {elapsed % 60}s\n")
        return True, stdout
    else:
        print(f"❌ Error en {task_name}")
        print(f"   Código de error: {process.returncode}\n")
        
        # Mostrar stdout primero (mensajes del script)
        if stdout:
            print("📋 Salida del script:")
            print(stdout[-1000:] if len(stdout) > 1000 else stdout)
            print()
        
        # Mostrar stderr si hay
        if stderr:
            print("⚠️ Errores detectados:")
            print(stderr[-1000:] if len(stderr) > 1000 else stderr)
            print()
        
        return False, stderr


def verify_conda():
    """Verifica que Conda esté instalado y funcionando"""
    print("🔍 Verificando Conda...")
    
    result = subprocess.run(
        ['conda', '--version'],
        capture_output=True,
        text=True,
        env={'PATH': '/opt/miniconda/bin:/usr/local/bin:/usr/bin:/bin'}
    )
    
    if result.returncode == 0:
        version = result.stdout.strip()
        print(f"✅ {version}")
        print("   Conda listo para usar\n")
        return True
    else:
        print("❌ Conda no disponible")
        print("   Ejecuta la celda de instalación anterior\n")
        return False


def verify_qiime2():
    """Verifica que QIIME 2 esté instalado"""
    print("🔍 Verificando QIIME 2...")
    
    result = subprocess.run(
        ['conda', 'run', '-n', 'qiime2-amplicon-2025.10', 'qiime', '--version'],
        capture_output=True,
        text=True
    )
    
    if result.returncode == 0:
        version = result.stdout.strip()
        print(f"✅ {version}")
        print("   QIIME 2 listo para análisis\n")
        return True
    else:
        print("❌ QIIME 2 no disponible")
        print("   Verifica la instalación anterior\n")
        return False


def clone_repository(repo_url):
    """Clona el repositorio de GitHub"""
    print("📥 Descargando materiales desde GitHub...")
    
    result = subprocess.run(
        ['git', 'clone', repo_url],
        capture_output=True,
        text=True
    )
    
    if result.returncode == 0 or "already exists" in result.stderr:
        print("✅ Materiales descargados\n")
        return True
    else:
        print(f"❌ Error al clonar: {result.stderr}\n")
        return False
