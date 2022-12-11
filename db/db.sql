-- TABELAS

CREATE TABLE IF NOT EXISTS agente_de_saude (
	agente_id SERIAL PRIMARY KEY,
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

CREATE TABLE IF NOT EXISTS posto_agente (
	posto_agente_id INTEGER,
	posto_de_saude_id INTEGER
);

CREATE TABLE IF NOT EXISTS posto_de_saude (
	posto_de_saude_id SERIAL PRIMARY KEY,
	endereco_posto_id INTEGER,
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

ALTER TABLE fornecedor_vacina
	ADD FOREIGN KEY (vacina_id)  
	REFERENCES vacina(vacina_id);

ALTER TABLE fornecedor_vacina
	ADD FOREIGN KEY (fornecedor_id)  
	REFERENCES fornecedor(fornecedor_id);


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

