local GameLoop = {}
	local insert = table.insert
	local remove = table.remove
function GameLoop:init()
	local gameloop = {}

	gameloop.loopers = {}


	gameloop.loopMe = function(thing)
		insert(gameloop.loopers,thing)
	end
	gameloop.stopMe = function(thing)
		thing.remove_loop = true
		for l,obj in ipairs(gameloop.loopers) do
			if obj.remove_loop then
				remove(gameloop.loopers, l)
			end
		end
	end
	gameloop.update = function(dt)

		for loopers = 1, #gameloop.loopers do 
			if gameloop.loopers[loopers] ~= nil then
				gameloop.loopers[loopers].update(dt)
			end
		end
	end
	return gameloop
end


	return GameLoop