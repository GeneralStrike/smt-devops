#!/bin/bash

# A script to restart supervisor if it has stopped.
# To be run every minute by cron.


if ps -A | grep supervisord > /dev/null
then
  echo "supervisord is running."
else
  echo "restarting supervisor."
  ~/bin/supervisord
fi
