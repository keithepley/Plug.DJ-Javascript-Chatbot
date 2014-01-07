class rulesCommand extends Command
	init: ->
		@command='.rules'
		@parseType='startsWith'
		@rankPrivelege='bouncer'

	functionality: ->
		msg = "Room rules: http://tinyurl.com/80sand90s. Basics? Woot while on line and spin anything released 1978-2002 and under 7 minutes"
		API.sendChat(msg)
