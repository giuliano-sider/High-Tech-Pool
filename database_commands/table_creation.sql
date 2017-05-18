-- table creation commands for the High Tech Pool database

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
);

create table Tipo_Estado_Raia (
	estado varchar(255) primary key
);

create table Raia (
	id int primary key,
	numero int not null,
	piscina_id int not null,
	estado varchar(255) default 'desativada' not null,
	foreign key (piscina_id) 
		references Piscina(id),
	foreign key (estado) 
		references Tipo_Estado_Raia(estado)
);

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

create table Tipo_Volta (
	id int primary key,
	estilo_nado_ida varchar(255) not null,
	estilo_nado_retorno varchar(255),
	foreign key (estilo_nado_ida) 
		references Tipo_Nado(estilo),
	foreign key (estilo_nado_retorno) 
		references Tipo_Nado(estilo)
);

create table Tipo_Treinamento_Contem_Tipo_Exercicio (
	id_tipo_treinamento int,
	id_tipo_exercicio int,
	numero_de_sequencia int,
	constraint pk_ttcte 
		primary key (id_tipo_treinamento, id_tipo_exercicio, numero_de_sequencia),
	foreign key (id_tipo_treinamento) 
		references Tipo_Treinamento(id),
	foreign key (id_tipo_exercicio) 
		references Tipo_Exercicio(id)
);

create table Tipo_Exercicio_Contem_Tipo_Volta (
	id_tipo_exercicio int,
	id_tipo_volta int,
	numero_de_sequencia int,
	constraint pk_tectv 
		primary key (id_tipo_exercicio, id_tipo_volta, numero_de_sequencia),
	foreign key (id_tipo_exercicio) 
		references Tipo_Exercicio(id)	
	foreign key (id_tipo_volta) 
		references Tipo_Volta(id),
);

create table Recomendacao (
	id_professor int,
	id_tipo_treinamento int,
	id_nadador int,
	constraint pk_rec 
		primary key (id_professor, id_tipo_treinamento, id_nadador),
	foreign key id_professor 
		references Professor(id),
	foreign key id_tipo_treinamento 
		references Tipo_Treinamento(id),
	foreign key id_nadador 
		references Nadador(id)
);

create table Treinamento (
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio timestamp
	constraint pk_tr primary key (id_tipo_treinamento, id_nadador, data_horario_inicio),
	foreign key (id_tipo_treinamento) 
		references Tipo_Treinamento(id),
	foreign key (id_nadador) 
		references Nadador(id)
);

create table Exercicio ( 
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio_treinamento timestamp,
	id_tipo_exercicio int,
	numero_de_sequencia int,
	data_horario_inicio timestamp,
	constraint pk_ex primary key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, id_tipo_exercicio, numero_de_sequencia),
	foreign key (id_tipo_treinamento, id_tipo_exercicio, numero_de_sequencia) 
		references Tipo_Treinamento_Contem_Tipo_Exercicio(id_tipo_treinamento, id_tipo_exercicio, numero_de_sequencia),
	foreign key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento) 
		references Treinamento(id_tipo_treinamento, id_nadador, data_horario_inicio)
);

create table Volta (
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio_treinamento timestamp,
	id_tipo_exercicio int,
	numero_de_sequencia_exercicio int,
	id_tipo_volta int,
	numero_de_sequencia_volta int,
	data_horario_inicio timestamp,
	tempo_ida real,
	tempo_retorno real,
	constrain pk_v primary key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, id_tipo_exercicio, numero_de_sequencia_exercicio, id_tipo_volta, numero_de_sequencia_volta),
	foreign key (id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, id_tipo_exercicio, numero_de_sequencia_exercicio) 
		references Exercicio(id_tipo_treinamento, id_nadador, data_horario_inicio_treinamento, id_tipo_exercicio, numero_de_sequencia),
	foreign key (id_tipo_exercicio, id_tipo_volta, numero_de_sequencia_volta)
		references Tipo_Exercicio_Contem_Tipo_Volta(id_tipo_exercicio, id_tipo_volta, numero_de_sequencia)		
);

create table Comparacao_Treinamento (
	id_tipo_treinamento int,
	id_nadador int,
	data_horario_inicio timestamp,
	id_tipo_treinamento_comparacao int,
	id_nadador_comparacao int,
	data_horario_inicio_comparacao timestamp,
	constraint pk_ct
		primary key (id_tipo_treinamento, id_nadador, data_horario_inicio, id_tipo_treinamento_comparacao, id_nadador_comparacao, data_horario_inicio_comparacao),
	foreign key (id_tipo_treinamento, id_nadador, data_horario_inicio)
		references Treinamento(id_tipo_treinamento, id_nadador, data_horario_inicio),
	foreign key (id_tipo_treinamento_comparacao, id_nadador_comparacao, data_horario_inicio_comparacao)
		references Treinamento(id_tipo_treinamento, id_nadador, data_horario_inicio),				
);

create table Sessao (
	id_nadador int,
	id_raia int,
	data_horario_inicio timestamp,
	data_horario_fim timestamp,
	constraint pk_s
		primary key (id_nadador, id_raia, data_horario_inicio),
	foreign key (id_nadador)
		references Nadador(id),
	foreign key (id_raia)
		references Raia(id),
	check (data_horario_fim is null or data_horario_fim > data_horario_inicio)
);

create table Agendamento (
	data_horario_inicio timestamp,
	id_raia int,
	id_nadador int not null,
	constrain pk_a
		primary key (data_horario_inicio, id_raia),
	foreign key	(id_raia)
		references Raia(id),
	foreign key	(id_nadador)
		references Nadador(id)
);

create table Temperatura (
	id_piscina int,
	momento_de_medicao timestamp,
	temperatura real not null,
	constraint pk_t 
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
	id_raia int,
	foreign key id_raia
		references Raia(id)
);

create table Sensor_Piscina (
	id_sensor int primary key,
	id_piscina int,
	foreign key id_piscina
		references Piscina(id)
);