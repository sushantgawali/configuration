#!/bin/sh
set -e
cd /edx/app/edxapp/edx-platform && sudo -u www-data /edx/bin/python.edxapp ./manage.py lms syncdb --migrate --settings aws
cd /edx/app/edxapp/edx-platform && sudo -u www-data /edx/bin/python.edxapp ./manage.py cms syncdb --migrate --settings aws
source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver update_assets cms --settings=aws
source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver update_assets lms --settings=aws
/usr/sbin/nginx &
/sbin/my_init
