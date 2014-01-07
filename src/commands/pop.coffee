class popCommand extends Command
	init: ->
		@command='.pop'
		@parseType='exact'
		@rankPrivelege='mod'

	functionality: ->
		djs = API.getWaitList()
		popDj = djs[djs.length-1]
		API.moderateRemoveDJ(popDj.id)