#!/bin/bash
set -e
cd /edx/app/edxapp/edx-platform && sudo -u www-data -E /edx/bin/python.edxapp ./manage.py lms syncdb --migrate --noinput --settings docker_multi
cd /edx/app/edxapp/edx-platform && sudo -u www-data -E /edx/bin/python.edxapp ./manage.py cms syncdb --migrate --noinput --settings docker_multi
/sbin/my_init
