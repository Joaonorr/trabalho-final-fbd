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
                INSERT INTO agente_de_saude (nome, cpf, rg, telefone, email, senha, tipo_sanguineo, data_nascimento, data_criacao) 
            VALUES ('iago yuri viana', '98728120396', '466442762', '53991576404', 'iago-viana81@konzeption.com.br', '1AOGaqmMhD', 'B-', '15-01-1942', '2022-12-09 16:35:56'),
            ('miguel yuri dias', '47722895344', '332383891', '88989006890', 'miguel_dias@jpmanager.com.br', 'GG2ltfcagW', 'AB+', '01-08-1948', '2022-12-09 16:35:56'),
            ('paulo filipe benício freitas', '07050326208', '502304510', '62999878148', 'paulofilipefreitas@lukin4.com.br', 'ot0mcZ0LRi', 'O-', '01-03-1977', '2022-12-09 16:35:56'),
            ('bruna luzia adriana assis', '02617178129', '142121605', '41999346641', 'bruna_assis@eclatt.com.br', '3OlBywu43U', 'AB+', '23-03-1980', '2022-12-09 16:35:56'),
            ('miguel ryan nathan cavalcanti', '46266494086', '506983092', '11986651081', 'miguel-cavalcanti81@supracolor.com.br', 'yPpCCCSg9N', 'O-', '18-06-1962', '2022-12-09 16:35:56'),
            ('elisa sabrina alves', '98045001674', '332668447', '83988742194', 'elisa.sabrina.alves@yahooo.com.br', 'Dr4cFteNll', 'AB+', '16-10-1979', '2022-12-09 16:35:56'),
            ('rodrigo ian de paula', '39346465069', '282753916', '27989954268', 'rodrigo.ian.depaula@profemme.com.br', 'Y5DWN4h9MD', 'O-', '07-12-2000', '2022-12-09 16:35:56'),
            ('ana analu souza', '32545402206', '464085883', '73992984326', 'ana-souza98@baltico.com.br', 'NFKHwXIWMh', 'O-', '08-01-1952', '2022-12-09 16:35:56'),
            ('sophie laís vanessa moreira', '62315457254', '266646074', '91999191820', 'sophielaismoreira@portalpublicidade.com.br', 'qrZirfBqX2', 'A+', '16-05-1982', '2022-12-09 16:35:56'),
            ('joana alana rezende', '82868447341', '351215086', '73995197989', 'joana_rezende@its.jnj.com', 'hqrhJH0NjK', 'AB+', '09-05-1949', '2022-12-09 16:35:56'),
            ('giovana isis tereza almada', '50792971825', '471919330', '61999529766', 'giovana_almada@tita.com.br', 'LJSptngjSI', 'A+', '06-11-1965', '2022-12-09 16:35:56'),
            ('lorenzo leonardo diego sales', '21071227416', '305954982', '91985925430', 'lorenzo_leonardo_sales@agenciadbd.com', 'xg7NqW27aq', 'B+', '27-05-1951', '2022-12-09 16:35:56'),
            ('olivia débora fátima nunes', '31468901354', '219107117', '47993574022', 'oliviadeboranunes@claro.com.br', 'Wd0YefKaQi', 'O-', '01-03-1983', '2022-12-09 16:35:56'),
            ('benjamin breno da costa', '15265050701', '115570895', '43997406287', 'benjamin_breno_dacosta@clinicamedicofacil.com.br', 'u4XgjfdpN8', 'O-', '04-11-1998', '2022-12-09 16:35:56'),
            ('igor césar moraes', '66451226750', '115424295', '96985525524', 'igorcesarmoraes@w3ag.com', 'NOPOGDe0KX', 'AB-', '10-05-1978', '2022-12-09 16:35:56'),
            ('agatha isabela benedita das neves', '28310984758', '435673336', '62999038536', 'agatha.isabela.dasneves@eximiart.com.br', 'rmgkAptDS6', 'O+', '21-03-2002', '2022-12-09 16:35:56'),
            ('mateus thiago rodrigues', '85502403629', '424955519', '87983991470', 'mateus.thiago.rodrigues@iahoo.com', 'p7r377Ot3a', 'A-', '06-12-1971', '2022-12-09 16:35:56'),
            ('osvaldo leandro ribeiro', '48833357120', '414743325', '65996510084', 'osvaldoleandroribeiro@manjubinhafilmes.com.br', 'ZpTijPdeiX', 'A-', '06-06-1998', '2022-12-09 16:35:56'),
            ('daniela maya almeida', '60193871513', '170632611', '84991208899', 'danielamayaalmeida@negleribeiro.com', 'DuXFgHIUB5', 'O+', '09-02-1978', '2022-12-09 16:35:56'),
            ('benício thales galvão', '36260470673', '140508107', '61987008265', 'beniciothalesgalvao@bessa.net.br', 'o2HXz4JX18', 'A+', '11-01-1954', '2022-12-09 16:35:56'),
            ('giovanna mirella assunção', '74702706632', '381831474', '27983072616', 'giovanna_assuncao@contjulioroberto.com.br', 'btfZymLKqd', 'A-', '22-08-1979', '2022-12-09 16:35:56'),
            ('sérgio manoel bernardo da silva', '80103207651', '176032551', '96982663412', 'sergio_manoel_dasilva@adherminer.com.br', 'GrO5ukaQxO', 'B+', '25-01-1982', '2022-12-09 16:35:56'),
            ('olivia luciana barros', '60760432538', '314467919', '86997082366', 'olivia_barros@mesquita.not.br', 'uxCawhAGWd', 'A-', '06-02-1961', '2022-12-09 16:35:56'),
            ('carla betina mariana pereira', '62409544207', '184744453', '83987185300', 'carla.betina.pereira@carubelli.com.br', 'CQJPTgcPMF', 'AB+', '16-08-1995', '2022-12-09 16:35:56'),
            ('gabriel lorenzo jesus', '77974828960', '319957275', '71994505298', 'gabriel_lorenzo_jesus@focusnetworks.com.br', 'hZYQnQUE9p', 'A+', '15-08-1999', '2022-12-09 16:35:56'),
            ('priscila aline vieira', '73861060418', '152858271', '66996766830', 'priscila_aline_vieira@ocaconsultoria.com', 'icQhLimNo2', 'B+', '04-02-1998', '2022-12-09 16:35:56'),
            ('melissa larissa nina rocha', '59247928893', '332877358', '65999817733', 'melissalarissarocha@bds.com.br', '5R22zNfDFq', 'O-', '26-08-1950', '2022-12-09 16:35:56'),
            ('márcio kevin fábio gonçalves', '36952104356', '253637673', '82982349494', 'marcio.kevin.goncalves@br.ibm.com', 'pCeQ24AeJd', 'B-', '25-03-1964', '2022-12-09 16:35:56'),
            ('nicole elaine heloise oliveira', '17667498016', '104137666', '81985034778', 'nicole_oliveira@embraer.com.br', '898qQn9m41', 'A+', '14-08-1993', '2022-12-09 16:35:56')
            """)

cursor.query
con.commit()
cursor.close()
con.close()
print("Dados inseridos com sucesso!")
