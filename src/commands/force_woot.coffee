class forceWootCommand extends Command
	init: ->
		@command='.forcewoot'
		@parseType='startsWith'
		@rankPrivelege='mod'

	functionality: ->
		msg = @msgData.message
		if msg.length > 11 #command switch included
			param = msg.substr(11)
			if param == 'enable'
				data.forceWoot = true
				API.sendChat "Forced wooting enabled."
			else if param == 'disable'
				data.forceWoot = false
				API.sendChat "Forced wooting disabled."
		