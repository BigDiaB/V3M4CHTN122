local threader = {}
local working
function threader:init()
	local worker
	local thread = {}
	function thread.getStuff(channel_num,should_print)
		local data = love.thread.getChannel(tostring(channel_num)):pop()
		if data ~= nil and data then
			if should_print then
				if type(data) == table then
					terminal.print(data)
				else
					terminal.print(dump(data))
				end
			end
		end
		return data
	end


	function thread.load(code,ARGS)
		working = true
		if type(code) == string then
		worker = love.thread.newThread(code)
	else
		worker = love.thread.newThread(code .. ".lua")
	end
		if not ARGS then
			worker:start()
		elseif #ARGS == 1 then
			worker:start(ARGS[1])
		elseif #ARGS == 2 then
			worker:start(ARGS[1],ARGS[2])
		elseif #ARGS == 3 then
			worker:start(ARGS[1],ARGS[2],ARGS[3])
		end
	end


	function thread.update(dt)
		if working then
		local error = worker:getError()
		assert(not error,error)
	end
	end
	looper.loopMe(thread)
	return thread
end

return threader