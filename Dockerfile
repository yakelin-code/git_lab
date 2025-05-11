# Usar una imagen base de Ubuntu oficial
FROM ubuntu:latest

# Evitar preguntas interactivas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar los repositorios e instalar Apache y utilidades
RUN apt-get update && \
    apt-get install -y apache2 apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# (Opcional) Habilitar el módulo rewrite para Apache, útil para muchas aplicaciones web
# RUN a2enmod rewrite

# Exponer el puerto 80 (el puerto estándar de HTTP donde Apache escucha)
EXPOSE 80

# Comando para iniciar Apache en primer plano cuando el contenedor arranque
# Apache servirá archivos desde /var/www/html/ por defecto
CMD ["apachectl", "-D", "FOREGROUND"]