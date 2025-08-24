#!/usr/bin/env bash
set -o errexit

pip install -r backend/requirements.txt

python backend/core/manage.py collectstatic --no-input
python backend/core/manage.py migrate

gunicorn backend/core.wsgi:application --bind 0.0.0.0:8000 --workers 3
