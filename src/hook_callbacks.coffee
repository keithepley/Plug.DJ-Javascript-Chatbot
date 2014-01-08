
updateVotes = (obj) ->
    data.currentwoots = obj.positive
    data.currentmehs = obj.negative
    data.currentcurates = obj.curates

announceCurate = (obj) ->
    API.sendChat "/em" + obj.user.username + " loves this song! :heart:"

handleUserJoin = (user) ->
    data.userJoin(user)
    data.users[user.id].updateActivity()
    if API.getUser(user.id).relationship < 2
        data.users[user.id].fan()
        API.sendChat ":wave: Welcome to the community, @" + user.username + "! Community Rules: http://tinyurl.com/80sand90s"

handleNewSong = (obj) ->
    data.intervalMessages()
    data.newSong(obj)
    document.getElementById("woot").click()

    if data.forceSkip # skip songs when song is over
        songId = obj.media.id
        setTimeout ->
            cMedia = API.getMedia()
            if cMedia.id == songId
                API.moderateForceSkip()
        ,(obj.media.duration * 1000)

handleVote = (obj) ->
    data.users[obj.user.id].updateActivity()
    data.users[obj.user.id].updateVote(obj.vote)

handleUserLeave = (user)->
    disconnectStats = {
        id : user.id
        time : new Date()
        songCount : data.songCount
    }
    i=0
    for u in data.internalWaitlist
        if u.id == user.id
            disconnectStats['waitlistPosition'] = i-1 #0th position -> 1 song away
            data.setInternalWaitlist()#reload waitlist now that someone left
            break
        else
            i++
    data.userDisconnectLog.push(disconnectStats)
    data.users[user.id].inRoom(false)

antispam = (chat)->
    #test if message contains plug.dj room link
    plugRoomLinkPatt = /(\bhttps?:\/\/(www.)?plug\.dj[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig
    if(plugRoomLinkPatt.exec(chat.message))
        #plug spam detected
        sender = API.getUser chat.fromID
        if(!sender.ambassador and !sender.moderator and !sender.owner and !sender.superuser)
            if !data.users[chat.fromID].protected
                API.sendChat "Don't spam room links, you ass clown."
                API.moderateDeleteChat chat.chatID
            else
                API.sendChat "I'm supposed to kick you, but you're just too pretty."

beggar = (chat)->
    msg = chat.message.toLowerCase()
    responses = [
        "Good idea @{beggar}!  Don't earn your fans or anything - that's so 90's"
        "Guys @{beggar} asked us to fan him!  Let's all totally do it! ಠ_ಠ"
        "srsly @{beggar}? ಠ_ಠ"
        "@{beggar}.  Earning his fans the good old-fashioned way.  Hard work and elbow grease.  A true American."
    ]
    r = Math.floor Math.random()*responses.length
    if msg.indexOf('fan me') != -1 or msg.indexOf('fan for fan') != -1 or msg.indexOf('fan pls') != -1 or msg.indexOf('fan4fan') != -1 or msg.indexOf('add me to fan') != -1
        API.sendChat responses[r].replace("{beggar}",chat.from)

chatUniversals = (chat)->
    data.activity(chat)
    antispam(chat)
    beggar(chat)