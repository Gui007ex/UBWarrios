extends CharacterBody2D

var RUNSPEED = 340
var DASHSPEED = 390
var WALKSPEED = 200
var GRAVITY = 1800
var JUMPFORCE = 500

var frame = 0
func updateframe(delta):
	frame += 1

func turn(direction):
	var dir = 0
	if direction:
		dir = -1
	else:
		dir = 1
	$Sprites.set_flíp_h(direction)
	
func _frame():
	frame = 0
