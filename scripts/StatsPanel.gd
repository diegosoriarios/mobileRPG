extends Panel

onready var hplabel = $StatsContainer/HP
onready var aplabel = $StatsContainer/AP
onready var mplabel = $StatsContainer/MP



func _on_PlayerStats_ap_changed(value):
	aplabel.text = "AP\n"+str(value)


func _on_PlayerStats_hp_changed(value):
	hplabel.text = "HP\n"+str(value)


func _on_PlayerStats_mp_changed(value):
	mplabel.text = "MP\n"+str(value)
