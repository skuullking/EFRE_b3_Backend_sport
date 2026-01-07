#!/bin/bash

# Attendre que MongoDB soit prêt
echo "Attente du démarrage de MongoDB..."
until mongosh --eval "db.version()" > /dev/null 2>&1; do
  sleep 1
done

echo "MongoDB est prêt. Import du CSV..."

# Importer le CSV dans la collection 'exercises'
mongoimport --db gimfit \
  --collection exercises \
  --type csv \
  --headerline \
  --file /megaGymDataset.csv

echo "Import du CSV terminé!"
