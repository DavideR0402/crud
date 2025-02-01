# Usa una imagen base oficial de Python
FROM python:3.12

# Establece el directorio de trabajo
WORKDIR /app

# Instalar apt-get y las dependencias necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copia el archivo de requerimientos y el archivo de configuración de tu proyecto
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto 8000 para la aplicación Django
EXPOSE 8000

# Define el comando por defecto para ejecutar cuando se inicie el contenedor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]