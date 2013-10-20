class wootCommand extends Command
	init: ->
		@command='!woot'
		@parseType='startsWith'
		@rankPrivelege='user'

	functionality: ->
		msg = "Please WOOT on DJ Booth and support your fellow DJs!"
		if((nameIndex = @msgData.message.indexOf('@')) != -1)
			API.sendChat @msgData.message.substr(nameIndex) + ', ' + msg
		else
			API.sendChat msg
