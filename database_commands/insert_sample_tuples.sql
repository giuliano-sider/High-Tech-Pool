-- insert some sample tuples for the High Tech Pool database. do this only once.


use High_Tech_Pool;


-- some people

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (1, 'Charlinho', 'Nascimento', 'Rua Sambaqui, 1, Santa Rosa del Pipoco, AM', '(92) 01010001', '2009-10-08', '2017-05-18 15:39:09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (2, 'Touro', 'Sentado', 'Rua Sioux, 1890, Sioux Falls, SD', '1 234 3456 9030', '1831-10-08', '2017-05-18 15:40:09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (3, 'Diocleciano', 'Caesar', 'Rua Maximus, 1, Roma, Itália', '00 123456', '0190-10-08', '2017-05-18 15:41:09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (4, 'Jesus', 'Valderlei', 'Rua Shalom, 1, Nazaré, Israel', '(92) 01010001', '0001-12-25', '2017-05-18 15:42:09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (5, 'Edilson', 'Capeta', 'Nono círculo, 666, Inferno', '(666) 666', '1666-06-06', '2017-05-18 15:49:09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (6, 'Asdrubal', 'Barca', 'Rua Africa, 101, Cartago, Cartago', '(9696) 01010001', '1900-10-08', '2017-05-18 15:59:09');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (7, '858333666', '47008556', 'Ivan', 'Drago', 'Rua Krasnoyarsk, 101, Yakutsk, Boroznievsk Oblast, Russian Federation', '(6) 07010001', '1960-10-08', '2017-05-18 16:59:39');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (8, '858332666', '47008556', 'Rocky', 'Balboa', 'Rua America, 101, America, NJ, America', '(6) 07010001', '1980-10-08', '2017-05-18 17:59:39');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (9, '858333666', '47008556', 'Robocop', 'Padilha', 'Rua da Lei, 101, Los Angeles, CA, USA', '(6) 07010001', '1980-10-08', '2017-05-18 18:59:39');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (10, '858333668', '47098556', 'Simba', 'Mufasa', 'Rua Africa, 101, Windhoek, Namibia', '(6) 07010001', '1980-10-08', '2017-05-18 18:59:40');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (11, '858333666', '47008556', 'Scar', 'Judas', 'Rua Africa, 101, Pretoria Federal Penitentiary, Pretoria, RSA', '(6) 07010001', '1980-10-08', '2017-05-18 19:59:39');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (12, '858333666', '47008556', 'Tony', 'Montana', 'Room 101, Alcatraz, CA, USA', '(6) 07010001', '1980-10-08', '2017-05-18 19:59:39');


insert into Credenciais_Acesso (id, username, password)
	values (1, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (2, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (3, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (4, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (5, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (6,  'senha');

insert into Credenciais_Acesso (id, username, password)
	values (7, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (8, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (9, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (10, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (11, 'senha');

insert into Credenciais_Acesso (id, username, password)
	values (12, 'senha');


-- everybody swims around here except Robocop.

insert into Nadador (id)
	values (1);
insert into Nadador (id)
	values (2);
insert into Nadador (id)
	values (3);
insert into Nadador (id)
	values (4);
insert into Nadador (id)
	values (5);		
insert into Nadador (id)
	values (6);		
insert into Nadador (id)
	values (7);		
insert into Nadador (id)
	values (8);		
insert into Nadador (id)
	values (10);
insert into Nadador (id)
	values (11);
insert into Nadador (id)
	values (12);


-- Diocleciano is Da Boss			

insert into Gerente (id)
	values (3);


-- Ivan Drago, Robocop and Diocleciano are swimming instructors

insert into Professor (id)
	values(3);
insert into Professor (id)
	values(7);
insert into Professor (id)
	values(9);


-- Diocleciano, Asdrubal, Jesus, Capeta form a relay team

insert into Equipe_Revezamento (id)
	values (1);

insert into Revezamento (id_equipe, id_nadador)
	values (1, 3);

insert into Revezamento (id_equipe, id_nadador)
	values (1, 8);

insert into Revezamento (id_equipe, id_nadador)
	values (1, 2);

insert into Revezamento (id_equipe, id_nadador)
	values (1, 6);


-- pools

insert into Piscina (id, nome, endereco, comprimento)
	values (1, 'High Tech Pool', 'Rua Saturnino de Brito, 573, Campus Zeferino Vaz, Barão Geraldo, Campinas, SP, Brasil', 50);
insert into Piscina (id, nome, endereco, comprimento)
	values (2, 'Piscinão de Ramos', 'Rua Ernesto Coliforme, Bangu, RJ', 3000);


-- swimming lanes may be in the following states:

insert into Tipo_Estado_Raia (estado)
	values ('desativada'); -- actually the default value on insertion of a lane
insert into Tipo_Estado_Raia (estado)
	values ('desocupada'); -- lane is plugged into the system, waiting for a swimmer (exhibits wait screen)
insert into Tipo_Estado_Raia (estado)
	values ('tela bemvindo'); -- showing welcome screen
insert into Tipo_Estado_Raia (estado)
	values ('tela escolhe treinamento'); -- swimmer looking for a training routine
insert into Tipo_Estado_Raia (estado)
	values ('tela mostra treinamento'); -- swimmer reviewing his results, previewing his exercises, etc.
insert into Tipo_Estado_Raia (estado)
	values ('tela mostra grafico'); -- swimmer reviewing his results in a bar plot
insert into Tipo_Estado_Raia (estado)
	values ('tela largada'); -- swimmer preparing to dive/start swimming
insert into Tipo_Estado_Raia (estado)
	values ('nadando'); -- swim, swim, swim
-- do we need the 'screen' states at all? should we log these states in a specific separate relation?


-- create some lanes for the existing pools

-- piscinao de ramos has quite a number of lanes. 13 for good luck
insert into Raia (numero, id_piscina)
	values (1, 2);
insert into Raia (numero, id_piscina)
	values (2, 2);
insert into Raia (numero, id_piscina)
	values (3, 2);
insert into Raia (numero, id_piscina)
	values (4, 2);
insert into Raia (numero, id_piscina)
	values (5, 2);
insert into Raia (numero, id_piscina)
	values (6, 2);
insert into Raia (numero, id_piscina)
	values (7, 2);
insert into Raia (numero, id_piscina)
	values (8, 2);
insert into Raia (numero, id_piscina)
	values (9, 2);
insert into Raia (numero, id_piscina)
	values (10, 2);
insert into Raia (numero, id_piscina)
	values (11, 2);
insert into Raia (numero, id_piscina)
	values (12, 2);
insert into Raia (numero, id_piscina)
	values (13, 2);

-- 10 lanes (theoretically...) at the high tech pool
insert into Raia (numero, id_piscina)
	values (1, 1);
insert into Raia (numero, id_piscina)
	values (2, 1);
insert into Raia (numero, id_piscina)
	values (3, 1);
insert into Raia (numero, id_piscina)
	values (4, 1);
insert into Raia (numero, id_piscina)
	values (5, 1);
insert into Raia (numero, id_piscina)
	values (6, 1);
insert into Raia (numero, id_piscina)
	values (7, 1);
insert into Raia (numero, id_piscina)
	values (8, 1);
insert into Raia (numero, id_piscina)
	values (9, 1);
insert into Raia (numero, id_piscina)
	values (10, 1);


-- styles of swimming

insert into Tipo_Nado (estilo)
	values ('crawl');

insert into Tipo_Nado (estilo)
	values ('crawl perna');

insert into Tipo_Nado (estilo)
	values ('crawl braço');

insert into Tipo_Nado (estilo)
	values ('costas');

insert into Tipo_Nado (estilo)
	values ('costas perna');

insert into Tipo_Nado (estilo)
	values ('costas braço');

insert into Tipo_Nado (estilo)
	values ('peito');

insert into Tipo_Nado (estilo)
	values ('peito perna');

insert into Tipo_Nado (estilo)
	values ('peito braço');

insert into Tipo_Nado (estilo)
	values ('borboleta');

insert into Tipo_Nado (estilo)
	values ('borboleta perna');

insert into Tipo_Nado (estilo)
	values ('borboleta braço');

insert into Tipo_Nado (estilo)
	values ('livre');

insert into Tipo_Nado (estilo)
	values ('cachorrinho');

insert into Tipo_Nado (estilo)
	values ('nado polvo');




-- blueprint for various treinamentos, exercícios, sequences, etc.

insert into Tipo_Treinamento (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (1, 'Treino Casual Leve Misto',
	           'Um treinamento diversificado com sequências curtas de crawl, peito, costas e borboleta',
	           2, 2);

insert into Tipo_Treinamento (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (2, 'Treino Casual Misto Longo',
	           'Um treinamento diversificado com diversas sequências de crawl, peito, costas e borboleta',
	           3, 6);

insert into Tipo_Treinamento (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (3, 'Treino Pesado Sprints Variados',
	           'Um treinamento com sequências curtas de sprint de várias modalidades',
	           5, 7);

insert into Tipo_Treinamento (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (4, 'Treino Endurance Misto',
	           'Um treinamento diversificado com sequências de longa duração de crawl, peito, costas e borboleta',
	           8, 9);

insert into Tipo_Treinamento (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (5, 'Treino livre',
	           'Faça o que quiser num percurso de 2000 m',
	           1, 4);




insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (1, '400 m crawl',
		       'Percurso médio de crawl para treinar força e dosar fôlego',
		       3, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (2, '800 m crawl',
		       'Percurso médio/longo de crawl para dosar bem o fôlego',
		       4, 7);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (3, '400 m medley',
		       'Percurso clássico de borboleta, costas, peito, crawl',
		       6, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (4, '50 m crawl',
		       'Percurso mais rápido para sprint',
		       6, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (5, '1500 m peito',
		       'Percurso longo de peito para treinar fõlego',
		       6, 7);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (6, '1500 m cachorrinho',
		       'Percurso para canídeos',
		       10, 8);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (7, '400 m costas',
		       'Percurso médio de costas para treinar força e dosar fôlego',
		       3, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (8, '400 m peito',
		       'Percurso médio de peito para treinar força e dosar fôlego',
		       3, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (9, '400 m borboleta',
		       'Percurso médio de borboleta para treinar força e dosar fôlego',
		       3, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (10, '200 m crawl',
		       'Percurso curto e rápido de crawl para treinar força',
		       3, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (11, '200 m costas',
		       'Percurso curto e rápido de crawl para treinar força',
		       3, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (12, '200 m borboleta',
		       'Percurso curto e rápido de crawl para treinar força',
		       3, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (13, '200 m peito',
		       'Percurso curto e rápido de crawl para treinar força',
		       3, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (14, '200 m livre',
		        'Percurso livre',
		        1, 1);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (15, '400 m livre',
		        'Percurso livre',
		        2, 2);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (16, '100 m crawl',
		        'Percurso para sprint',
		        2, 6);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (17, '100 m peito',
		        'Percurso para sprint',
		        2, 6);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (18, '100 m costas',
		        'Percurso para sprint',
		        2, 6);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (19, '100 m borboleta',
		        'Percurso para sprint',
		        2, 6);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (20, '200 m medley',
		        'Percurso medley para sprint',
		        6, 6);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (21, '800 m livre',
		        'Percurso livre',
		        5, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (22, '800 m crawl',
		        'Percurso crawl para endurance',
		        5, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (23, '800 m costas',
		        'Percurso costas para endurance',
		        5, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (24, '800 m peito',
		        'Percurso peito para endurance',
		        5, 5);

insert into Tipo_Exercicio (id, nome, descricao, nivel_de_dificuldade, nivel_de_esforco)
	values (25, '800 m borboleta',
		        'Percurso borboleta para endurance',
		        5, 5);



insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (1, 'crawl', 50);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (2, 'costas', 50);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (3, 'borboleta', 50);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (4, 'peito', 50);


-- para piscinas menores 
insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (36, 'crawl', 25);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (37, 'costas', 25);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (38, 'borboleta', 25);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (39, 'peito', 25);

-- para piscina nanicas
insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (5, 'crawl', 10);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (6, 'costas', 10);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (7, 'borboleta', 10);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (8, 'peito', 10);


insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (9, 'cachorrinho', 50);
insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (10, 'cachorrinho', 25);
insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (11, 'cachorrinho', 10);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (12, 'nado polvo', 50);


insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (13, 'crawl', 100);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (14, 'costas', 100);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (15, 'borboleta', 100);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (16, 'peito', 100);



insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (17, 'crawl', 200);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (18, 'costas', 200);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (19, 'borboleta', 200);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (20, 'peito', 200);


insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (21, 'crawl', 400);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (22, 'costas', 400);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (23, 'borboleta', 400);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (24, 'peito', 400);


insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (25, 'crawl', 800);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (26, 'costas', 800);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (27, 'borboleta', 800);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (28, 'peito', 800);


insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (29, 'livre', 50);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (30, 'livre', 100);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (31, 'livre', 200);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (32, 'livre', 400);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (33, 'livre', 800);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (34, 'cachorrinho', 1500);

insert into Tipo_Subexercicio (id, estilo_nado, comprimento)
	values (35, 'peito', 1500);




-- treino casual misto longo
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 1, 10);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 2, 11);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 3, 12);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 4, 13);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 5, 3);	
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 6, 1);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 7, 7);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 8, 8);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 9, 9);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (2, 10, 15);

-- treino casual leve misto
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 1, 10);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 2, 11);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 3, 12);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 4, 13);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 5, 10);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 6, 11);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 7, 12);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 8, 13);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (1, 9, 15);

-- treino pesado sprints variados
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 1, 16);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 2, 17);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 3, 18);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 4, 19);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 5, 16);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 6, 17);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 7, 18);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 8, 19);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 9, 16);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 10, 17);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 11, 18);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 12, 19);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 13, 4);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 14, 4);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 15, 4);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 16, 4);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 17, 16);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 18, 17);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 19, 18);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 20, 19);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 21, 17);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 22, 17);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 23, 17);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 24, 17);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 25, 18);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 26, 18);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 27, 18);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 28, 18);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 29, 19);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 30, 19);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 31, 19);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 32, 19);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 33, 20);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 34, 14);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 35, 20);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 36, 14);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (3, 37, 21);


