import sys
import hmac
import base64

assert len(sys.argv) == 2
jwt = sys.argv[1]
print(jwt)

DELIMITER = '.'
words = jwt.split(DELIMITER)
assert len(words) == 3

print(words[2]) # Print tag for debugging.

data = words[0] + DELIMITER + words[1]
# See https://stackoverflow.com/a/43882903.
# Note comment at https://stackoverflow.com/questions/31848293/python3-and-hmac-how-to-handle-string-not-being-binary#comment125847252_43882903.
data = data.encode('ascii')

key = b'crapi'
digest = hmac.new(key, msg=data, digestmod='sha256').digest()
print(base64.urlsafe_b64encode(digest))
