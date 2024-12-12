# Script de Automação para Gerenciamento de Portas em Switch ♻️✅
Este script foi desenvolvido para reiniciar (desativar e reativar) uma porta específica de um switch via SSH. Ele utiliza a linguagem Expect para automatizar as interações com o terminal SSH, enviando comandos para o dispositivo de rede.

Funcionalidades<br>
Conecta-se ao switch via SSH usando credenciais fornecidas.<br>
Entra no modo privilegiado e no modo de configuração.<br>
Seleciona uma interface específica e reinicia a porta (comandos shutdown e no shutdown).<br>
Finaliza a conexão de forma segura.<br>

Pré-requisitos<br>
Dependências:<br>

O Expect deve estar instalado no ambiente onde o script será executado. Você pode instalá-lo em sistemas baseados em Debian/Ubuntu com o comando:<br>
bash<br>
Copiar código<br>

"""sudo apt-get install expect"""<br>

Acesso ao Switch:<br>

O switch deve permitir conexões SSH.<br>
O usuário fornecido deve ter permissões para executar comandos administrativos.<br>
Configurações no Zabbix (caso usado com o Zabbix):<br>

Certifique-se de que o Zabbix está configurado para permitir scripts externos, com a opção (AllowKey=system.run[*]) configurada no (zabbix_agentd.conf.)<br>

# Como Usar<br>
Salve o código em um arquivo chamado, por exemplo, reboot_port.sh.<br>
Torne o arquivo executável:<br>
bash<br>
Copiar código<br>

chmod +x reboot_port.sh<br>

Execute o script: <br>
bash<br>
Copiar código<br>

./reboot_port.sh<br>

# Integrando ao Zabbix 👍<br>

Criar um Item no Zabbix<br>

Vá para Configuração > Hosts e selecione o host correspondente.<br>
e click no nome do host exp: sw_azul<br>
Interfaces: adicionar um "agente"<br>
IP padrão do agente: 127.0.0.1 e porta 10050<br>
>> Atulizar as confirgurações<br>
<br>
Vá para Administração > Scripts > Novo script.<br>
Nome: nome_do_seu_Script.<br>
<br>
Scope: Operação de Ação. <br>
Type: Script. <br>
Executar em: Sevidor Zabbix. <br>
Comandos: ./usr/lib/zabbix/externalscripts/reboot.sh (aonde está seu arquivo no diretorio) <br>
Grupo: todos. <br>
<br>
Configuração > Ações > Trigger actions.<br>
Criar uma nova.<br>
Nome: o que você preferir.<br>
Tipo do calculo; E/ou.<br>
Condições: trigger igual a (sw_azul) link down (aqui depende de como está o seu alarme).<br>
Ativo: ✅<br>
<br>
Operações: <br>
Operation: nome_do_seu_Script.<br>
Lista de destinos.<br>
Host atual: ✅<br>
Host: sw_azul.<br>
<br><br>
✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅
