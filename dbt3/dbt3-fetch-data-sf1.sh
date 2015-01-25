#!/bin/sh

pushd /tmp

if [ ! -f dbt3-sf1.zip ]; then
    wget http://www.uptime.jp/downloads/dbt3/dbt3-sf1.zip
fi

rm -rf /tmp/dbt3
unzip dbt3-sf1.zip

popd

ls -l /tmp/dbt3

