CREATE SCHEMA posto_saude_vacina;

-- TABELAS

CREATE TABLE IF NOT EXISTS agente_de_saude (
	agente_id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	cpf VARCHAR(11)
);

CREATE TABLE IF NOT EXISTS posto_Agente (
	posto_agente_id INTEGER,
	posto_de_saude_id INTEGER
);

CREATE TABLE IF NOT EXISTS posto_de_saude (
	posto_de_saude_id SERIAL PRIMARY KEY,
	endereco_posto_id INTEGER,
	nome_posto VARCHAR(100),
	telefone_posto VARCHAR(11)
);

CREATE TABLE IF NOT EXISTS endereco (
	endereco_id SERIAL PRIMARY KEY,
	cep VARCHAR(8),
	bairro VARCHAR(20),
	rua VARCHAR(50),
	numero INTEGER
);


CREATE TABLE IF NOT EXISTS posto_lote (
	posto_de_saude_id INTEGER,
	lote_id INTEGER
);

CREATE TABLE IF NOT EXISTS lote (
	lote_id SERIAL PRIMARY KEY,
	qtd_vacina INTEGER,
	data_validade DATE
);

CREATE TABLE IF NOT EXISTS lote_vacina (
	lote_id INTEGER,
	vacina_id INTEGER
);

CREATE TABLE IF NOT EXISTS vacina (
	vacina_id SERIAL PRIMARY KEY,
	nome_vacina VARCHAR(100),
	quantidade INTEGER
);

CREATE TABLE IF NOT EXISTS fabricante_vacina (
	fabricante_id INTEGER,
	vacina_id INTEGER
);

CREATE TABLE IF NOT EXISTS fabricante (
	fabricante_id SERIAL PRIMARY KEY,
	nome_fabricante VARCHAR(100),
	telefone VARCHAR(11)
);

CREATE TABLE IF NOT EXISTS lote_cidadao (
	lote_id INTEGER,
	cidadao_id INTEGER
);

CREATE TABLE IF NOT EXISTS cidadao (
	cidadao_id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	cpf VARCHAR(11),
	data_nascimento DATE,
	endereco_id INTEGER
)

-- RELACIONAMENTOS

ALTER TABLE posto_Agente 
    ADD FOREIGN KEY (posto_agente_id)  
    REFERENCES agente_de_saude(agente_id);

ALTER TABLE posto_Agente
    ADD FOREIGN KEY (posto_de_saude_id)  
    REFERENCES posto_de_saude(posto_de_saude_id);

ALTER TABLE posto_lote
	ADD FOREIGN KEY (posto_de_saude_id)  
	REFERENCES posto_de_saude(posto_de_saude_id);

ALTER TABLE posto_lote
	ADD FOREIGN KEY (lote_id)  
	REFERENCES lote(lote_id);

ALTER TABLE lote_vacina
	ADD FOREIGN KEY (lote_id)  
	REFERENCES lote(lote_id);

ALTER TABLE lote_vacina
	ADD FOREIGN KEY (vacina_id)  
	REFERENCES vacina(vacina_id);

ALTER TABLE fabricante_vacina
	ADD FOREIGN KEY (vacina_id)  
	REFERENCES vacina(vacina_id);

ALTER TABLE fabricante_vacina
	ADD FOREIGN KEY (fabricante_id)  
	REFERENCES fabricante(fabricante_id);


ALTER TABLE lote_cidadao
	ADD FOREIGN KEY (lote_id)  
	REFERENCES lote(lote_id);

ALTER TABLE lote_cidadao
	ADD FOREIGN KEY (cidadao_id)  
	REFERENCES cidadao(cidadao_id);

ALTER TABLE cidadao
	ADD FOREIGN KEY (endereco_id)  
	REFERENCES endereco(endereco_id);

ALTER TABLE posto_de_saude
	ADD FOREIGN KEY (endereco_posto_id)  
	REFERENCES endereco(endereco_id);

