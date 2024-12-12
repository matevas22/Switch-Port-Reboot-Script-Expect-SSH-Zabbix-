# Script de Automação para Gerenciamento de Portas em Switch 
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

