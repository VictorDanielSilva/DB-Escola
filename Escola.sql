-- Cria o banco de dados ESCOLA
CREATE DATABASE ESCOLA;

-- Seleciona o banco de dados ESCOLA para uso
USE ESCOLA;

-- Cria a tabela ALUNO com os atributos especificados
CREATE TABLE ALUNO (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);
