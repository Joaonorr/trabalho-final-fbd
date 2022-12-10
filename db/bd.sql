-- TABELAS

CREATE TABLE IF NOT EXISTS agente_de_saude (
	agente_id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	rg VARCHAR(9) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	email VARCHAR(100) NOT NULL,
	senha VARCHAR(100) NOT NULL,
	endereco_id INTEGER,
	tipo_sanguineo VARCHAR(3),
	data_nascimento DATE NOT NULL,
	data_moficiacao TIMESTAMP,
	data_criacao TIMESTAMP NOT NULL
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
	data_moficiacao TIMESTAMP,
	data_criacao TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS endereco (
	endereco_id SERIAL PRIMARY KEY,
	cidade VARCHAR(50),
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
	nome_vacina VARCHAR(100),
	quantidade_doses INTEGER,
	data_moficiacao TIMESTAMP,
	data_criacao TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS fornecedor_vacina (
	fornecedor_id INTEGER,
	vacina_id INTEGER	
);

CREATE TABLE IF NOT EXISTS fornecedor (
	fornecedor_id SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	email VARCHAR(100),
	cnpj VARCHAR(14),
	telefone VARCHAR(11)
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
	cpf VARCHAR(11) NOT NULL,
	rg VARCHAR(9) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
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