-- treino endurance misto
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 1, 3);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 2, 22);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 3, 23);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 4, 24);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 5, 25);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 6, 22);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 7, 23);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 8, 24);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 9, 25);

insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (4, 10, 15);

-- treino livre
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (5, 1, 15);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (5, 2, 15);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (5, 3, 15);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (5, 4, 15);
insert into Sequencia_Treinamento (id_tipo_treinamento, numero_de_sequencia, id_tipo_exercicio)
	values (5, 5, 15);



insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (1, 1, 21);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (2, 1, 25);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (3, 1, 15);
insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (3, 2, 14);
insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (3, 3, 16);
insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (3, 4, 13);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (4, 1, 1);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (5, 1, 34);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (6, 1, 34);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (7, 1, 22);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (8, 1, 24);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (9, 1, 23);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (10, 1, 17);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (11, 1, 18);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (12, 1, 29);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (13, 1, 20);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (14, 1, 31);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (15, 1, 32);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (16, 1, 13);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (17, 1, 16);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (18, 1, 14);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (19, 1, 15);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (20, 1, 3);
insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (20, 2, 2);
insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (20, 3, 4);
insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (20, 4, 1);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (21, 1, 33);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (22, 1, 25);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (23, 1, 26);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (24, 1, 28);

