#! /usr/bin/env bash
curl -X POST "https://api.dynu.com/v2/dns/$(cat domain_id)/record/$(cat txt_id)"\
 -H  "accept: application/json"\
 -H  "API-Key: $(cat apikey)"\
 -H  "Content-Type: application/json"\
 -d "{\"nodeName\":\"_acme-challenge\",\"recordType\":\"TXT\",\"ttl\":30,\"state\":true,\"group\":\"\",\"textData\":\"null\"}"
