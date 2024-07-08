extends Node

func test_logs():
	Log.debug("Hello Debug!")
	Log.info("Hello, World!")
	Log.warning("This is a warning.")
	Log.error("This is an error with the following decoded error: %s" % Log.format_error(ERR_FILE_NOT_FOUND))
	Log.debug("This is a debug message.")
	Log.trace("This is a trace message.")

	var logger := Log.Logger.new("MyLogger")

	logger.debug("Hello Debug!")
	logger.info("Hello, World!")
	logger.warning("This is a warning.")
	logger.error("This is an error with the following decoded error: %s" % Log.format_error(ERR_FILE_NOT_FOUND))
	logger.debug("This is a debug message.")
	logger.trace("This is a trace message.")

	var timer := Log.LogTimer.new("MyTimer", 0, logger)
	OS.delay_msec(1111)
	timer.stop()
	const threshold_msec: int = 1000
	timer.set_threshold_msec(threshold_msec)
	timer.start()
	OS.delay_msec(800)
	timer.stop()
	# Prints nothing, because the timer was stopped before the threshold was reached.
	timer.start()
	OS.delay_msec(1111)
	timer.stop()

	Log.flush_buffer()

func _ready() -> void:
	var console_sink := Log.ConsoleSink.new()
	Log.add_pipe(console_sink)
	test_logs()
	Log.remove_pipe(console_sink)

	var rich_sink := Log.ConsoleRichSink.new()
	Log.add_pipe(rich_sink)
	test_logs()
	Log.remove_pipe(rich_sink)

	var dir_sink := Log.DirSink.new("mylog", "res://logs", 4042)
	Log.add_pipe(dir_sink)
	test_logs()
	Log.remove_pipe(dir_sink)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
