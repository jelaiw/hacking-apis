#!/bin/sh
# See https://github.com/wallarm/jwt-secrets.
# See https://wordlists.assetnote.io/.
wget -r --no-parent -R "index.html*" https://wordlists-cdn.assetnote.io/data/ -nH
