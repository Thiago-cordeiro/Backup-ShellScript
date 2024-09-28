# 💾 Backup - Sincronização e Automação

Este projeto visa simplificar a sincronização de arquivos e diretórios utilizando o comando **_rsync_**, garantindo a integridade dos dados e a confiabilidade dos *backups*. Ele realiza de forma eficaz a verificação e validação da origem e, também, do destino dos backups. Além de automatizar a sincronização em intervalos regulares através da execução do comando **_cron_**.

## 📝 Manual do Projeto

> Neste módulo serão apresentados os requisitos, permissões e instruções que deverão ser concedidos para a utilização do script em shell, a fim de que você obtenha êxito na criação e gestão de cópias de segurança na sua máquina local para o desenvolvimento e teste do script.

### 🔨 Funcionalidades
O script produzido fornece as seguintes funcionalidades:
- [X] Criar cópia de segurança de arquivo e/ou diretório.
- [X] Administrar os intervalos da sincronização dos *backups*.
- [X] Automação através do *Cron*.
- [X] Atualizar arquivos e/ou diretórios de cópia de segurança.
- [X] Verifica se origem e destino de dados são válidos. 

### 📋 Pré-requisitos

Para garantir que a execução do script ocorra sem equívocos, é essencial satisfazer algumas condições e seguir boas práticas. Segue algumas condições que devem ser consideradas para assegurar um processo de backup confiável e eficaz:

- Sistema Operacional Linux.
> Uma sugestão de SO é o *Ubuntu*, por sua praticidade e usabilidade.

- Instalação do *Rsync*.
```
$ sudo apt-get install rsync
```

- Instalação do *Cron*.
```
$ sudo apt-get update
$ sudo apt-get install cron
```

- Permissões de Execução(adequada).
```
$ chmod +x backup_script.bash
```


### 🔧 Orientações de utilização do Script

Conhecer o programa e seguir orientações básicas irá ajudá-lo a usufruir de forma mais efetiva as opções ofertadas pelo script, permitindo que você realize a tarefa desejada de maneira rápida e eficaz. Dessa maneira, este capítulo tem o intuito de demonstrar o passo a passo de como realizar o estilo de backup desejado:

1. Instale o arquivo *backup.bash*.

2. Verifique todos os pré-requisitos.
  
3. Abra o **terminal**.
> "Ctrl + Alt + T" é um atalho do Ubuntu para executar a inicialização do *terminal*.

4. Execute o script através do comando:
```
$ ./backup_script.bash
```
5. Digite a opção desejada entre as opções apresentadas no menu.

6. Digite a origem e o destino, respectivamente, do arquivo que deseja realizar uma cópia de segurança
> Necessita digitar desde a raiz, por exemplo: /home/usuário/exemplo.bash

7. Digite o intervalo desejado para que ocorra o backup e a sincronização.
> Digite o intervalo do cron (Ex: * * * * * para executar de 1 em 1 minuto).

8. Saia do programa, digitando 5 no menu. 

9. Espere o intervalo digitado na etapa anterior e, depois, confira se o backup foi gerado no destino correto junto ao registro de log no arquivo *registro.log*.


## ⚙️ Executando teste
> Neste módulo será apresentado um passo a passo de como verificar se o script está funcionando normalmente, sem irregularidades.

### 🗂️ Análise da geração do backup.

#### Verificando o diretório de backup:
> Abra o terminal e siga os passos a seguir:
1. No terminal digite o seguinte comando:  
   - $ls (comando para listar os conteúdos de um diretório)
   - Caso tenha achado o diretório escolhido para o backup use o comando cd e o nome do diretório de backup.

2. Digite cd (comando para navegar entre diretórios) e o nome do diretório para adentrar no backup;
   - Agora é só verificar se o arquivo ou o diretório escolhido foi copiado para o diretório de backup. 
---
#### Verificando o Arquivo de Log:
> Abra o terminal e siga os passos a seguir:
1. Digite ls (comando para listar os conteúdos de um diretório) para visualizar os diretórios existentes.
   - Caso tenha achado o diretório escolhido para o backup use o comando cd e o nome do diretório de backup.

2. Digite cd (comando para navegar entre diretórios) para ir ao diretório desejado.
   - Caso tenha achado o arquivo de log dentro do diretório escolhido, use o comando open para abrir o arquivo de log ou o comando cat para visualizar o conteúdo do arquivo.

3. Digite cat arquivo.log (comando para visualizar o conteúdo do arquivo)
> **Agora é só verificar se o registro do backup está de acordo com a opção de tempo selecionada no menu do script.**

4. Se o registro do backup estiver feito no arquivo de log o backup aconteceu sem problemas.


### 🗃️ Análise da atualização do backup.

Para verificar se as atualizações do backup de arquivos/diretórios selecionados foram realizadas, deve-se seguir os mesmos passos explicados no tópico anterior. Caso houver algum erro, execute o script novamente.

## 🛠️ Construído com

> O script foi criado a partir do comando RSYNC, o qual é capaz realizar cópias e sincronismo de arquivos e/ou diretórios. Ademais, para o agendamento de tarefas foi necessário a utilização do CRON, o qual é capaz de automatizar a execução de processos.

## 📌 Versão

Se encontra na *versão 1.0* o script.

## ✒️ Autores

Segue os nomes dos participantes e criadores do Projeto:

* **Matheus José Chaves de Lima** - *Documentação e Auxílio no Desenvolvimento do Script*.
* **Thiago de Lima de Assis Cordeiro** - *Desenvolvimento do Script*.


## 🎁 Agradecimento
> Gostaríamos de agradecer ao professor Dr. Mauro Antônio Alves Castro, por ter sido nosso orientador na disciplina de Administração de Sistemas na Universidade Federal do Paraná.
