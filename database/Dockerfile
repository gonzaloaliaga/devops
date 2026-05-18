FROM mysql:8.0

# Variables de entorno por defecto requeridas
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password

# Copiar el script SQL al directorio de inicialización automática de MySQL
COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306