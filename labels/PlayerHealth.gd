extends Label

var health: IHealth

func init(health: IHealth):
	self.health = health

func _process(delta):
	text = 'Health: {health}'.format({'health': health.value})
