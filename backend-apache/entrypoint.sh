#!/bin/sh

cd /var/www/html

echo "Ajustando permissões de pastas para o Laravel (modo de depuração)..."
touch storage/logs/laravel.log
chown -R www-data:www-data .
chmod -R 777 storage bootstrap/cache

echo "Aguardando a base de dados em $DB_HOST..."
while ! pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USERNAME" -d "$DB_DATABASE" -q; do
  echo "A base de dados ainda não está pronta. Tentando novamente em 2 segundos..."
  sleep 2
done
echo "Base de dados pronta!"

if [ "$APP_ENV" = "development" ]; then
    echo "Ambiente local detectado. Executando migrate:fresh --seed..."
    php artisan migrate:fresh --seed --force
else
    # AMBIENTE DE PRODUÇÃO (ou outro): Executa APENAS as migrations.
    echo "Ambiente de produção detectado. Executando migrate..."
    php artisan migrate --seed --force
fi

echo "Iniciando o servidor Apache..."
exec apache2-foreground
