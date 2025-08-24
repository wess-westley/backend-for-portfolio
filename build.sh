#!/usr/bin/env bash
set -o errexit  

pip install -r requirements.txt

# Always run commands from repo root
cd "$(dirname "$0")"

python core/manage.py collectstatic --no-input
python core/manage.py migrate

# Start Gunicorn (Django entry point)
gunicorn core.wsgi:application --bind 0.0.0.0:8000 --workers 3
