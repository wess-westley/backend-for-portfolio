#!/usr/bin/env bash
set -o errexit  

pip install -r requirements.txt

# Move into core where manage.py is
cd core

python manage.py collectstatic --no-input
python manage.py migrate
