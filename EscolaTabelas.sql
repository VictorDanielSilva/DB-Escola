CREATE DATABASE Escola;

CREATE TABLE Estudantes (
    id_estudante INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    idade INT,
    email VARCHAR(50)
);
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(50),
    descricao TEXT
);
CREATE TABLE Inscrições (
    id_inscrição INT PRIMARY KEY AUTO_INCREMENT,
    id_estudante INT,
    id_curso INT,
    data_inscrição DATE,
    FOREIGN KEY (id_estudante) REFERENCES Estudantes(id_estudante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

INSERT INTO Estudantes (nome, idade, email) VALUES
('Ana Silva', 20, 'ana.silva@example.com'),
('Bruno Souza', 22, 'bruno.souza@example.com'),
('Carla Dias', 19, 'carla.dias@example.com');

INSERT INTO Cursos (nome_curso, descricao) VALUES
('Matemática', 'Curso de Matemática Básica'),
('História', 'Curso de História do Brasil'),
('Biologia', 'Curso de Biologia Geral');

INSERT INTO Inscrições (id_estudante, id_curso, data_inscrição) VALUES
(1, 1, '2024-11-01'),
(2, 2, '2024-11-02'),
(3, 3, '2024-11-03'),
(1, 2, '2024-11-04'),
(2, 3, '2024-11-05');

SELECT Estudantes.nome, Cursos.nome_curso, Inscrições.data_inscrição
FROM Inscrições
JOIN Estudantes ON Inscrições.id_estudante = Estudantes.id_estudante
JOIN Cursos ON Inscrições.id_curso = Cursos.id_curso;

SELECT Cursos.nome_curso, COUNT(Inscrições.id_estudante) AS num_estudantes
FROM Cursos
JOIN Inscrições ON Cursos.id_curso = Inscrições.id_curso
GROUP BY Cursos.nome_curso;

SELECT Estudantes.nome, COUNT(Inscrições.id_curso) AS num_cursos
FROM Estudantes
JOIN Inscrições ON Estudantes.id_estudante = Inscrições.id_estudante
GROUP BY Estudantes.nome
HAVING COUNT(Inscrições.id_curso) > 1;
