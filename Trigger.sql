CREATE DATABASE Livraria;
USE Livraria;

CREATE TABLE Autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
);

CREATE TABLE Livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    genero VARCHAR(50),
    preco DECIMAL(10, 2),
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor)
);

CREATE TABLE Vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT,
    data_venda DATE,
    quantidade INT,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);

INSERT INTO Autores (nome, nacionalidade) VALUES
('Gabriel Garcia Marquez', 'Colombiana'),
('Jane Austen', 'Britânica'),
('Mark Twain', 'Americana');

INSERT INTO Livros (titulo, genero, preco, id_autor) VALUES
('Cem Anos de Solidão', 'Romance', 39.90, 1),
('Orgulho e Preconceito', 'Romance', 29.90, 2),
('As Aventuras de Tom Sawyer', 'Ficção', 19.90, 3);

DELIMITER //

CREATE TRIGGER after_venda_insert
AFTER INSERT ON Vendas
FOR EACH ROW
BEGIN
    DECLARE preco DECIMAL(10, 2);

    -- Obter o preço do livro vendido
    SELECT preco INTO preco FROM Livros WHERE id_livro = NEW.id_livro;

    -- Atualizar o valor_total da venda
    UPDATE Vendas
    SET valor_total = NEW.quantidade * preco
    WHERE id_venda = NEW.id_venda;
END//

DELIMITER ;

INSERT INTO Vendas (id_livro, data_venda, quantidade) VALUES
(1, '2024-11-24', 3);

SELECT * FROM Vendas;
