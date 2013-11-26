#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

LANG=C
export LANG

psql -A -F, -c 'select name,setting,unit from pg_settings' -U postgres postgres | grep -v '^(' > pg_settings.log
