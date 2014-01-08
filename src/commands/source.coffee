class sourceCommand extends Command
	init: ->
		@command=['.source', '.sourcecode', '.author']
		@parseType='exact'
		@rankPrivelege='user'

	functionality: ->
		msg = 'Backus wrote me in CoffeeScript: https://github.com/backus/Plug.DJ-Javascript-Chatbot - '
		msg += 'I am running on a fork maintained by AvatarKava: https://github.com/AvatarKava/Plug.DJ-Javascript-Chatbot'
		API.sendChat msg