#!/usr/bin/expect -f

# Configurações do Switch
set switch_ip "10.0.251.234"
set username "ubnt"
set password "netflex@123"
set enable_password "netflex@123"
set interface "0/3"

# Início da conexão SSH
spawn ssh $username@$switch_ip
expect {
    "Are you sure you want to continue connecting" {
        send "yes\r"
        expect "Password:"
    }
    "Password:" {}
}

# Enviar senha
send "$password\r"

# Entrar no modo privilegiado
expect {
    ">" {
        send "enable\r"
    }
    timeout {
        puts "Erro: Não foi possível entrar no modo EXEC."
        exit 1
    }
}
expect {
    "Password:" {
        send "$enable_password\r"
    }
    timeout {
        puts "Erro: Não foi possível enviar a senha do modo enable."
        exit 1
    }
}

# Entrar no modo de configuração global
expect "#"
send "configure\r"

# Selecionar a interface e reiniciá-la
expect "(Config)#"
send "interface $interface\r"
expect "(Config-if)#"
send "no shutdown\r"

# Sair do modo de configuração
expect "(Config-if)#"
send "exit\r"
expect "(Config)#"
send "exit\r"

# Fechar a conexão
expect "#"
send "exit\r"
expect eof
