#!/bin/bash

# Script de arranque rápido para proyectos Symfony con Docker
# Comentarios en español para facilitar el mantenimiento

set -e

echo "🚀 Iniciando setup del entorno Docker + Symfony..."

# Construir y levantar contenedores
echo "🔧 Construyendo y levantando contenedores..."
docker compose -f docker/docker-compose.yml build
docker compose -f docker/docker-compose.yml up -d

# Crear proyecto Symfony si /app está vacío
if [ -z "$(ls -A ./app 2>/dev/null)" ]; then
  echo "📦 Creando nuevo proyecto Symfony en ./app..."
  docker compose -f docker/docker-compose.yml exec php bash -c "cd /var/www/symfony && symfony new ."
else
  echo "✅ La carpeta ./app ya contiene un proyecto. No se crea uno nuevo."
fi

# Aplicar permisos a var si existe
if [ -d "./app/var" ]; then
  echo "🔑 Ajustando permisos en ./app/var..."
  sudo chmod -R 777 ./app/var
fi

echo "🎉 Setup completado. Accede a tu proyecto Symfony desde el navegador según la configuración de NGINX_SERVER_NAME."

# Sugerencia: ejecutar este script con permisos de ejecución:
# chmod +x setup.sh && ./setup.sh