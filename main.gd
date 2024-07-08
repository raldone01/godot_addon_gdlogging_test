extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var console_sink := Log.ConsoleSink.new()
	Log.add_sink(console_sink)
	Log.info("Hello, World!")
	Log.warning("This is a warning.")
	Log.error("This is an error.")
	Log.debug("This is a debug message.")
	Log.trace("This is a trace message.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
