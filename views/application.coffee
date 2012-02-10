supports_html5_storage = ->
	try
		return 'localStorage' of window and window['localStorage'] isnt null
	catch e
		return false

$ ->
	if supports_html5_storage()
		if localStorage["runTimes"]?
			runTimes = JSON.parse localStorage["runTimes"]
		if runTimes?
			runTimes.push new Date()
		else
			runTimes = [new Date()]
		localStorage["runTimes"] = JSON.stringify runTimes
		$("#run-times").append "<li>" + Date(run) + "</li>" for run in runTimes