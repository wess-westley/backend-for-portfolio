#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

python core/manage.py collectstatic --no-input
python core/manage.py migrate

gunicorn core.wsgi:application --bind 0.0.0.0:8000 --workers 3
