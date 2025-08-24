#!/usr/bin/env bash
set -o errexit  

pip install -r requirements.txt

# Run Django management commands from the "core" folder
python core/manage.py collectstatic --no-input
python core/manage.py migrate

# Start Gunicorn (Django entry point)
gunicorn core.wsgi:application --bind 0.0.0.0:8000 --workers 3
