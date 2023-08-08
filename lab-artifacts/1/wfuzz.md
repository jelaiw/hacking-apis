Note Pycurl warning, may need to take a closer look at this sometime.

```sh
$ wfuzz -L -z range,0-28 --sc 200 -f out.csv,csv http://reqres.in/api/users/FUZZ
 /usr/lib/python3/dist-packages/wfuzz/__init__.py:34: UserWarning:Pycurl is not compiled against Openssl. Wfuzz might not work correctly when fuzzing SSL sites. Check Wfuzz's documentation for more information.
********************************************************
* Wfuzz 3.1.0 - The Web Fuzzer                         *
********************************************************

Target: http://reqres.in/api/users/FUZZ
Total requests: 29

=====================================================================
ID           Response   Lines    Word       Chars       Payload                                                                                       
=====================================================================

000000003:   200        0 L      10 W       280 Ch      "2"                                                                                           
000000007:   200        0 L      10 W       280 Ch      "6"                                                                                           
000000006:   200        0 L      10 W       284 Ch      "5"                                                                                           
000000012:   200        0 L      10 W       286 Ch      "11"                                                                                          
000000013:   200        0 L      10 W       284 Ch      "12"                                                                                          
000000002:   200        0 L      10 W       280 Ch      "1"                                                                                           
000000011:   200        0 L      10 W       282 Ch      "10"                                                                                          
000000009:   200        0 L      10 W       288 Ch      "8"                                                                                           
000000010:   200        0 L      10 W       280 Ch      "9"                                                                                           
000000005:   200        0 L      10 W       272 Ch      "4"                                                                                           
000000008:   200        0 L      10 W       284 Ch      "7"                                                                                           
000000004:   200        0 L      10 W       274 Ch      "3"                                                                                           

Total time: 0
Processed Requests: 29
Filtered Requests: 17
Requests/sec.: 0

```