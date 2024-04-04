class_name Input_handler
extends Node

var double_jump_is_enable: bool = true
var dash_is_enable: bool = true
var last_direction = 'left'

func jump():
	return Input.is_action_just_pressed("jump")

func double_jump():
	if double_jump_is_enable and Input.is_action_just_pressed("jump"):
		double_jump_is_enable = false
		return true 
	return false
	
func set_double_jump(new: bool):
	double_jump_is_enable = new

func change_direction(movement):
	last_direction = 'right' if movement > 0 else 'left'
	
func dash():
	if dash_is_enable and Input.is_action_just_pressed("dash"):
		dash_is_enable = false
		return true 
	return false
