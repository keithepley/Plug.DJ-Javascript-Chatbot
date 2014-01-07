class feedbackCommand extends Command
	init: ->
		@command=['.feedback','.idea','.uservoice']
		@parseType='exact'
		@rankPrivelege='user'

	functionality: ->
		msg = 'Have an idea for the room, our bot, or an event?  Awesome! Let a mod know and we\'ll get started on it!'
		API.sendChat(msg)
