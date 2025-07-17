#!/bin/bash

for HOST in 192.168.56.151 192.168.56.152; do
  echo "Adicionando fingerprint do host $HOST"
  ssh-keyscan -H "$HOST" >> ~/.ssh/known_hosts
done

echo "Fingerprints adicionados!"
