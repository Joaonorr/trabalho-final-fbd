import json
import os

# recebe uma string e retorna ela sem os pontos e traços
def tratar_cpf(cpf):
    if cpf != None:
        cpf = cpf.replace(".", "")
        cpf = cpf.replace("-", "")
        return cpf
    return None

# recebe uma string e retorna ela em minúsculo
def tratar_nome(nome):
    if nome != None:
        nome = nome.lower()
        return nome
    return None

# recebe um dicionário e retorna uma string com o script de inserção
def tratar_dados(dados):
    try:
        insert_script = "INSERT INTO pessoa (nome, cpf) \n      VALUES"
        primeiro = True
        for pessoa in dados:
            nome = tratar_nome(pessoa["nome"])
            cpf = tratar_cpf(pessoa["cpf"])
            a = chr(39)
            if primeiro:
                insert_script += f'({a}{nome}{a}, {a}{cpf}{a}),\n'
                primeiro = False
                continue

            insert_script += '            '
            insert_script += f'({a}{nome}{a} {a}{cpf}{a}),\n'

        # cria o diretório script caso não exista
        if not os.path.exists("../script"):
            try:
                os.mkdir("../script")
            except OSError:
                print("Erro ao criar o diretório 'script'")
                exit(1)
    except:
        print("Erro ao criar o script de inserção")
        exit(1) 

    try:
        # cria o arquivo insert_script.sql e escreve o script de inserção        
        with open("../script/insert_script.sql", "w", encoding='utf-8') as script:
            script.write(insert_script[:-1] + ';')
    except OSError:
        print("Erro ao criar o arquivo 'insert_script.sql'")
        exit(1)        
            

def main():
    # abre o arquivo json e chama a função tratar_dados
    with open("../json/agentes.json", encoding='utf-8') as meu_json:
        dados = tratar_dados(json.load(meu_json))

# main
if __name__ == '__main__':
    main()
    