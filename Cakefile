fs     = require 'fs'
{exec} = require 'child_process'

appFiles  = [
	# omit src/ and .coffee to make the below lines a little shorter
	'settings'
	'user'
	'room_helper'
	'init'
	'afk'
	'commands/command'
	'commands/afks'
	'commands/all_afks'
	'commands/average_vote_ratio'
	'commands/bad_quality'
	'commands/cookie'
	'commands/die'
	'commands/disconnect_lookup'
	'commands/download'
	'commands/feedback'
	'commands/force_skip'
	'commands/force_woot'
	'commands/help'
	'commands/lock'
	'commands/mention'
	'commands/new_songs'
	'commands/opinion'
	'commands/overplayed'
	'commands/pop'
	'commands/push'
	'commands/reload'
	'commands/reset_afk'
	'commands/rod_squad'
	'commands/rules'
	'commands/skip'
	'commands/source'
	'commands/status'
	'commands/swap'
	'commands/theme'
	'commands/unhook'
	'commands/unlock'
	'commands/vote_ratio'
	'commands/welcome'
	'commands/why_meh'
	'commands/why_woot'
	'commands/woot'
	'commands/zombie'
	'chat_commands'
	'chat'
	'hook_callbacks'
	'hooks'
	'main'
]

task 'build', 'Build single application file from source files', ->
	appContents = new Array remaining = appFiles.length
	for file, index in appFiles then do (file, index) ->
		fs.readFile "src/#{file}.coffee", 'utf8', (err, fileContents) ->
			throw err if err
			appContents[index] = fileContents

			# Copy the files over to lib, then compile them
			fs.writeFile "lib/#{file}.coffee", fileContents, 'utf8', (err) ->
				throw err if err
				exec "coffee --compile --bare lib/#{file}.coffee", (err, stdout, stderr) ->
					throw err if err
					fs.unlink "lib/#{file}.coffee", (err) ->
						throw err if err
			process() if --remaining is 0
	process = ->
		fs.writeFile 'bin/bot.coffee', appContents.join('\n\n'), 'utf8', (err) ->
			throw err if err
			exec 'coffee --compile bin/bot.coffee', (err, stdout, stderr) ->
				throw err if err
				console.log stdout + stderr
				console.log 'Done'