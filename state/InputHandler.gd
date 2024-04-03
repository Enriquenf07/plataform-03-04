class_name Input_handler
extends Node

var double_jump_is_enable: bool = true

func jump():
	return Input.is_action_just_pressed("jump")

func double_jump():
	
	if double_jump_is_enable and Input.is_action_just_pressed("jump"):
		print(double_jump_is_enable)
		double_jump_is_enable = false
		return true 
	return false
	
func set_double_jump(new: bool):
	double_jump_is_enable = new
