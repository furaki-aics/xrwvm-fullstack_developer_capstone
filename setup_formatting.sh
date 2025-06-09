#!/bin/bash

echo "🔧 Configurando formateo automático..."

# Activar entorno virtual
cd server
source djangoenv/bin/activate

echo "✅ Entorno virtual activado: $(which python)"

# Verificar que las herramientas estén instaladas
echo "🔍 Verificando herramientas de formateo..."

if command -v black &> /dev/null; then
    echo "✅ Black instalado: $(black --version)"
else
    echo "❌ Black no encontrado"
    exit 1
fi

if command -v flake8 &> /dev/null; then
    echo "✅ Flake8 instalado: $(flake8 --version)"
else
    echo "❌ Flake8 no encontrado"
    exit 1
fi

if command -v isort &> /dev/null; then
    echo "✅ isort instalado: $(isort --version)"
else
    echo "❌ isort no encontrado"
    exit 1
fi

# Instalar pre-commit hooks
echo "🔧 Instalando pre-commit hooks..."
pre-commit install

# Probar formateo en un archivo
echo "🧪 Probando formateo..."
black djangoapp/views.py --line-length=79 --check

if [ $? -eq 0 ]; then
    echo "✅ Formateo funcionando correctamente"
else
    echo "⚠️  El archivo necesita formateo"
    black djangoapp/views.py --line-length=79
fi

echo ""
echo "🎉 Configuración completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Reinicia Cursor/VS Code"
echo "2. Abre un archivo Python y guarda (Ctrl+S/Cmd+S)"
echo "3. El archivo debería formatearse automáticamente"
echo ""
echo "🔧 Comandos útiles:"
echo "  black . --line-length=79          # Formatear todos los archivos Python"
echo "  isort . --profile=black           # Ordenar imports"
echo "  flake8 . --max-line-length=79     # Verificar linting"
