-- TABELAS

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


-- views
CREATE VIEW view_agentes AS
SELECT 
	agente_de_saude.agente_id,
	agente_de_saude.nome, 
	agente_de_saude.cpf, 
	agente_de_saude.rg, 
	agente_de_saude.telefone, 
	agente_de_saude.email, 
	agente_de_saude.tipo_sanguineo, 
	agente_de_saude.data_nascimento, 
	agente_de_saude.data_criacao, 
	endereco.cep, 
	endereco.estado, 
	endereco.cidade, 
	endereco.bairro, 
	endereco.rua, 
	endereco.numero
FROM 
	agente_de_saude, endereco, endereco_agente
WHERE 
	agente_de_saude.agente_id = endereco_agente.agente_id 
	AND 
	endereco_agente.endereco_id = endereco.endereco_id;



CREATE VIEW view_postos AS
SELECT 
	posto_de_saude.posto_de_saude_id,
	posto_de_saude.nome_posto, 
	posto_de_saude.telefone, 
	posto_de_saude.data_criacao, 
	endereco.cep, 
	endereco.estado, 
	endereco.cidade, 
	endereco.bairro, 
	endereco.rua, 
	endereco.numero
FROM
	posto_de_saude, endereco, endereco_posto
WHERE
	posto_de_saude.posto_de_saude_id = endereco_posto.posto_de_saude_id
	AND
	endereco_posto.endereco_id = endereco.endereco_id;


CREATE VIEW view_vacinas AS
SELECT 
	vacina.vacina_id,
	vacina.nome_vacina,
	vacina.quantidade_doses,
	fornecedor.nome,
	fornecedor.cnpj,
	fornecedor.telefone,
	fornecedor.email
FROM
	vacina, fornecedor, fornecedor_vacina
WHERE
	vacina.vacina_id = fornecedor_vacina.vacina_id
	AND
	fornecedor_vacina.fornecedor_id = fornecedor.fornecedor_id;