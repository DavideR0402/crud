# Usa una imagen base oficial de Python
FROM python:3.12

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo de requerimientos y el archivo de configuración de tu proyecto
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto 8000 para la aplicación Django
EXPOSE 8000