#!/usr/bin/env bash
set -o errexit
echo "Current directory: $(pwd)"
ls -la
ls -la core/
pip install -r requirements.txt



gunicorn core.wsgi:application --bind 0.0.0.0:8000 --workers 3