insert into Sequencia_Exercicio (id_tipo_exercicio, numero_de_sequencia, id_tipo_subexercicio)
	values (25, 1, 27);



insert into Recomendacao (id_professor, id_tipo_treinamento, id_nadador)
	values (7,4,8);


-- tony montana marcou horário
insert into Agendamento (data_horario_inicio, id_piscina, numero_raia, id_nadador)
	values ('2017-05-31 19:00:00', 1, 1, 12);



insert into Tipo_Sensor (tipo)
	values ('pressao');

insert into Tipo_Sensor (tipo)
	values ('temperatura');

insert into Tipo_Sensor (tipo)
	values ('radio frequencia');

-- insert into Tipo_Estado_Sensor (estado)
-- 	values ('desativado');
-- 
-- insert into Tipo_Estado_Sensor (estado)
-- 	values ('operacional');


insert into Tipo_Funcao_Sensor (funcao)
	values ('nenhuma');

insert into Tipo_Funcao_Sensor (funcao)
	values ('detecta plataforma de mergulho');

insert into Tipo_Funcao_Sensor (funcao)
	values ('detecta borda (lado largada)');

insert into Tipo_Funcao_Sensor (funcao)
	values ('detecta borda (lado oposto)');

insert into Tipo_Funcao_Sensor (funcao)
	values ('mede temperatura');

