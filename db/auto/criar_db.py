import psycopg2 as pg
import sqlalchemy
from sqlalchemy import create_engine


cnx = 'postgresql://postgres:1234@localhost/fdb_final'
sqlalchemy.create_engine(cnx)

try:
    con = pg.connect(host='localhost', dbname= 'fdb_final', user='postgres', password= '1234')
except:
    print("Não foi possível conectar ao banco de dados")


cursor = con.cursor()
cursor.execute("""-- TABELAS

                CREATE TABLE IF NOT EXISTS agente_de_saude (
                    agente_id SERIAL PRIMARY KEY,
                    nome VARCHAR(100) NOT NULL,
                    cpf VARCHAR(11) UNIQUE NOT NULL,
                    rg VARCHAR(9) UNIQUE NOT NULL,
                    telefone VARCHAR(14) NOT NULL,
                    email VARCHAR(100) NOT NULL,
                    senha VARCHAR(100) NOT NULL,
                    tipo_sanguineo VARCHAR(3),
                    data_nascimento DATE NOT NULL,
                    data_moficiacao TIMESTAMP,
                    data_criacao TIMESTAMP NOT NULL
                );

                CREATE TABLE IF NOT EXISTS posto_agente (
                    posto_agente_id INTEGER,
                    posto_de_saude_id INTEGER
                );

                CREATE TABLE IF NOT EXISTS posto_de_saude (
                    posto_de_saude_id SERIAL PRIMARY KEY,
                    nome_posto VARCHAR(100) UNIQUE NOT NULL,
                    telefone VARCHAR(14) NOT NULL,
                    data_moficiacao TIMESTAMP,
                    data_criacao TIMESTAMP NOT NULL
                );

                CREATE TABLE IF NOT EXISTS endereco (
                    endereco_id SERIAL PRIMARY KEY,
                    cep VARCHAR(8) NOT NULL,
                    estado VARCHAR(2) NOT NULL,
                    cidade VARCHAR(50) NOT NULL,
                    bairro VARCHAR(20) NOT NULL,
                    rua VARCHAR(50) NOT NULL,
                    numero INTEGER NOT NULL,
                    data_moficiacao TIMESTAMP,
                    data_criacao TIMESTAMP NOT NULL
                );


                CREATE TABLE IF NOT EXISTS posto_lote (
                    posto_de_saude_id INTEGER,
                    lote_id INTEGER
                );

                CREATE TABLE IF NOT EXISTS lote (
                    lote_id SERIAL PRIMARY KEY,
                    qtd_vacina INTEGER,
                    data_validade DATE,
                    data_moficiacao TIMESTAMP,
                    data_criacao TIMESTAMP NOT NULL
                );

                CREATE TABLE IF NOT EXISTS lote_vacina (
                    lote_id INTEGER,
                    vacina_id INTEGER
                );

                CREATE TABLE IF NOT EXISTS vacina (
                    vacina_id SERIAL PRIMARY KEY,
                    nome_vacina VARCHAR(100) UNIQUE NOT NULL,
                    quantidade_doses INTEGER NOT NULL,
                    data_moficiacao TIMESTAMP,
                    data_criacao TIMESTAMP NOT NULL
                );

                CREATE TABLE IF NOT EXISTS fornecedor_vacina (
                    fornecedor_id INTEGER,
                    vacina_id INTEGER	
                );

                CREATE TABLE IF NOT EXISTS fornecedor (
                    fornecedor_id SERIAL PRIMARY KEY,
                    nome VARCHAR(100) UNIQUE NOT NULL,
                    email VARCHAR(100) NOT NULL,
                    cnpj VARCHAR(14) UNIQUE NOT NULL,
                    telefone VARCHAR(14) NOT NULL,
                    data_moficiacao TIMESTAMP,
                    data_criacao TIMESTAMP NOT NULL
                );

                CREATE TABLE IF NOT EXISTS lote_cidadao (
                    lote_id INTEGER,
                    cidadao_id INTEGER
                );

                CREATE TABLE IF NOT EXISTS cidadao (
                    cidadao_id SERIAL PRIMARY KEY,
                    nome VARCHAR(100) NOT NULL,
                    cpf VARCHAR(11) UNIQUE NOT NULL,
                    rg VARCHAR(9) UNIQUE NOT NULL,
                    telefone VARCHAR(14) NOT NULL,
                    email VARCHAR(100) NOT NULL,
                    senha VARCHAR(100) NOT NULL,
                    endereco_id INTEGER,
                    tipo_sanguineo VARCHAR(3),
                    data_nascimento DATE NOT NULL,
                    data_moficiacao TIMESTAMP,
                    data_criacao TIMESTAMP NOT NULL
                );

                CREATE TABLE IF NOT EXISTS endereco_cidadao (
                    endereco_id INTEGER,
                    cidadao_id INTEGER UNIQUE
                );

                CREATE TABLE IF NOT EXISTS endereco_posto (
                    endereco_id INTEGER,
                    posto_de_saude_id INTEGER UNIQUE
                );

                CREATE TABLE IF NOT EXISTS endereco_agente (
                    endereco_id INTEGER,
                    agente_id INTEGER UNIQUE
                );

                CREATE TABLE IF NOT EXISTS agente_posto (
                    agente_id INTEGER,
                    posto_de_saude_id INTEGER
                );

                """)
cursor.query
con.commit()
cursor.close()
con.close()
print("Tabelas criadas com sucesso!")

