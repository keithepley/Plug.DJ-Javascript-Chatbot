class welcomeCommand extends Command
	init: ->
		@command='.welcome'
		@parseType='startsWith'
		@rankPrivelege='user'

	functionality: ->
		msg1 = "Welcome!  "
		msg1+= "Click the 'Join Waitlist' button and wait your turn to play music. Type '/rules' for specifics."
		msg1+= "Stay active while waiting to play your song by wooting or you will be removed."
		API.sendChat(msg1)
		
