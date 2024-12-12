# Script de Automação para Gerenciamento de Portas em Switch ♻️✅
Este script foi desenvolvido para reiniciar (desativar e reativar) uma porta específica de um switch via SSH. Ele utiliza a linguagem Expect para automatizar as interações com o terminal SSH, enviando comandos para o dispositivo de rede.

Funcionalidades
Conecta-se ao switch via SSH usando credenciais fornecidas.
Entra no modo privilegiado e no modo de configuração.
Seleciona uma interface específica e reinicia a porta (comandos shutdown e no shutdown).
Finaliza a conexão de forma segura.

Pré-requisitos
Dependências:

O Expect deve estar instalado no ambiente onde o script será executado. Você pode instalá-lo em sistemas baseados em Debian/Ubuntu com o comando:
bash
Copiar código

"""sudo apt-get install expect"""

Acesso ao Switch:

O switch deve permitir conexões SSH.
O usuário fornecido deve ter permissões para executar comandos administrativos.
Configurações no Zabbix (caso usado com o Zabbix):

Certifique-se de que o Zabbix está configurado para permitir scripts externos, com a opção (AllowKey=system.run[*]) configurada no (zabbix_agentd.conf.)

# Como Usar
Salve o código em um arquivo chamado, por exemplo, reboot_port.sh.
Torne o arquivo executável:
bash
Copiar código

chmod +x reboot_port.sh

Execute o script: 
bash
Copiar código

./reboot_port.sh

# Integrando ao Zabbix 👍

Criar um Item no Zabbix

Vá para Configuração > Hosts e selecione o host correspondente.
e click no nome do host exp: sw_azul
Interfaces: adicionar um "agente"
IP padrão do agente: 127.0.0.1 e porta 10050
>> Atulizar as confirgurações

Vá para Administração > Scripts > Novo script.
Nome: nome_do_seu_Script.
Scope: Operação de Ação.
Type: Script.
Executar em: Sevidor Zabbix.
Comandos: ./usr/lib/zabbix/externalscripts/reboot.sh (aonde está seu arquivo no diretorio)
Grupo: todos.

Configuração > Ações > Trigger actions.
##Criar uma nova.
##Nome: o que você preferir.
##Tipo do calculo; E/ou.
##Condições: trigger igual a (sw_azul) link down (aqui depende de como está o seu alarme).
##Ativo: ✅

Operações: 
Operation: nome_do_seu_Script.
Lista de destinos.
Host atual: ✅
Host: sw_azul.

✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅
