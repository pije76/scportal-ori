#!/bin/bash
sleep sleep $(( ( RANDOM % 30 ) + 1 ))m
/home/portal/ve/bin/python gridplatform/manage.py fetch_nordpool
