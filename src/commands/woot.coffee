class wootCommand extends Command
	init: ->
		@command='.woot'
		@parseType='startsWith'
		@rankPrivelege='user'

	functionality: ->
		msg = "We like active DJs and a positive environment. Please remember
			to woot for every song while you are in the DJ line.
			We recommend using one of the scripts/extensions
			available by clicking the room name on the top of this page."
		if((nameIndex = @msgData.message.indexOf('@')) != -1)
			API.sendChat @msgData.message.substr(nameIndex) + ', ' + msg
		else
			API.sendChat msg
