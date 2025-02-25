CREATE DATABASE dbLivraria;

USE dbLivraria;

CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY(1,1)
	,cfpCliente CHAR (15) UNIQUE NOT NULL
	,nomeCliente VARCHAR (50) NOT NULL
	,logradouroCliente VARCHAR (50) NOT NULL
	,numLograCliente VARCHAR (5) NOT NULL
	,cepCliente CHAR (9) NOT NULL
	,bairroCliente VARCHAR (30) NOT NULL
	,cidadeCliente VARCHAR (30) NOT NULL
	,ufCliente CHAR (2) NOT NULL
	,complementoCliente VARCHAR (50)
);

CREATE TABLE tbFoneCliente(
	idFoneCliente INT PRIMARY KEY IDENTITY(1,1)
	,numeroFoneCliente  VARCHAR (20) NOT NULL
	,idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)

);

CREATE TABLE tbEditora(
	idEditora INT PRIMARY KEY IDENTITY(1,1)
	,nomeEditora VARCHAR (30) NOT NULL
	,logradouroEditora VARCHAR (50) NOT NULL
	,numLograEditora VARCHAR (5) NOT NULL
	,cepEditora CHAR (9) NOT NULL
	,bairroEditora VARCHAR (30) NOT NULL
	,cidadeEditora VARCHAR (30) NOT NULL
	,ufEditora CHAR (2) NOT NULL
	,cnpjEditora VARCHAR (15) NOT NULL
);


CREATE TABLE tbFoneEditora(
	idFoneEditora INT PRIMARY KEY IDENTITY(1,1)
	,numero1FoneEditora VARCHAR (20) NOT NULL
	,numero2FoneEditora VARCHAR (20) NOT NULL
	,idEditora INT FOREIGN KEY REFERENCES tbEditora(idEditora)

);

CREATE TABLE tbLivro(
	idLivro INT PRIMARY KEY IDENTITY(1,1)
	,isbnLivro VARCHAR (30) NOT NULL
	,idiomaLivro VARCHAR (20) NOT NULL
	,dataLancamentoLivro DATE NOT NULL
	,qtdePagLivro VARCHAR (4) NOT NULL
	,tituloLivro VARCHAR (30) NOT NULL
	,generoLivro VARCHAR (30) NOT NULL
	,precoLivro MONEY NOT NULL
	,idEditora INT FOREIGN KEY REFERENCES tbEditora(idEditora)
);


CREATE TABLE tbAutor(
	idAutor INT PRIMARY KEY IDENTITY(1,1)
	,dataNasc DATE NOT NULL
	,nacionalidadeAutor VARCHAR (20) NOT NULL
	,nomeAutor VARCHAR (50) NOT NULL
);

CREATE TABLE tbLivroAutor(
	idLivroAutor INT PRIMARY KEY IDENTITY(1,1)
	,idLivro INT FOREIGN KEY REFERENCES tbLivro(idLivro)
	,idAutor INT FOREIGN KEY REFERENCES tbAutor(idAutor)
);


CREATE TABLE tbCompraLivro(
	idCompraLivro INT PRIMARY KEY IDENTITY(1,1)
	,dataCompraLivro DATE
	,idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
	,idLivro INT FOREIGN KEY REFERENCES tbLivro(idLivro)

);