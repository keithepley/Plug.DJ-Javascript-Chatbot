pupOnline = ->
	API.sendChat "/me By the Power of Grayskull... I HAVE THE POWER!!!!!"

populateUserData = ->
	users = API.getUsers()
	for u in users
		data.users[u.id] = new User(u)
		data.voteLog[u.id] = {}
	return

initEnvironment = ->
	document.getElementById("woot").click()
	document.getElementById("chat-sound").click()
	# Playback.streamDisabled = true
	# Playback.stop()

initialize = ->
  pupOnline()
  populateUserData()
  initEnvironment()
  initHooks()
  data.startup()
  data.newSong()
  data.startAfkInterval()