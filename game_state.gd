extends Node

var kill_count := 0

func add_kill():
	kill_count += 1
	
func reset():
	kill_count = 0
