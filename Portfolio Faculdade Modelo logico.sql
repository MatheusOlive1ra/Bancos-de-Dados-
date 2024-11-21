create database db_sistema_faculdade;

use db_sistema_faculdade;

-- Tabela Professores
CREATE TABLE tbl_professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE
);

-- Tabela Cursos
CREATE TABLE tbl_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_termino DATE NOT NULL
);

-- Tabela Alunos
CREATE TABLE tbl_alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fk_cursos_id INT NOT NULL,
    FOREIGN KEY (fk_cursos_id) REFERENCES tbl_cursos(id)
);

CREATE TABLE tbl_telefone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_professores_id INT,
    fk_alunos_id INT,
    telefone VARCHAR(15) NOT NULL,
    FOREIGN KEY (fk_professores_id) REFERENCES tbl_professores(id),
    FOREIGN KEY (fk_alunos_id) REFERENCES tbl_alunos(id)
);

-- Tabela Turmas
CREATE TABLE tbl_turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_professores_id INT NOT NULL,
    fk_alunos_id INT NOT NULL,
    fk_cursos_id INT NOT NULL,
    FOREIGN KEY (fk_professores_id) REFERENCES tbl_professores(id),
    FOREIGN KEY (fk_alunos_id) REFERENCES tbl_alunos(id),
    FOREIGN KEY (fk_cursos_id) REFERENCES tbl_cursos(id)
);

-- Tabela Notas
CREATE TABLE tbl_notas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_alunos_id INT NOT NULL,
    fk_cursos_id INT NOT NULL,
    notas DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (fk_alunos_id) REFERENCES tbl_alunos(id),
    FOREIGN KEY (fk_cursos_id) REFERENCES tbl_cursos(id)
);

show tables;

-- Inserir um professor
INSERT INTO tbl_professores (nome, email, cpf)
VALUES ('Viviane Silva', 'vivianesilva@gmail.com', '23345678901');

-- Inserir um curso
INSERT INTO tbl_cursos (nome, data_termino)
VALUES ('Curso matematica', '2026-12-31');

-- Inserir um aluno
INSERT INTO tbl_alunos (cpf, nome, email, fk_cursos_id)
VALUES ('95965432100', ' silva','maria.silva@gmail.com', 1);

-- Inserir uma turma
INSERT INTO tbl_turmas (fk_professores_id, fk_alunos_id, fk_cursos_id)
VALUES (2, 2, 2);

-- Inserir uma nota
INSERT INTO tbl_notas (fk_alunos_id, fk_cursos_id, notas)
VALUES (2, 2, 6.5);

-- Inserir um telefone
INSERT INTO tbl_telefone (fk_professores_id, telefone)
VALUES (2, '11997654321');

select* from tbl_professores;

select* from tbl_cursos;

select* from tbl_alunos;

SELECT 
    a.nome AS Aluno,
    c.nome AS Curso
FROM tbl_alunos a
JOIN tbl_cursos c ON a.fk_cursos_id = c.id
WHERE c.nome = 'Analise desenvolvimento de sistema';

select* from tbl_turmas;

UPDATE tbl_alunos
SET fk_cursos_id = 2
WHERE id = 2;

SELECT 
    a.nome AS Aluno,
    c.nome AS Curso
FROM tbl_alunos a
JOIN tbl_cursos c ON a.fk_cursos_id = c.id
WHERE c.nome = 'Administracao';








