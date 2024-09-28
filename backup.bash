#!/bin/bash

VERDE='\e[32m'
VERMELHO='\e[31m'
RESETA='\e[m'

Menu() {
if [ "$1" == "--cron" ]; then
    cron_backup
else
echo "------------------------------------------"
echo "Opções para a realização de Backup:"
echo
echo "1. Gerar cópia de segurança de arquivo"
echo "2. Atulizar cópia de segurança de arquivo"
echo "3. Gerar cópia de segurança de diretório (pasta)"
echo "4. Atulizar cópia de segurança de diretório (pasta)"
echo "5. Sair do Programa"
echo
echo -n "Qual opção desejada?:"
read opcao
case $opcao in
    1) Criar_backup_Arq ;;
    2) Atualizar_backup_Arq ;;
    3) Criar_backup_Dir ;;
    4) Atualizar_backup_Dir ;;
    5) echo ; exit ;;
    *) echo ; echo -e "${VERMELHO}Opção escolhida inváida.${RESETA}" ; echo ; Menu ;;
esac
echo
echo -n "Digite o intevalo do cron desejada (Ex:'* * * * *' para executar a cada minuto):"
read intervalo_cron
script_path=$(realpath "$0")
(crontab -l 2>/dev/null; echo "$intervalo_cron $script_path --cron") | crontab -
echo
echo -e "${VERDE}Foi concluído o backup de $origem em $destino, registrado em registro_backups.log${RESETA}"
echo
Menu
fi
}

cron_backup() {
      origem=$(cat /tmp/backup_origem)
      destino=$(cat /tmp/backup_destino)
      rsync -uahv "$origem" "$destino"
      echo "Backup de $origem salvo em $destino data: $(date)" >> registro_backups.log
}

Criar_backup_Arq() {
clear
while [ ! -e "$origem" ]; do
echo 'Digite o arquivo de origem, desde a raiz (Ex:/home/usuário/exemplo.txt):'
    read origem
    if [[ ! -e "$origem" ]]; then
      echo -e "${VERMELHO}$origem --> Arquivo inexistente.${RESETA}"
      echo
    fi
done
   echo
   echo 'Digite um diretório (novo ou existente) para destino do arquivo, desde a raiz (Ex:/home/usuário/NovoDiretório):'
    read destino
    if [ ! -d "$destino" ]; then
      mkdir -p $destino
     fi
     echo "$origem" > /tmp/backup_origem
     echo "$destino" > /tmp/backup_destino
}

Atualizar_backup_Arq() {
clear
while [ ! -e "$origem" ]; do
echo 'Digite o arquivo de origem, desde a raiz (Ex:/home/usuário/exemplo.txt):'
    read origem
    if [[ ! -e "$origem" ]]; then
      echo -e "${VERMELHO}$origem --> Arquivo inexistente.${RESETA}"
      echo
    fi
done
   while [ ! -d "$destino" ] ; do
       echo
       echo 'Digite o diretório destino da atualização do arquivo, desde a raiz (Ex:/home/usuário/Diretório):'
       read destino
       if [ ! -d "$destino" ]; then
       echo "${VERMELHO}$destino --> Diretório inexistente.${RESETA}"
       echo
       fi
   done
   echo "$origem" > /tmp/backup_origem
   echo "$destino" > /tmp/backup_destino
}

Criar_backup_Dir() {
clear
while [ ! -d "$origem" ]; do
     echo 'Digite o dirétorio de origem, desde a raiz (Ex:/home/usuário/Documentos):'
     read origem
     if [ ! -d "$origem" ]; then
     echo -e "${VERMELHO}$origem --> Diretório inexistente.${RESETA}"
     echo
     fi
done
    echo
    echo 'Digite um diretório (novo ou existente) para destino, desde a raiz (Ex:/home/usuário/NovoDiretório):'
    read destino
    if [ ! -d "$destino" ]; then
      mkdir -p $destino
      fi
      echo "$origem" > /tmp/backup_origem
      echo "$destino" > /tmp/backup_destino
}

Atualizar_backup_Dir() {
clear
while [ ! -d "$origem" ]; do
     echo 'Digite o dirétorio de origem, desde a raiz (Ex:/home/usuário/Documentos):'
     read origem
     if [ ! -d "$origem" ]; then
     echo -e "${VERMELHO}$origem --> Diretório inexistente.${RESETA}"
     echo
     fi
done
   while [ ! -d "$destino" ]; do
       echo
       echo 'Digite o diretório destino da atualização, desde a raiz (Ex:/home/usuário/Diretório):'
       read destino
       if [ ! -d "$destino" ]; then
       echo -e "${VERMELHO}$destino --> Diretório inexistente.${RESETA}"
       echo
       fi
   done
   echo "$origem" > /tmp/backup_origem
   echo "$destino" > /tmp/backup_destino
}

clear
Menu "$@"
