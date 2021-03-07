#!/bin/sh

echo "Waiting for PostgreSQL..."

while ! nc -z app-db 5432; do
    sleep 0.1
done

echo "PostgreSQL started"

echo "Uncomment on of the following lines in $0 file!"
echo "python manage.py run -h 0.0.0.0"
echo "python manage.py runserver"
# python manage.py run -h 0.0.0.0
# python manage.py runserver

