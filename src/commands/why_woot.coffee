class whyWootCommand extends Command
	init: ->
		@command='.whywoot'
		@parseType='startsWith'
		@rankPrivelege='user'

	functionality: ->
		msg = "We like active DJs and a positive environment. Wooting while in line is
					required. We recommend using one of the scripts/extensions
					available by clicking the room name on the top of this page."

		if((nameIndex = @msgData.message.indexOf('@')) != -1)
			API.sendChat @msgData.message.substr(nameIndex) + ', ' + msg
		else
			API.sendChat msg