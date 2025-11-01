#!/bin/bash

# URL als Variable übergeben
FILE_URL="$1"   # nimmt den ersten Parameter beim Skriptaufruf

# Optional: Name der Datei aus der URL extrahieren
FILE_NAME=$(basename "$FILE_URL")

# Datei herunterladen
wget -O "$FILE_NAME" "$FILE_URL"

# Ausgabe
echo "Datei $FILE_NAME wurde heruntergeladen von $FILE_URL"

# das alte backup löschen
rm -r bedrock-server.bak

# neues backup erstellen.
mv bedrock-server bedrock-server.bak 
unzip $FILE_NAME -d bedrock-server

rm -f $FILE_NAME

# Kopieren Konfiguration
cp bedrock-server.bak/server.properties bedrock-server
cp -r bedrock-server.bak/worlds bedrock-server
cp bedrock-server.bak/permissions.json bedrock-server
cp -r bedrock-server.bak/worlds bedrock-server
