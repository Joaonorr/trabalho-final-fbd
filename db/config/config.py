from sqlalchemy import create_engine

# conexão com o banco de dados
cnx = 'postgresql://postgres:1234@localhost/fbd_datebase'
sqlalchemy.create_engine(cnx)

