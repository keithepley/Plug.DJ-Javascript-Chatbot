class themeCommand extends Command
	init: ->
		@command='.theme'
		@parseType='startsWith'
		@rankPrivelege='user'

	functionality: ->
		msg = "Any genre of music released from 1978-2002.  Please keep selections under 7 minutes."
		msg += "Use .rules for full details."
		API.sendChat(msg)
