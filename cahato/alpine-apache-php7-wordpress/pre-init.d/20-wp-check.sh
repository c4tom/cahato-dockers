#!/bin/sh


if [ -f "wp-config.php" ]; then
  wp core version --extra
  wp plugin list
  wp db size --all-tables --size_format=kb
fi