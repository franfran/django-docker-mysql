#!/bin/bash

echo Activing python env
virtualenv -p /usr/local/bin/python2.7 /srv/django/venv
source /srv/django/venv/bin/activate

echo Installing Python dependencies
pip install -r /srv/django/requirements.txt

echo Init django
#python /srv/django/mysite/manage.py collectstatic --noinput

until nc -z -v -w60 db_1 3306
do
  echo "Waiting for database connection..."
  # wait for 3 seconds before check again
  sleep 3
done

python /srv/django/manage.py makemigrations
python /srv/django/manage.py migrate --noinput

# Start the process
# Let django listen to 0.0.0.0 for docker EXPOSE port to work
# The true loop will try to restart the server if there is any Python error
while true; do
  echo "Re-starting Django runserver"
  python /srv/django/manage.py runserver --settings=project.dev 0.0.0.0:8000
  sleep 2
done
