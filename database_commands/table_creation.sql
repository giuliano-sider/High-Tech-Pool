-- table creation commands for the High Tech Pool database
-- create it in a single transaction so it gets rolled back on error

create table Pessoa (
	id int primary key,
	CPF int,
	RG int,
	nome varchar(255) not null,
	sobrenome varchar(255) not null,
	endereco varchar(255) not null,
	telefone varchar(255) not null,
	data_nascimento date not null,
	data_inscricao timestamp not null
);

create table Nadador (
	id int primary key,
	
	foreign key (id) 
		references Pessoa(id)
);

create table Equipe_Revezamento (
	id int primary key,

	foreign key (id)
		references Nadador(id)
);

create table Revezamento (
	id_equipe int,
	id_nadador int,
	primary key (id_equipe, id_nadador)

	foreign key (id_equipe)
		references Equipe_Revezamento(id),

	foreign key (id_nadador)
		references Nadador(id)
);

create table Gerente (
	id int primary key,
	
	foreign key (id) 
		references Pessoa(id)
);

create table Professor (
	id int primary key,
	
	foreign key (id) 
		references Pessoa(id)
);

create table Piscina (
	id int primary key,
	nome varchar(255) not null,
	endereco varchar(255) not null
	comprimento int not null -- in meters
);

create table Tipo_Estado_Raia (
	estado varchar(255) primary key
);

create table Raia (
	numero int not null,
	id_piscina int not null,
	estado varchar(255) default 'desativada' not null,
	primary key (numero, id_piscina),

	foreign key (id_piscina) 
		references Piscina(id),
	
	foreign key (estado) 
		references Tipo_Estado_Raia(estado)
);


-- tipo treinamento: blueprint for a treinamento,
-- which is a container for a sequence of exercises, 
-- which themselves contain a sequence of subexercises,
-- which represent a certain length of swimming of a certain type

create table Tipo_Treinamento (
	id int primary key,
	nome varchar(255) not null,
	descricao varchar(4096) not null,
	nivel_de_dificuldade int not null,
	nivel_de_esforco int not null,
	
	check (nivel_de_dificuldade <= 10 and nivel_de_dificuldade >= 1),
	check (nivel_de_esforco <= 10 and nivel_de_esforco >= 1)
);

create table Tipo_Exercicio (
	id int primary key,
	nome varchar(255) not null,
	descricao varchar(4096) not null,
	nivel_de_dificuldade int not null,
	nivel_de_esforco int not null,
	
	check (nivel_de_dificuldade <= 10 and nivel_de_dificuldade >= 1),
	check (nivel_de_esforco <= 10 and nivel_de_esforco >= 1)
);

create table Tipo_Nado (
	estilo varchar(255) primary key
);

create table Tipo_Subexercicio (
	id int primary key,
	estilo_nado varchar(255) not null,
	comprimento int not null, -- in meters
	
	foreign key (estilo_nado) 
		references Tipo_Nado(estilo),
);

create table Sequencia_Treinamento (
	id_tipo_treinamento int,
	numero_de_sequencia int,
	id_tipo_exercicio int,
	primary key (id_tipo_treinamento, numero_de_sequencia),
	
	foreign key (id_tipo_treinamento) 
		references Tipo_Treinamento(id),
	
	foreign key (id_tipo_exercicio) 
		references Tipo_Exercicio(id)
);

create table Sequencia_Exercicio (
	id_tipo_exercicio int,
	numero_de_sequencia int,
	id_tipo_subexercicio int,
	primary key (id_tipo_exercicio, numero_de_sequencia),
	
	foreign key (id_tipo_exercicio) 
		references Tipo_Exercicio(id)	
	
	foreign key (id_tipo_subexercicio) 
		references Tipo_Subexercicio(id),
);

create table Recomendacao (
	id_professor int,
	id_tipo_treinamento int,
	id_nadador int,
	primary key (id_professor, id_tipo_treinamento, id_nadador),
	
	foreign key id_professor 
		references Professor(id),
	
	foreign key id_tipo_treinamento 
		references Tipo_Treinamento(id),
	
	foreign key id_nadador 
		references Nadador(id)
);


-- a swimmer swims a training routine
-- which has a sequence of exercises (swum without pause)
-- each of which is a sequence of subexercises of a certain type
-- note: the subexercise length SHOULD BE a multiple of the pool
-- length so that the laps (partials) can line up.

create table Treinamento (
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio timestamp,
	primary key (id_tipo_treinamento, id_nadador, data_horario_inicio),

	foreign key (id_tipo_treinamento) 
		references Tipo_Treinamento(id),

	foreign key (id_nadador) 
		references Nadador(id)
);

