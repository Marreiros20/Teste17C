CREATE DATABASE IF NOT EXISTS gestao_torneios; 
USE gestao_torneios;

-- Tabela Equipas 
CREATE TABLE Equipas ( 
ID_Equipa INT AUTO_INCREMENT PRIMARY KEY, 
Nome_Equipa VARCHAR(100) NOT NULL, 
Data_Criacao DATE NOT NULL 
); 

-- Tabela Jogadores 
CREATE TABLE Jogadores ( 
ID_Jogador INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Nickname VARCHAR(50) NOT NULL, 
Data_Nascimento DATE NOT NULL, 
ID_Equipa INT NOT NULL, 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa) 
);

-- Tabela Torneios 
CREATE TABLE Torneios ( 
ID_Torneio INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Data_Inicio DATE NOT NULL, 
Premio_Monetario DECIMAL(10,2) NOT NULL, 
CHECK (Premio_Monetario >= 0) 
); 

-- Tabela Participacoes 
CREATE TABLE Participacoes ( 
ID_Equipa INT NOT NULL, 
ID_Torneio INT NOT NULL, 
PRIMARY KEY (ID_Equipa, ID_Torneio), 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa), 
FOREIGN KEY (ID_Torneio) 
REFERENCES Torneios(ID_Torneio) 
); 

INSERT INTO Equipas (Nome_Equipa, Data_Criacao) VALUES 
("Regueifas Team" , "2026-05-22") , 
("TOTS FC" , "2026-05-27");

INSERT INTO Jogadores (Nome, Nickname, Data_Nascimento, ID_Equipa) VALUES 
("Marreiros" , "pajé marreiros" , "2008-05-22" , "6") , 
("Boris" , "tots junior", "2016-03-16", "9");

INSERT INTO Torneios (Nome,Data_Inicio, Premio_Monetario) VALUES 
("TOTS CUP" , "2026-11-06" , "670") , 
("AEAAV CHAMPIONS LEAGUE" , "2026-11-07" , "1000" ), 
("SOLO CASH CUP", "2026-11-04", "100");

INSERT INTO Participacoes (ID_Equipa, ID_Torneio) VALUES 
(6, 7 ) ,
(9, 5), 
(2, 1),
(3, 4);