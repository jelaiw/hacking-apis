Note Pycurl warning, may need to take a closer look at this sometime.

```sh
$ docker run --rm jelaiw/kali:0.8 wfuzz -L -z range,0-29 --sc 200 -f wfuzz.csv,csv http://reqres.in/api/users/FUZZ
 /usr/lib/python3/dist-packages/wfuzz/__init__.py:34: UserWarning:Pycurl is not compiled against Openssl. Wfuzz might not work correctly when fuzzing SSL sites. Check Wfuzz's documentation for more information.
default
default
********************************************************
* Wfuzz 3.1.0 - The Web Fuzzer                         *
********************************************************

Target: http://reqres.in/api/users/FUZZ
Total requests: 30

=====================================================================
ID           Response   Lines    Word       Chars       Payload        
=====================================================================

000000003:   200        0 L      10 W       280 Ch      "2"            
000000009:   200        0 L      10 W       288 Ch      "8"            
000000008:   200        0 L      10 W       284 Ch      "7"            
000000006:   200        0 L      10 W       284 Ch      "5"            
000000005:   200        0 L      10 W       272 Ch      "4"            
000000002:   200        0 L      10 W       280 Ch      "1"            
000000004:   200        0 L      10 W       274 Ch      "3"            
000000010:   200        0 L      10 W       280 Ch      "9"            
000000007:   200        0 L      10 W       280 Ch      "6"            
000000012:   200        0 L      10 W       286 Ch      "11"           
000000011:   200        0 L      10 W       282 Ch      "10"           
000000013:   200        0 L      10 W       284 Ch      "12"           

Total time: 0
Processed Requests: 30
Filtered Requests: 18
Requests/sec.: 0

```