CREATE DATABASE IF NOT EXISTS ecommerce_pro;
USE ecommerce_pro;

-- Tabela Pai Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Endereco VARCHAR(255) NOT NULL,
    TipoCliente ENUM('PF', 'PJ') NOT NULL
);

-- Especialização PF e PJ
CREATE TABLE PessoaFisica (
    idPessoaFisica INT AUTO_INCREMENT PRIMARY KEY,
    CPF CHAR(11) NOT NULL UNIQUE,
    Nome VARCHAR(150) NOT NULL,
    idCliente INT,
    CONSTRAINT fk_pf_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

CREATE TABLE PessoaJuridica (
    idPessoaJuridica INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    RazaoSocial VARCHAR(150) NOT NULL,
    idCliente INT,
    CONSTRAINT fk_pj_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

-- Refinamento Entrega (Status e Rastreio)
CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    StatusEntrega ENUM('Postado', 'Em trânsito', 'Entregue') DEFAULT 'Postado',
    CodigoRastreio VARCHAR(50) UNIQUE,
    DataEstimada DATE
);

-- Pedidos vinculados a Clientes e Entregas
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    StatusPedido VARCHAR(45) DEFAULT 'Processando',
    TotalPedido DECIMAL(10,2) NOT NULL,
    idCliente INT,
    idEntrega INT UNIQUE,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_pedido_entrega FOREIGN KEY (idEntrega) REFERENCES Entrega(idEntrega)
);

-- Pagamentos (Múltiplas formas por pedido)
CREATE TABLE Pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    TipoPagamento ENUM('Cartão', 'PIX', 'Boleto') NOT NULL,
    ValorPagamento DECIMAL(10,2) NOT NULL,
    idPedido INT,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);
