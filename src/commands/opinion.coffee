class opinionCommand extends Command
	init: ->
		@command='.opinion'
		@parseType='startsWith'
		@rankPrivelege='mod'

	functionality: ->
		msg = "http://i.imgur.com/SH6qTAI.png"
		API.sendChat(msg)
