extends Control


const ACHIEVEMENTS = preload("res://Scenes/Achievements.tscn")

var stats = PlayerStats


func _ready():
	pass

func _on_QuitButton_pressed():
	stats.save_all_data()
	get_tree().quit()


func _on_SaveButton_pressed():
	stats.save_all_data()
	queue_free()


func _on_ContinueButton_pressed():
	queue_free()


func _on_AchievementsButton_pressed():
	var achievements = ACHIEVEMENTS.instance()
	var main = get_tree().current_scene
	main.add_child(achievements)