insert into Tipo_Funcao_Sensor (funcao)
	values ('registra presença');



-- physical sensors
-- a lane rfid card reader for recording swim sessions
insert into Sensor (id_sensor, tipo, funcao)
	values (1, 'radio frequencia', 'registra presença');

-- our only registered sensor so far
insert into Sensor_Raia (id_sensor, id_piscina, numero_raia)
	values (1, 1, 1);



-- simulated sensors ('171' series)

insert into Sensor (id_sensor, tipo, funcao)
	values (171001, 'radio frequencia', 'registra presença');

insert into Sensor_Raia (id_sensor, id_piscina, numero_raia)
	values (171001, 1, 1);


insert into Sensor (id_sensor, tipo, funcao)
	values (171002, 'pressao', 'detecta plataforma de mergulho');

insert into Sensor_Raia (id_sensor, id_piscina, numero_raia)
	values (171002, 1, 1);


insert into Sensor (id_sensor, tipo, funcao)
	values (171003, 'pressao', 'detecta borda (lado largada)');

insert into Sensor_Raia (id_sensor, id_piscina, numero_raia)
	values (171003, 1, 1);


insert into Sensor (id_sensor, tipo, funcao)
	values (171004, 'pressao', 'detecta borda (lado oposto)');

insert into Sensor_Raia (id_sensor, id_piscina, numero_raia)
	values (171004, 1, 1);



-- the only raias available so far!
update Raia
	set estado = 'desocupada'
	where numero_raia = 1 and id_piscina = 1;

update Raia
	set estado = 'desocupada'
	where numero_raia = 2 and id_piscina = 1;

	





