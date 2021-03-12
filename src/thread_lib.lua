local lib = {}

function lib.send(thing,channel_num)
	love.thread.getChannel(tostring(channel_num)):push(thing)
end

function lib.receive(channel_num)
	local data = love.thread.getChannel(tostring(channel_num)):pop()
	return data
end


return lib