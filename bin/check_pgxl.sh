#!/bin/sh

# Copyright(c) 2013 Uptime Technologies, LLC.

LANG=C
export LANG

PSQL_OPTS="-p $PGPORT -U $PGUSER"

psql $PSQL_OPTS -A -F, -c 'select name,setting,unit from pg_settings' postgres | grep -v '^(' > pg_settings.log
