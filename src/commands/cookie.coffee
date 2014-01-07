class cookieCommand extends Command
	init: ->
		@command= '.cookie'
		@parseType='startsWith'
		@rankPrivelege='user'

	getCookie: ->
		cookies = [
			"a chocolate chip cookie"
			"a sugar cookie"
			"an oatmeal raisin cookie"
			"a 'special' brownie"
			"an animal cracker"
			"a scooby snack"
			"a blueberry muffin"
			"a cupcake"
			"a pimento taco"
		]
		c = Math.floor Math.random()*cookies.length
		cookies[c]

	functionality: ->
		msg = @msgData.message
		r = new RoomHelper()
		if(msg.substring(8, 9) == "@") #Valid cookie argument including a username!
			user = r.lookupUser(msg.substr(9))
			if user == false
				API.sendChat "/em doesn't see '"+msg.substr(9)+"' in room and eats a taco himself"
				return false
			else if user.username == @msgData.from
				API.sendChat "Pretty selfish to hoard all the treats for yourself, " + @msgData.from + "..."
			else
				API.sendChat "@"+user.username+", "+@msgData.from+" handed you "+@getCookie()+". Enjoy."
