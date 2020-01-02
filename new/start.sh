#!/bin/bash

$HOME/gridplatform/scripts/production/start_celery.sh
$HOME/gridplatform/scripts/production/start_reports.sh
$HOME/gridplatform/scripts/production/start_uwsgi.sh
