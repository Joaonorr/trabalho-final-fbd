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
cursor.execute("""
                DROP TABLE vacina;
                DROP TABLE posto_lote;
                DROP TABLE posto_de_saude;
                DROP TABLE posto_agente;
                DROP TABLE lote_vacina;
                DROP TABLE lote_cidadao;
                DROP TABLE lote;
                DROP TABLE fornecedor_vacina;
                DROP TABLE fornecedor;
                DROP TABLE endereco_posto;
                DROP TABLE endereco_cidadao;
                DROP TABLE endereco_agente;
                DROP TABLE endereco;
                DROP TABLE cidadao;
                DROP TABLE agente_de_saude;
                DROP TABLE agente_posto;

            """)

cursor.query
con.commit()
cursor.close()
con.close()
print("Dados apagados com sucesso!")
