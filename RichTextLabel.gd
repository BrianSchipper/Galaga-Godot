extends RichTextLabel

var score = "0";
#
#func _ready():
#	World.connect("scoreChanged", self, "_on_scoreChanged")
#	World.score = global.score  #kickstart the setter
#
func _on_scoreChanged( to ):
	set_text( str( to ) )

func _process(delta):
	set_text("Score: " + score);
	pass	

func _add_new_points(points):
	score += points
