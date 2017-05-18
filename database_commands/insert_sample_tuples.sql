-- insert some sample tuples for the High Tech Pool database. do this only once.


-- some people

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (1, 'Charlinho', 'Rua Sambaqui, 1, Santa Rosa del Pipoco, AM', '(92) 01010001', '2009-10-08', '2017-05-18 15-39-09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (2, 'Touro Sentado', 'Rua Sioux, 1890, Sioux Falls, SD', '1 234 3456 9030', '1831-10-08', '2017-05-18 15-40-09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (3, 'Diocleciano', 'Rua Maximus, 1, Roma, Itália', '00 123456', '0190-10-08', '2017-05-18 15-41-09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (4, 'Jesus', 'Rua Shalom, 1, Nazaré, Israel', '(92) 01010001', '0000-12-25', '2017-05-18 15-42-09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (5, 'Capeta', 'Nono círculo, 666, Inferno', '(666) 666', '0666-66-66', '2017-05-18 15-49-09');

insert into Pessoa (id, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (6, 'Asdrubal Barca', 'Rua Africa, 101, Cartago, Cartago', '(9696) 01010001', '1900-10-08', '2017-05-18 15-59-09');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (7, '858.333.666', '47.008.556', 'Ivan Drago', 'Rua Krasnoyarsk, 101, Yakutsk, Boroznievsk Oblast, Russian Federation', '(6) 07010001', '1960-10-08', '2017-05-18 16-59-39');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (8, '858.332.666', '47.008.556', 'Rocky Balboa', 'Rua America, 101, America, NJ, America', '(6) 07010001', '1980-10-08', '2017-05-18 17-59-39');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (9, '858.333.666', '47.008.556', 'Robocop', 'Rua da Lei, 101, Los Angeles, CA, USA', '(6) 07010001', '1980-10-08', '2017-05-18 18-59-39');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (10, '858.333.668', '47.098.556', 'Simba', 'Rua Africa, 101, Windhoek, Namibia', '(6) 07010001', '1980-10-08', '2017-05-18 18-59-40');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (11, '858.333.666', '47.008.556', 'Scar', 'Rua Africa, 101, Pretoria Federal Penitentiary, Pretoria, RSA', '(6) 07010001', '1980-10-08', '2017-05-18 19-59-39');

insert into Pessoa (id, CPF, RG, nome, sobrenome, endereco, telefone, data_nascimento, data_inscricao)
	values (12, '858.333.666', '47.008.556', 'Scarface', 'Room 101, Alcatraz, CA, USA', '(6) 07010001', '1980-10-08', '2017-05-18 19-59-39');


--everybody swims around here except Robocop.

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


-- pools

insert into Piscina (id, nome, endereco)
	values (1, 'Piscinão de Ramos', 'Rua Ernesto Coliforme, Bangu, RJ');
insert into Piscina (id, nome, endereco)
	values (2, 'High Tech Pool', 'Rua Saturnino de Brito, 573, Campus Zeferino Vaz, Barão Geraldo, Campinas, SP, Brasil');


-- swimming lanes may be in the following states:

insert into Tipo_Estado_Raia (estado)
	values ('desativada'); -- actually the default value on insertion of a lane
insert into Tipo_Estado_Raia (estado)
	values ('desocupada'); -- lane is plugged into the system, waiting for a swimmer (exhibits wait screen)
insert into Tipo_Estado_Raia (estado)
	values ('bemvindo'); -- showing welcome screen
insert into Tipo_Estado_Raia (estado)
	values ('escolhe_treinamento'); -- swimmer looking for a training routine
insert into Tipo_Estado_Raia (estado)
	values ('mostra_treinamento'); -- swimmer reviewing his results, previewing his exercises, etc.
insert into Tipo_Estado_Raia (estado)
	values ('escolhe_grafico'); -- swimmer reviewing his results in a bar plot
insert into Tipo_Estado_Raia (estado)
	values ('largada'); -- swimmer preparing to dive/start swimming
insert into Tipo_Estado_Raia (estado)
	values ('nadando'); -- swim, swim, swim
-- do we need the 'screen' states at all? should we log these states in a specific separate relation?


-- create some lanes for the existing pools

-- piscinao de ramos has quite a number of lanes. 13 for good luck
insert into Raia (id, numero, piscina_id)
	values (1, 1, 1)
insert into Raia (id, numero, piscina_id)
	values (2, 2, 1)
insert into Raia (id, numero, piscina_id)
	values (3, 3, 1)
insert into Raia (id, numero, piscina_id)
	values (4, 4, 1)
insert into Raia (id, numero, piscina_id)
	values (5, 5, 1)
insert into Raia (id, numero, piscina_id)
	values (6, 6, 1)
insert into Raia (id, numero, piscina_id)
	values (7, 7, 1)
insert into Raia (id, numero, piscina_id)
	values (8, 8, 1)
insert into Raia (id, numero, piscina_id)
	values (9, 9, 1)
insert into Raia (id, numero, piscina_id)
	values (10, 10, 1)
insert into Raia (id, numero, piscina_id)
	values (11, 11, 1)
insert into Raia (id, numero, piscina_id)
	values (12, 12, 1)
insert into Raia (id, numero, piscina_id)
	values (13, 13, 1)

-- 8 lanes (theoretically...) at the high tech pool
insert into Raia (id, numero, piscina_id)
	values (14, 1, 2)
insert into Raia (id, numero, piscina_id)
	values (15, 2, 2)
insert into Raia (id, numero, piscina_id)
	values (16, 3, 2)
insert into Raia (id, numero, piscina_id)
	values (17, 4, 2)
insert into Raia (id, numero, piscina_id)
	values (18, 5, 2)
insert into Raia (id, numero, piscina_id)
	values (19, 6, 2)
insert into Raia (id, numero, piscina_id)
	values (20, 7, 2)
insert into Raia (id, numero, piscina_id)
	values (21, 8, 2)


-- tipo treinamento: container for a sequence of exercises, which themselves contain a sequence of laps