create table Exercicio ( 
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio_treinamento timestamp,
	numero_de_sequencia int,
	id_tipo_exercicio int,
	data_horario_inicio timestamp,
	numero_raia int,
	id_piscina int,
	primary key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, numero_de_sequencia),

	foreign key (numero_raia, id_piscina)
		references Raia(numero, id_piscina),

	foreign key (id_tipo_treinamento, numero_de_sequencia) 
		references Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia),

	foreign key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento) 
		references Treinamento(id_tipo_treinamento, id_nadador, data_horario_inicio)
);

-- a half-lap at a certain pool.

create table Parcial (
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio_treinamento timestamp,
	numero_de_sequencia_exercicio int,
	numero_de_sequencia_parcial int,
	data_horario_inicio timestamp,
	tempo real,
	primary key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, numero_de_sequencia_exercicio, numero_de_sequencia_parcial),
	
	foreign key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, numero_de_sequencia_exercicio) 
		references Exercicio(id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, numero_de_sequencia),
);


-- compare a treinamento/exercicio to the second one

create table Comparacao_Treinamento (
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio timestamp,
	id_tipo_treinamento_comparacao int,
	id_nadador_comparacao int,
	data_horario_inicio_comparacao timestamp,
	primary key (id_tipo_treinamento, id_nadador, data_horario_inicio, id_tipo_treinamento_comparacao, id_nadador_comparacao, data_horario_inicio_comparacao),
	
	foreign key (id_tipo_treinamento, id_nadador, data_horario_inicio)
		references Treinamento(id_tipo_treinamento, id_nadador, data_horario_inicio),
	
	foreign key (id_tipo_treinamento_comparacao, id_nadador_comparacao, data_horario_inicio_comparacao)
		references Treinamento(id_tipo_treinamento, id_nadador, data_horario_inicio),				
);

create table Comparacao_Exercicio (
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio_treinamento timestamp,
	numero_de_sequencia int,
	id_tipo_treinamento_comparacao int,
	id_nadador_comparacao int,
	data_horario_inicio_treinamento_comparacao timestamp,
	numero_de_sequencia_comparacao int,
	primary key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, numero_de_sequencia,	id_tipo_treinamento_comparacao,	id_nadador_comparacao, data_horario_inicio_treinamento_comparacao, numero_de_sequencia_comparacao),

	foreign key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, numero_de_sequencia)
		references Exercicio(id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, numero_de_sequencia),

	foreign key (id_tipo_treinamento_comparacao, id_nadador_comparacao, data_horario_inicio_treinamento_comparacao, numero_de_sequencia_comparacao)
		references Exercicio(id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, numero_de_sequencia)
);

create table Sessao (
	id_nadador int,
	id_piscina int,
	numero_raia int,
	data_horario_inicio timestamp,
	data_horario_fim timestamp,
	primary key (id_nadador, id_piscina, numero_raia, data_horario_inicio),
	
	foreign key (id_nadador)
		references Nadador(id),
	
	foreign key (id_piscina, numero_raia)
		references Raia(id_piscina, numero),
	
	check (data_horario_fim is null or data_horario_fim > data_horario_inicio)
);

create table Agendamento (
	data_horario_inicio timestamp,
	id_piscina int,
	numero_raia int,
	id_nadador int not null,
	primary key (data_horario_inicio, id_piscina, numero_raia),
	
	foreign key	(id_piscina, numero_raia)
		references Raia(id_piscina, numero),
	
	foreign key	(id_nadador)
		references Nadador(id)
);

create table Temperatura (
	id_piscina int,
	momento_de_medicao timestamp,
	temperatura real not null,
	primary key (id_piscina, momento_de_medicao)
	
	foreign key (id_piscina)
		references Piscina(id)
);

create table Tipo_Sensor (
	tipo varchar(255) primary key
);

create table Tipo_Estado_Sensor (
	estado varchar(255) primary key
);

create table Sensor (
	id_sensor int primary key,
	tipo varchar(255),
	estado varchar(255),
	
	foreign key tipo
		references Tipo_Sensor(tipo),
	
	foreign key estado 
		references Tipo_Estado_Sensor(estado)
);

create table Sensor_Raia (
	id_sensor int primary key,
	id_piscina int,
	numero_raia int,
	
	foreign key (id_piscina, numero_raia)
		references Raia(id_piscina, numero)
);

create table Sensor_Piscina (
	id_sensor int primary key,
	id_piscina int,
	
	foreign key id_piscina
		references Piscina(id)
);