# Configuración de Formateo Automático

## ✅ Configuración Automática (Recomendado)

Ejecuta el script de configuración:
```bash
./setup_formatting.sh
```

## 🔧 Configuración Manual

### 1. Activar entorno virtual
```bash
cd server
source djangoenv/bin/activate
```

### 2. Instalar dependencias
```bash
pip install -r requirements.txt
```

### 3. Instalar pre-commit hooks
```bash
pre-commit install
```

### 4. Configurar Cursor/VS Code

**IMPORTANTE:** Después de instalar las dependencias, **reinicia Cursor/VS Code** para que tome la nueva configuración.

La configuración en `.vscode/settings.json` ya está lista para usar el entorno virtual correcto.

## 🎯 Verificación

### Verificar que Cursor use el entorno virtual correcto:
1. Abre Cursor
2. Presiona `Cmd+Shift+P` (Mac) o `Ctrl+Shift+P` (Windows/Linux)
3. Escribe "Python: Select Interpreter"
4. Selecciona: `./server/djangoenv/bin/python`

### Probar formateo automático:
1. Abre cualquier archivo Python (ej: `server/djangoapp/views.py`)
2. Modifica algo (agrega espacios extra, líneas largas, etc.)
3. Guarda el archivo (`Cmd+S` / `Ctrl+S`)
4. El archivo debería formatearse automáticamente

## 🛠️ Comandos Manuales

### Formatear todos los archivos Python
```bash
cd server
source djangoenv/bin/activate
black . --line-length=79
```

### Ordenar imports
```bash
isort . --profile=black --line-length=79
```

### Verificar linting
```bash
flake8 . --max-line-length=79
```

## 🔍 Solución de Problemas

### Si el formateo no funciona al guardar:

1. **Verificar el intérprete de Python:**
   - `Cmd+Shift+P` → "Python: Select Interpreter"
   - Selecciona: `./server/djangoenv/bin/python`

2. **Verificar que las extensiones estén instaladas:**
   - Python (ms-python.python)
   - ESLint (dbaeumer.vscode-eslint)

3. **Reiniciar Cursor/VS Code**

4. **Verificar la configuración:**
   - Abre `Cmd+Shift+P` → "Preferences: Open Settings (JSON)"
   - Verifica que tenga las configuraciones de `.vscode/settings.json`

### Si las herramientas no se encuentran:

```bash
cd server
source djangoenv/bin/activate
pip install black flake8 isort pre-commit
```

## 📋 Configuración Actual

- **Black:** Formateador de Python (79 caracteres)
- **isort:** Ordenador de imports
- **flake8:** Linter de Python
- **Prettier:** Formateador de JavaScript/React
- **ESLint:** Linter de JavaScript/React
- **Pre-commit hooks:** Formateo automático antes de commits

## 🎉 ¡Listo!

Con esta configuración, cada vez que guardes un archivo:
- ✅ Se formateará automáticamente
- ✅ Se ordenarán los imports
- ✅ Se aplicarán las reglas de linting
- ✅ Se respetará el límite de 79 caracteres por línea
