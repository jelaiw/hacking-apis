#!/bin/sh
docker run --rm -t -p 5013:5013 -e WEB_HOST=0.0.0.0 dolevf/dvga:2.1.2
