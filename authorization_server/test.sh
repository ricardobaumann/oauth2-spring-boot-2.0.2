#!/bin/sh
TOKEN=`curl -s -u curl_client:user -X POST localhost:8082/oauth/token\?grant_type=client_credentials | egrep -o '[a-f0-9-]{20,}'`
echo "Got token for curl client as : $TOKEN"
curl localhost:8083/product/products -H "Authorization: Bearer $TOKEN"