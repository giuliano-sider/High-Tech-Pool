"""API para comunicação entre código Python baixo nivel dos sensores 
   e código Python alto nivel que gerencia as raias e treinamentos"""

def consulta_registro_sensores
	"""
	devolve lista de sensores:
	[{id: ____,
	  tipo: ____},

     {id: _____,
      tipo: ____},

      ...

	]
	"""
	raise(Exception('consulta_registro_sensores not implemented'))

def registra_callback_pressdown(id_sensor, callback_func)
	"""
	registra uma função de callback para o evento de aperto no sensor de pressão
	(sensor de fim de curso)
	"""
	raise(Exception(' not implemented'))

def registra_callback_release(id_sensor, callback_func)
	"""
	registra uma função de callback para o evento de release no sensor de pressão
	(sensor de fim de curso)
	"""
	raise(Exception(' not implemented'))

def registra_


...
