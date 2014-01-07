class rodSquadCommand extends Command
	init: ->
		@command='.rodsquad'
		@parseType='exact'
		@rankPrivelege='user'

	functionality: ->
		msg = "http://glogreen.files.wordpress.com/2011/02/glowstickanime.gif"
		API.sendChat(msg)
