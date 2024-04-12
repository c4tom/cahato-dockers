#!/bin/sh


if [ -f "wp-config.php" ]; then
  wp --allow-root core version --extra
  wp --allow-root plugin list
  wp --allow-root db size --all-tables --size_format=kb
fi