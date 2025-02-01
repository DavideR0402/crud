# Usa una imagen base oficial de Python
FROM python:3.12.8-alpine3.21

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo de requerimientos y el archivo de configuración de tu proyecto
COPY requirements.txt .

# Instala las dependencias
RUN  apk update \
	&& apk add --no-cache gcc musl-dev postgresql-dev python3-dev libffi-dev \
	&& pip install --upgrade pip

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto 8000 para la aplicación Django

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]

EXPOSE 8000