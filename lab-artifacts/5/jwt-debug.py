import sys
import base64
import json

assert len(sys.argv) == 2
jwt = sys.argv[1]
print(jwt)

tokens = jwt.split('.')
assert len(tokens) == 3

# Decode and parse header into a dict.
header = json.loads(base64.urlsafe_b64decode(tokens[0]))
print(json.dumps(header, indent=4))

# Decode and parse payload into a dict.
# See https://stackoverflow.com/a/49459036.
# Also, see https://gist.github.com/perrygeo/ee7c65bb1541ff6ac770.
payload = json.loads(base64.urlsafe_b64decode(tokens[1] + '==')) # Kludge for incorrect padding.
print(json.dumps(payload, indent=4))
