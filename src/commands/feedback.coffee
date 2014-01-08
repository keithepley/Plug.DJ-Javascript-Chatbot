class feedbackCommand extends Command
	init: ->
		@command=['.feedback','.idea','.uservoice']
		@parseType='exact'
		@rankPrivelege='user'

	functionality: ->
		msg = 'Have an idea for the room, our bot, or an event?  Awesome! Let me know at beavisbot@gmail.com and I\'ll see what I can do!'
		API.sendChat(msg)
