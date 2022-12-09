from termcolor import colored 
conexao_sucesso = colored(f'{chr(10003)} Banco de dados conectado com sucesso', 'green', attrs=['bold'])
conexao_falha = colored(f'{chr(10005)} Falha ao conectar com o banco de dados\n', "red", attrs=['bold'])
conexao_falha += "Verefique se os dados de conexão estão corretos e se o banco de dados está ativo"