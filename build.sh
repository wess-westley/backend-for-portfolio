#!/usr/bin/env bash
set -o errexit  

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate

# Start Gunicorn (Django entry point)
gunicorn backend.core.wsgi:application --bind 0.0.0.0:8000 --workers 3
