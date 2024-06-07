extends Area2D
onready var player = $".."

func _process(_delta):
	var lixos_proximos = get_overlapping_bodies() # pega quantos lixos tem ao redor dele
	if lixos_proximos.size() > 0: # se tiver lixo ao redor
		var lixo_mais_proximo = lixos_proximos[0] # o lixo mais proximo é o mais perto
		for lixo in lixos_proximos: #
			if lixo.global_position.distance_to(self.global_position)\
			< lixo_mais_proximo.global_position.distance_to(self.global_position): # atualiza o lixo mais proximo
				lixo_mais_proximo = lixo
		
		lixo_mais_proximo.queue_free() # da queue free no lixo mais proximo, alterar isso dps
