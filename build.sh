#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

gunicorn core.cause.wsgi:application --bind 0.0.0.0:8000 --workers 3
