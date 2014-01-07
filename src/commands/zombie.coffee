class zombieCommand extends Command
	init: ->
		@command= 'zombie'
		@parseType='contains'
		@rankPrivelege='user'

	getQuote: ->
		quotes = [
			"chops off {sender}'s legs and runs!"
			"om nom nom nom, flesh..."
			"recommends high-quality lotion to help fashion a supple skin suit."
		]
		c = Math.floor Math.random()*quotes.length
		quotes[c]

	functionality: ->
		msg = @msgData.message
		sender = @msgData.from
		output = @getQuote()
		API.sendChat "/em " + output.replace('{sender}', sender)