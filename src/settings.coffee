class settings
	currentsong: {}
	users: {}
	djs: []
	mods: []
	host: []
	hasWarned: false
	currentwoots: 0
	currentmehs: 0
	currentcurates: 0
	roomUrlPath: 'i-the-80-s-and-90-s-1' # for lock, eg:'room-name' in 'http://plug.dj/room-name/'
	internalWaitlist: []
	userDisconnectLog: []
	voteLog: {}
	seshOn: false
	forceSkip: false
	seshMembers: []
	launchTime: null
	totalVotingData:
		woots:0
		mehs:0
		curates:0
	pupScriptUrl: "http://plugdj.dev/bot.js"
	afkTime: 12*60*1000 #Time without activity to be considered afk. 12 minutes in milliseconds
	songIntervalMessages: [
		{interval:15,offset:0,msg:"I'm a bot!"}
	]
	songCount: 0

	startup: =>
		@launchTime = new Date()
		@roomUrlPath = @getRoomUrlPath()

	getRoomUrlPath: =>
		window.location.pathname.replace(/\//g,'')

	newSong: ->
		@setInternalWaitlist()

		@currentsong = API.getMedia()
		if @currentsong != null
			return @currentsong
		else
			return false

	newHistory: ->
		@lastsong = API.getHistory()[0]
		if @lastsong != null
			@totalVotingData.woots += @lastsong.room.positive
			@totalVotingData.mehs += @lastsong.room.negative
			@totalVotingData.curates += @lastsong.room.curates
			return @lastsong
		else
			return false

	userJoin: (u)=>
		userIds = Object.keys(@users)
		if u.id in userIds
			@users[u.id].inRoom(true)
		else
			@users[u.id] = new User(u)
			@voteLog[u.id] = {}

	setInternalWaitlist: =>
		lineWaitList = API.getWaitList()
		fullWaitList = lineWaitList.unshift(API.getDJ());
		@internalWaitlist = fullWaitList

	activity: (obj) ->
		if(obj.type == 'message')
			@users[obj.fromID].updateActivity()

	startAfkInterval: =>
		@afkInterval = setInterval(afkCheck,2000)

	intervalMessages: =>
		@songCount++
		for msg in @songIntervalMessages
			if ((@songCount+msg['offset']) % msg['interval']) == 0
				API.sendChat msg['msg']

	implode: =>
		for item,val of @
			if(typeof @[item] == 'object') 
				delete @[item]
		clearInterval(@afkInterval)

	lockBooth: (callback=null)->
		API.moderateLockWaitList(true).done ->
			if callback?
				callback()

	unlockBooth: (callback=null)->
    API.moderateLockWaitList(false).done ->
			if callback?
				callback()

data = new settings()