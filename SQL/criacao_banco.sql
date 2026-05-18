CREATE DATABASE IF NOT EXISTS hotel_nebula;
USE hotel_nebula;

CREATE TABLE hospedes(
	id_hospede INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE quartos(
	id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) UNIQUE NOT NULL,
    andar VARCHAR(2) NOT NULL,
	tipo VARCHAR(50) NOT NULL,
    capacidade INT NOT NULL,
    preco_diaria DECIMAL(10,2) NOT NULL CHECK (preco_diaria > 0),
    status_quarto VARCHAR(20) NOT NULL
);

CREATE TABLE servicos(
	id_servico INT AUTO_INCREMENT PRIMARY KEY,
    servico_nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE funcionarios(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL CHECK (salario > 0),
    data_admissao DATE NOT NULL,
    status_funcionario VARCHAR(50) NOT NULL
);

CREATE TABLE reservas(
	id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    data_checkin DATE NOT NULL,
    data_checkout DATE NOT NULL,
    valor_orcamento DECIMAL(10,2) NOT NULL,
    status_reserva VARCHAR(20),
    FOREIGN KEY (id_hospede) REFERENCES hospedes (id_hospede),
    FOREIGN KEY (id_quarto) REFERENCES quartos (id_quarto)
);

CREATE TABLE hospedagens(
	id_hospedagem INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT UNIQUE NOT NULL,
    checkin_real DATETIME NOT NULL,
    checkout_real DATETIME,
    FOREIGN KEY (id_reserva) REFERENCES reservas (id_reserva)
);

CREATE TABLE pagamentos(
	id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_hospedagem INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    metodo VARCHAR(30) NOT NULL,
    data_pagamento DATE,
    FOREIGN KEY (id_hospedagem) REFERENCES hospedagens (id_hospedagem)
);

CREATE TABLE feedbacks(
	id_feedback INT AUTO_INCREMENT PRIMARY KEY,
	id_hospedagem INT UNIQUE,
    quant_estrelas INT CHECK (quant_estrelas BETWEEN 0 AND 5),
    comentario TEXT,
    FOREIGN KEY (id_hospedagem) REFERENCES hospedagens (id_hospedagem)
);

CREATE TABLE servicos_realizados(
	id_servico_realizado INT AUTO_INCREMENT PRIMARY KEY,
    id_hospedagem INT NOT NULL,
    id_servico INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_realizado DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL CHECK (valor >=0),
    FOREIGN KEY (id_hospedagem) REFERENCES hospedagens (id_hospedagem),
    FOREIGN KEY (id_servico) REFERENCES servicos (id_servico),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario)
);
